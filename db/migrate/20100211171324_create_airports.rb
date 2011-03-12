class CreateAirports < ActiveRecord::Migration
  def self.up
    create_table :airports do |t|
      t.string :IATA
      t.string :ICAO
      t.string :FAA
      t.string :location
      t.string :airport
      t.string :country

      t.timestamps
    end
  end

  def self.down
    drop_table :airports
  end
end
