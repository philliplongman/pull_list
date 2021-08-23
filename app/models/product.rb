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
class Product < ApplicationRecord
  belongs_to :brand

  has_many :containers, dependent: :destroy

  has_many :sizes, through: :containers

  validates :name, presence: true
  validates :name, uniqueness: { scope: [:brand_id, :variety] }

  scope :alphabetical, -> { order :name, :variety }
end
