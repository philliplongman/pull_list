# == Schema Information
#
# Table name: sections_products
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint           not null
#  section_id :bigint           not null
#
# Indexes
#
#  index_sections_products_on_product_id                 (product_id)
#  index_sections_products_on_section_id                 (section_id)
#  index_sections_products_on_section_id_and_product_id  (section_id,product_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id) ON DELETE => cascade
#  fk_rails_...  (section_id => sections.id) ON DELETE => cascade
#

class SectionsProduct < ApplicationRecord
  belongs_to :section
  belongs_to :product

  validates :section, presence: true
  validates :product, presence: true
  validates :product, uniqueness: { scope: :section }

end
