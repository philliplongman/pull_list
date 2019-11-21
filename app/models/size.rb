# == Schema Information
#
# Table name: sizes
#
#  id          :bigint           not null, primary key
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_sizes_on_description  (description) UNIQUE
#

class Size < ApplicationRecord
  has_many :sections_sizes, dependent: :destroy
  has_many :sections, through: :sections_sizes

  validates :description, presence: true
  validates :description, uniqueness: true

end
