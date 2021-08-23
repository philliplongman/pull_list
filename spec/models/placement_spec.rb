# frozen_string_literal: true

# == Schema Information
#
# Table name: placements
#
#  id             :bigint           not null, primary key
#  shelf_capacity :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  area_id        :bigint           not null
#  container_id   :bigint           not null
#
# Indexes
#
#  index_placements_on_area_id                   (area_id)
#  index_placements_on_area_id_and_container_id  (area_id,container_id) UNIQUE
#  index_placements_on_container_id              (container_id)
#
# Foreign Keys
#
#  fk_rails_...  (area_id => areas.id) ON DELETE => cascade
#  fk_rails_...  (container_id => containers.id) ON DELETE => cascade
#
require "rails_helper"

RSpec.describe Placement, type: :model do
  describe "associations" do
    it { should belong_to(:container) }
    it { should belong_to(:area) }
  end

  describe "validations" do
    subject { create :placement }

    it { should validate_uniqueness_of(:container_id).scoped_to(:area_id) }

    it { should validate_numericality_of(:shelf_capacity).only_integer.allow_nil }
  end

  describe "callbacks" do
    describe "before_save" do
      it "assigns average shelf capacity if a value isn't specified" do
        area      = create :area
        size      = create :size, description: "50 ml"
        container = build :container, size: size
        subject   = described_class.new container: container, area: area

        expect(subject.shelf_capacity).to be_nil

        subject.save!

        expect(subject.shelf_capacity).to be_an Integer
      end
    end
  end
end
