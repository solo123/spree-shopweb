class CreateVehicles < ActiveRecord::Migration
  def self.up
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
    drop_table :vehicles
  end
end
