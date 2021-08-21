# frozen_string_literal: true

# == Schema Information
#
# Table name: sections
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_sections_on_name  (name) UNIQUE
#
class Section < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
end
