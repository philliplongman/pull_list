# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  variety    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  brand_id   :bigint           not null
#
# Indexes
#
#  index_products_on_brand_id                       (brand_id)
#  index_products_on_brand_id_and_name_and_variety  (brand_id,name,variety) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (brand_id => brands.id) ON DELETE => cascade
#
require "rails_helper"

RSpec.describe Product, type: :model do
  describe "associations" do
    it { should belong_to(:brand) }
  end

  describe "validations" do
    subject { create :product }

    it { should validate_presence_of(:name) }

    it "validates the uniqueness of name/variety combo, scoped to brand" do
      absolut  = create :brand, name: "Absolut"
      smirnoff = create :brand, name: "Smirnoff"

      _absolut_vodka   = described_class.create!(brand: absolut, name: "Vodka")
      _absolut_vanilla = described_class.create!(brand: absolut, name: "Vodka", variety: "Vanilla")
      _absolut_citrus  = described_class.create!(brand: absolut, name: "Vodka", variety: "Citrus")
      _absolut_gin     = described_class.create!(brand: absolut, name: "Gin", variety: "Citrus")
      _smirnoff_vodka  = described_class.create!(brand: smirnoff, name: "Vodka")

      absolut_copy      = described_class.new(brand: absolut, name: "Vodka")
      absolut_duplicate = described_class.new(brand: absolut, name: "Vodka", variety: "Vanilla")

      expect(absolut_copy).to be_invalid
      expect(absolut_duplicate).to be_invalid
    end
  end
end
