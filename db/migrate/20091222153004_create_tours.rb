class CreateTours < ActiveRecord::Migration
  def self.up
    create_table :tours do |t|
      t.string :name
      t.string :name_cn
      t.integer :show_order
      t.integer :days
      t.integer :tour_type
      t.integer :auto_gen_schedule
      t.string :weekly
      t.integer :price_adult, :default => 0
      t.integer :price_child, :default => 0
      t.integer :has_seat_table, :default => 0
      t.integer :is_float_price, :default => 0
      t.integer :status, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :tours
  end
end
