class CreateBuses < ActiveRecord::Migration
  def self.up
    create_table :buses do |t|
      t.string :name
      t.string :type
      t.integer :seats
      t.string :plate_number
      t.string :vin_number
      t.date :inspection_date
      t.string :remark
      t.integer :is_own
      t.integer :status, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :buses
  end
end
