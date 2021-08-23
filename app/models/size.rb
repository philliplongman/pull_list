# frozen_string_literal: true

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
  validates :description, presence: true
  validates :description, uniqueness: true
end
