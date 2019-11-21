# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  descriptor :string
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  brand_id   :bigint           not null
#
# Indexes
#
#  index_products_on_brand_id                          (brand_id)
#  index_products_on_brand_id_and_name_and_descriptor  (brand_id,name,descriptor) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (brand_id => brands.id) ON DELETE => cascade
#

class Product < ApplicationRecord
  belongs_to :brand

  has_many :placements,     dependent: :destroy
  has_many :products_sizes, dependent: :destroy

  has_many :sections, -> { order :name },         through: :placements
  has_many :sizes,    -> { order :description },  through: :products_sizes

  validates :name, presence: true
  validates :name, uniqueness: { scope: [:brand, :descriptor] }

end
