class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string "name"
      t.string "permalink"
      t.integer "position"
      t.boolean "visible", :default => false
      t.references :subject
      t.timestamps
    end
    add_index("pages","subject_id")
    add_index("pages","permalink")
  end
end
