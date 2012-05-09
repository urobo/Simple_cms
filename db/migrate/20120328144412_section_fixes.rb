class SectionFixes < ActiveRecord::Migration
  def up
  	add_column :sections, :visible, :boolean, :default => false
  	change_column :sections, :content_type, :string
  end

  def down
  	change_column :sections, :content_type, :boolean
  	remove_column :sections, :visible
  end
end
