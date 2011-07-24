class CreateTours < ActiveRecord::Migration
  def self.connection
    InfosDb.connection
  end
  def self.up
    create_table :destinations do |t|
    	t.string :title
    	t.string :title_cn
    	t.integer :location_id
      t.string :title_photo
      t.string :photoset
    	t.integer :status
    	t.timestamps
    end
    create_table :descriptions do |t|
    	t.string :ref_type
    	t.integer :ref_id
    	t.text :en
    	t.text :cn
    	t.timestamps
    end
    create_table :locations do |t|
      t.integer :parent_id
    	t.string :abbr
    	t.string :title
    	t.string :title_cn
    end
    create_table :tours do |t|
    	t.string :title
    	t.string :title_cn
    	t.integer :days, :default => 0
    	t.integer :tour_type, :default => 0
    	t.integer :is_auto_gen, :default => 0
    	t.string :weekly
    	t.decimal :price_adult, :precision => 8, :scale => 2
    	t.decimal :price_child, :precision => 8, :scale => 2
    	t.integer :has_seat_table, :default => 0
    	t.integer :is_float_price, :default => 0
    	t.decimal :price1, :precision => 8, :scale => 2
    	t.decimal :price2, :precision => 8, :scale => 2
    	t.decimal :price3, :precision => 8, :scale => 2
    	t.decimal :price4, :precision => 8, :scale => 2
    	t.integer :status, :default => 0
    	t.timestamps
    end
    create_table :tour_routes, :id => false do |t|
    	t.integer :tour_id
    	t.integer :destination_id
    	t.integer :visit_day
      t.integer :visit_order
    	t.integer :status, :default => 0
    	t.integer :edited_by, :default => 0
    	t.timestamps
    end
    create_table :schedules do |t|
    	t.integer :tour_id
    	t.string :title
    	t.datetime :departure_date
    	t.datetime :return_date
    	t.integer :vehicle_id
    	t.integer :max_seats
    	t.integer :driver_id
    	t.integer :driver_assistance_id
    	t.integer :tour_guide_id
    	t.integer :tour_guide_assistance_id
    	t.integer :book_customers
    	t.integer :actual_customers
    	t.integer :actual_rooms
    	t.decimal :price_adult, :precision => 8, :scale => 2
    	t.decimal :price_child, :precision => 8, :scale => 2
    	t.decimal :price1, :precision => 8, :scale => 2
    	t.decimal :price2, :precision => 8, :scale => 2
    	t.decimal :price3, :precision => 8, :scale => 2
    	t.decimal :price4, :precision => 8, :scale => 2
    	t.integer :created_by, :default => 0
    	t.timestamps
    end

    
  end

  def self.down
    drop_table :destinations
    drop_table :descriptions
    drop_table :locations
    drop_table :tours
    drop_table :tour_routes
    drop_table :schedules
  end
end
