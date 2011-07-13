class CreateDestinations < ActiveRecord::Migration
  def self.up
    create_table :destinations do |t|
    	t.integer :title_pic
    	t.string :title
    	t.string :title_cn
    	t.integer :location_id
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
    	t.string :abbr
    	t.string :title
    	t.string :title_cn
    end
    create_table :photos do |t|
    	t.string :ref_type
    	t.integer :ref_id
    	t.integer :show_order
    	t.string :title
    	t.string :title_cn
    	t.integer :status
    	t.timestamps
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
    create_table :destinations_tours, :id => false do |t|
    	t.integer :tour_id
    	t.integer :destination_id
    	t.integer :visit_order
    	t.integer :visit_day
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
    create_table :hotels do |t|
    	t.integer :icon_id
    	t.string :title
    	t.string :title_cn
    	t.integer :star_rated
    	t.decimal :price, :precision => 8, :scale => 2
    	t.string :contact_info
    	t.string :remark
    	t.integer :status, :default => 0
    	t.timestamps
    end
    create_table :hotels_schedules, :id => false do |t|
    	t.integer :hotel_id
    	t.integer :schedule_id
    	t.integer :night
    end
    create_table :hotels_tours, :id => false do |t|
    	t.integer :hotel_id
    	t.integer :tour_id
    	t.integer :night
    end
    
  end

  def self.down
    drop_table :destinations
    drop_table :descriptions
    drop_table :locations
    drop_table :photos
    drop_table :tours
    drop_table :destinations_tours
    drop_table :schedules
    drop_table :hotels
    drop_table :hotels_schedules
    drop_table :hotels_tours
  end
end
