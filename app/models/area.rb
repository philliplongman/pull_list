# == Schema Information
#
# Table name: areas
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  timestamps :string
#
# Indexes
#
#  index_areas_on_name  (name) UNIQUE
#

class Area < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

end
