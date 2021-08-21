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
require "rails_helper"

RSpec.describe Brand, type: :model do
  describe "validations" do
    subject { create :brand }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end
