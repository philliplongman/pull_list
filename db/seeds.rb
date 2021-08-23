# frozen_string_literal: true

require "csv"

say "Seeding database"

managers = [
  { name: "Dennis Lenaios", email: "winedad@gmail.com" },
  { name: "Brigid Brewer",  email: "bri.from.kildare@gmail.com" },
  { name: "Jen Sloe",       email: "jenever.sloe@gmail.com" }
]

managers.each do |info|
  Manager.find_or_create_by!(info) do |manager|
    manager.password = "password"
  end
end

placements_data = Rails.root.join("db/seed_data.csv")

CSV.foreach(placements_data, headers: true) do |row|
  section = Section.find_or_create_by!(name: row["section.name"])
  area    = Area.find_or_create_by!(name: row["area.name"], section: section)
  brand   = Brand.find_or_create_by!(name: row["brand.name"])

  product = Product.find_or_create_by!(
    brand:   brand,
    name:    row["product.name"],
    variety: row["product.variety"]
  )

  size      = Size.find_or_create_by!(description: row["placement.size"])
  container = Container.find_or_create_by!(product: product, size: size)

  Placement.find_or_create_by!(area: area, container: container)
end
