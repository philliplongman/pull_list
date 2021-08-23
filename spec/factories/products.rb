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
FactoryBot.define do
  sequence(:product_name) { |n| "Product #{n}" }
  sequence(:variety) { |n| "Flavor #{n}" }

  factory :product do
    brand
    name { generate :product_name }
    variety
  end
end
