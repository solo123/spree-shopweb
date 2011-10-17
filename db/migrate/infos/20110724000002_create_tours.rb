class CreateTours < ActiveRecord::Migration
  def self.up
    create_table :tours do |t|
    	t.string :title
    	t.string :title_cn
    	t.integer :days, :default => 0
    	t.integer :tour_type, :default => 0
    	t.integer :title_photo_id
    	t.integer :status, :default => 0
    	t.timestamps
    end
    create_table :tour_routes do |t|
    	t.integer :tour_id
    	t.integer :destination_id
    	t.integer :visit_day
      t.integer :visit_order
    	t.integer :status, :default => 0
    	t.timestamps
    end
    create_table :tour_prices do |t|
      t.integer :tour_id
      t.decimal :price_adult, :precision => 8, :scale => 2
      t.decimal :price_child, :precision => 8, :scale => 2
      t.decimal :price1, :precision => 8, :scale => 2
      t.decimal :price2, :precision => 8, :scale => 2
      t.decimal :price3, :precision => 8, :scale => 2
      t.decimal :price4, :precision => 8, :scale => 2
      t.timestamps
    end
    create_table :tour_settings do |t|
      t.integer :tour_id
      t.integer :is_auto_gen, :default => 0
      t.string :weekly
      t.integer :has_seat_table, :default => 0
      t.integer :is_float_price, :default => 0
      t.integer :available_days, :default => 0
      t.datetime :last_schedule_date
      t.timestamps
    end
  end

  def self.down
    drop_table :tours
    drop_table :tour_routes
    drop_table :tour_prices
    drop_table :tour_settings
  end
end
