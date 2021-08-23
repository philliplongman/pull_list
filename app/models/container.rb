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
class Container < ApplicationRecord
  belongs_to :product
  belongs_to :size

  has_many :placements, dependent: :destroy

  validates :size_id, uniqueness: { scope: :product_id }
end
