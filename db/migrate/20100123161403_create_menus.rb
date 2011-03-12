class CreateMenus < ActiveRecord::Migration
  def self.up
    create_table :menus do |t|
      t.string :title
      t.string :description
      t.integer :show_order
      t.integer :parent_id
      t.string :page_url
      t.string :page_name
      t.string :role_ids
      t.string :position_ids
      t.integer :need_confirm
      t.string :confirm_message
      t.integer :menu_type
      t.integer :app_type
      t.integer :status

      t.timestamps
    end
  end

  def self.down
    drop_table :menus
  end
end
