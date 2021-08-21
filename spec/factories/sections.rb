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
FactoryBot.define do
  sequence(:section_name) { |n| "Section #{n}" }

  factory :section do
    name { generate :section_name }
  end
end
