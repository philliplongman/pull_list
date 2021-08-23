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
FactoryBot.define do
  factory :placement do
    container
    area
  end
end
