# == Schema Information
#
# Table name: sections
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  timestamps :string
#  area_id    :bigint           not null
#
# Indexes
#
#  index_sections_on_area_id  (area_id)
#  index_sections_on_name     (name) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (area_id => areas.id)
#

class Section < ApplicationRecord
  belongs_to :area

  has_many :sections_products,  dependant: :destroy
  has_many :sections_sizes,     dependant: :destory

  has_many :products, -> { order :name }, through: :sections_products
  has_many :sizes,    -> { order :name }, through: :sections_sizes

  validates :name, presence: true
  validates :name, uniqueness: true

end
