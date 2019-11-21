# == Schema Information
#
# Table name: sections
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  area_id    :bigint           not null
#
# Indexes
#
#  index_sections_on_area_id  (area_id)
#  index_sections_on_name     (name) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (area_id => areas.id) ON DELETE => cascade
#

class Section < ApplicationRecord
  belongs_to :area

  has_many :placements, dependent: :destroy

  has_many :products, -> { order :name, :descriptor },  through: :placements
  has_many :sizes,    -> { order :description },        through: :placements


  validates :name, presence: true
  validates :name, uniqueness: true

end
