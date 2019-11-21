# == Schema Information
#
# Table name: sizes
#
#  id                     :bigint           not null, primary key
#  average_shelf_capacity :integer
#  description            :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_sizes_on_description  (description) UNIQUE
#

class Size < ApplicationRecord
  has_many :placements,     dependent: :destroy
  has_many :products_sizes, dependent: :destroy

  has_many :products, -> { order :name, :descriptor },  through: :products_sizes
  has_many :sections, -> { order :name },               through: :placements

  validates :description,             presence: true
  validates :description,             uniqueness: true
  validates :average_shelf_capacity,  numericality: { only_integer: true, allow_nil: true }

end
