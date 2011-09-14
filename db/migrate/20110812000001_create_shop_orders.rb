class CreateShopOrders < ActiveRecord::Migration
  def self.connection
    OperatesDb.connection
  end
  def self.up
    create_table :shop_orders do |t|
      t.integer :user_id
      t.string :number
      t.string :user_name
      t.integer :bill_address_id
      t.string :special_instructions
      t.string :order_type
      t.string :state
      t.datetime :completed_at
      t.timestamps
    end
    create_table :order_details do |t|
      t.integer :shop_order_id
      t.integer :schedule_id
      t.integer :num_rooms
      t.integer :num_adult
      t.integer :num_child
      t.integer :item_total
      t.decimal :total, :precision => 8, :scale => 2
      t.decimal :adjustment_total, :precision => 8, :scale => 2
      t.decimal :credit_total, :precision => 8, :scale => 2
      t.decimal :payment_total, :precision => 8, :scale => 2
      t.timestamps
    end
    create_table :order_items do |t|
      t.integer :shop_order_id
      t.string :title
      t.string :remark
      t.decimal :amount, :precision => 8, :scale => 2
      t.integer :status, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :shop_orders
    drop_table :order_amounts
    drop_table :order_items
  end
end
