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
require "rails_helper"

RSpec.describe Area, type: :model do
  describe "associations" do
    it { should belong_to(:section) }
  end

  describe "validations" do
    subject { create :area }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end
