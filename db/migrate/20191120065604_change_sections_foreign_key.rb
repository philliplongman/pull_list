class ChangeSectionsForeignKey < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :sections, :areas
    add_foreign_key :sections, :areas, on_delete: :cascade
  end
end
