# frozen_string_literal: true

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
FactoryBot.define do
  sequence(:brand_name) { |n| "Brand #{n}" }

  factory :brand do
    name { generate :brand_name }
  end
end
