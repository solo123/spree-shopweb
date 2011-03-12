class CreateSchedules < ActiveRecord::Migration
  def self.up
    create_table :schedules do |t|
      t.integer :tour_id
      t.datetime :start_date
      t.datetime :end_date
      t.integer :vehicle_id
      t.integer :max_seats
      t.integer :driver_id
      t.integer :driver_assistance_id
      t.integer :tour_guide_id
      t.integer :tour_guide_assistance_id
      t.integer :book_customer
      t.integer :actual_customer
      t.integer :actual_rooms
      t.integer :adult_price
      t.integer :child_price
      t.integer :sales_amount
      t.integer :create_mode
      t.string :hotels
      t.integer :max_web_seats
      t.integer :has_seat_table
      t.integer :status

      t.timestamps
    end
  end

  def self.down
    drop_table :schedules
  end
end
