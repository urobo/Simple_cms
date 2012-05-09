class CreateAdminUsersPagesJoin < ActiveRecord::Migration
  def up
  	create_table :admin_users_pages do |t|
  		t.references :admin_user
  		t.references :page
  	end
  	add_index :admin_users_pages, ["admin_user_id","page_id"]
  end

  def down
  	drop_table :admin_users_pages
  end
end
