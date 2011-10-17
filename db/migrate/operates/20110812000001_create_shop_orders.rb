class CreateShopOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :customer_id
      t.string :customer_name
      t.string :order_number
      t.string :order_type
      t.integer :order_related_id
      t.string :special_instructions
      t.integer :bill_address_id
      t.string :state
      t.datetime :completed_at
      t.timestamps
    end
    create_table :order_prices do |t|
      t.integer :order_id
      t.integer :num_rooms
      t.integer :num_adult
      t.integer :num_child
      t.integer :num_total
      t.decimal :total_amount, :precision => 8, :scale => 2, :default => 0
      t.decimal :adjustment_amount, :precision => 8, :scale => 2, :default => 0
      t.decimal :credit_amount, :precision => 8, :scale => 2, :default => 0
      t.decimal :payment_amount, :precision => 8, :scale => 2, :default => 0
      t.decimal :balance_amount, :precision => 8, :scale => 2, :default => 0
      t.timestamps
    end
    create_table :order_operates do |t|
      t.integer :order_id
      t.integer :created_by
      t.integer :last_operator
      t.integer :last_payment
      t.timestamps
    end
    create_table :order_items do |t|
      t.integer :order_id
      t.string :room_number
      t.integer :num_adult, :default => 0
      t.integer :num_child, :default => 0
      t.integer :num_total, :default => 0
      t.decimal :amount, :precision => 8, :scale => 2, :default => 0
      t.string :remark
      t.timestamps
    end
  end

  def self.down
    drop_table :orders
    drop_table :order_prices
    drop_table :order_operates
    drop_table :order_items
  end
end
