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
FactoryBot.define do
  sequence(:size_description) { |n| "#{n * 50} ml" }

  factory :size do
    description { generate :size_description }
  end
end
