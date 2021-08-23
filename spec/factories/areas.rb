# frozen_string_literal: true

# == Schema Information
#
# Table name: areas
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  section_id :bigint           not null
#
# Indexes
#
#  index_areas_on_name        (name) UNIQUE
#  index_areas_on_section_id  (section_id)
#
# Foreign Keys
#
#  fk_rails_...  (section_id => sections.id) ON DELETE => cascade
#
FactoryBot.define do
  sequence(:area_name) { |n| "Area #{n}" }

  factory :area do
    section
    name { generate :area_name }
  end
end
