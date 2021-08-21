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
require "rails_helper"

RSpec.describe Section, type: :model do
  describe "validations" do
    subject { create :section }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end
