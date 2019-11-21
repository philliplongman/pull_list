# == Schema Information
#
# Table name: placements
#
#  id             :bigint           not null, primary key
#  shelf_capacity :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  product_id     :bigint           not null
#  section_id     :bigint           not null
#  size_id        :bigint           not null
#
# Indexes
#
#  index_placements_on_product_id                             (product_id)
#  index_placements_on_section_id                             (section_id)
#  index_placements_on_section_id_and_product_id_and_size_id  (section_id,product_id,size_id) UNIQUE
#  index_placements_on_size_id                                (size_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id) ON DELETE => cascade
#  fk_rails_...  (section_id => sections.id) ON DELETE => cascade
#  fk_rails_...  (size_id => sizes.id) ON DELETE => cascade
#

class Placement < ApplicationRecord
  belongs_to :section
  belongs_to :product
  belongs_to :size

  validates :section,         presence: true
  validates :product,         presence: true
  validates :size,            presence: true
  validates :shelf_capacity,  numericality: { integer: true }
  validates :section,         uniqueness: { scope: %i[product size] }

end
