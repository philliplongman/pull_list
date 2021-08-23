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
require "rails_helper"

RSpec.describe Size, type: :model do
  describe "validations" do
    subject { create :size }

    it { should validate_presence_of(:description) }
    it { should validate_uniqueness_of(:description) }
  end
end
