class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string "name"
      t.integer "position"
      t.boolean "content_type"
      t.text "content"
      t.references :page
      t.timestamps
    end
    add_index("sections","page_id")
  end
end
