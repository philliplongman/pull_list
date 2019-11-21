require "csv"

say "Seeding database"

managers = [
  { name: "Dennis Vinter", email: "wine.dad@gmail.com" },
  { name: "Brigid Brewer", email: "bri.from.kildare@gmail.com" },
  { name: "Jen Sloe", email: "jenever.sloe@gmail.com" }
]

managers.each do |info|
  Manager.find_or_create_by!(info) do |m|
    m.password = "password1234"
    m.password_confirmation = "password1234"
    m.save!
  end
end

products_data = Rails.root.join("db/seed_products_data.csv")

CSV.foreach(products_data, headers: true) do |row|
  area    = Area.find_or_create_by!(name: row["area.name"])
  section = Section.find_or_create_by!(name: row["section.name"], area: area)
  brand   = Brand.find_or_create_by!(name: row["brand.name"])

  product = Product.find_or_create_by!(
    name:       row["product.name"],
    descriptor: row["product.descriptor"],
    brand:      brand
  )

  sizes = row["placement.sizes"].split(", ").map do |size|
    Size.find_or_create_by!(description: size) do |s|
      s.average_shelf_capacity =
        case s.description
        when "50 ml", "375 ml"  then 10
        when "200 ml"           then 14
        when "750 ml"           then 7
        when "1.75 L", "2 L"    then 5
        when "12 oz", "20 oz"   then 8
        end
      s.save!
    end
  end

  sizes.each do |size|
    ProductsSize.find_or_create_by!(product: product, size: size)

    Placement.find_or_create_by!(
      section:        section,
      product:        product,
      size:           size,
      shelf_capacity: size.average_shelf_capacity || nil
    )
  end
end
