class CreateRoomItems < ActiveRecord::Migration
  def self.up
    create_table :room_items do |t|
      t.integer :order_item_id
      t.integer :adult_num
      t.integer :child_num
      t.string :names
      t.timestamps
    end
  end

  def self.down
    drop_table :room_items
  end
end
