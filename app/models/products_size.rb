# == Schema Information
#
# Table name: products_sizes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint           not null
#  size_id    :bigint           not null
#
# Indexes
#
#  index_products_sizes_on_product_id              (product_id)
#  index_products_sizes_on_product_id_and_size_id  (product_id,size_id) UNIQUE
#  index_products_sizes_on_size_id                 (size_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id) ON DELETE => cascade
#  fk_rails_...  (size_id => sizes.id) ON DELETE => cascade
#

class ProductsSize < ApplicationRecord
  belongs_to :product
  belongs_to :size

  validates :product, presence: true
  validates :size,    presence: true
  validates :size,    uniqueness: { scope: :product }

end
