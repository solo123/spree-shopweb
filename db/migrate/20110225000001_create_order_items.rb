class CreateOrderItems < ActiveRecord::Migration
  def self.up
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :tour_id
      t.integer :schedule_id
      t.decimal :fare, :precision => 8, :scale => 2, :defalut => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :order_items
  end
end
