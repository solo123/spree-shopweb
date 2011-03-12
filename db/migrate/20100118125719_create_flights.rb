class CreateFlights < ActiveRecord::Migration
  def self.up
    create_table :flights do |t|
      t.string :airport_from
      t.string :airport_to
      t.string :airline
      t.string :flight
      t.boolean :is_round_trip
      t.boolean :is_nonstop
      t.integer :price_adult
      t.integer :price_child
      t.string :notes
      t.integer :status

      t.timestamps
    end
  end

  def self.down
    drop_table :flights
  end
end
