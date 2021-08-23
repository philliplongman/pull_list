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
class Placement < ApplicationRecord
  AVERAGE_SHELF_CAPACITY = {
    "12 oz"  => 8,
    "20 oz"  => 8,
    "50 ml"  => 10,
    "200 ml" => 14,
    "375 ml" => 10,
    "750 ml" => 7,
    "1.75 L" => 5,
    "2 L"    => 5
  }.freeze

  belongs_to :container
  belongs_to :area

  validates :container_id, uniqueness: { scope: :area_id }

  validates :shelf_capacity, numericality: { only_integer: true, allow_nil: true }

  before_save do
    self.shelf_capacity ||= container.size.description
  end
end
