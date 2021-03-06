# == Schema Information
#
# Table name: brands
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_brands_on_name  (name) UNIQUE
#

class Brand < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :products, -> { order :name, :descriptor }, dependent: :destroy

end
