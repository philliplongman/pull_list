# == Schema Information
#
# Table name: areas
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_areas_on_name  (name) UNIQUE
#

class Area < ApplicationRecord
  has_many :sections, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true

end
