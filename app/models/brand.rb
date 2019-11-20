# == Schema Information
#
# Table name: brands
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  timestamps :string
#
# Indexes
#
#  index_brands_on_name  (name) UNIQUE
#

class Brand < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

end
