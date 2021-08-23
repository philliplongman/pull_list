# frozen_string_literal: true

# == Schema Information
#
# Table name: containers
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint           not null
#  size_id    :bigint           not null
#
# Indexes
#
#  index_containers_on_product_id              (product_id)
#  index_containers_on_product_id_and_size_id  (product_id,size_id) UNIQUE
#  index_containers_on_size_id                 (size_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id) ON DELETE => cascade
#  fk_rails_...  (size_id => sizes.id) ON DELETE => cascade
#
require "rails_helper"

RSpec.describe Container, type: :model do
  describe "associations" do
    it { should belong_to(:product) }
    it { should belong_to(:size) }

    it { should have_many(:placements).dependent(:destroy) }
  end

  describe "validations" do
    subject { create :container }

    it { should validate_uniqueness_of(:size_id).scoped_to(:product_id) }
  end
end
