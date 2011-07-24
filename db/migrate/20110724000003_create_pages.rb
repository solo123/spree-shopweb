class CreatePages < ActiveRecord::Migration
  def self.connection
    InfosDb.connection
  end

  def self.up
    create_table :pages do |t|
      t.string :title
      t.text :body
      t.integer :is_active
      t.string :permalink
      t.datetime :publish_at
      t.string :meta_keywords
      t.string :meta_description
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
    create_table :vehicles do |t|
      t.string :vehicle_name
      t.string :vehicle_type
      t.integer :seat_num
      t.string :plate_number
      t.string :vin_number
      t.datetime :inspection_date
      t.string :notes
      t.integer :is_own
      t.integer :status, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :pages
    drop_table :hotels
    drop_table :hotels_schedules
    drop_table :hotels_tours
    drop_table :vehicles
  end
end
