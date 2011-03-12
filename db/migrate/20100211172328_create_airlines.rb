class CreateAirlines < ActiveRecord::Migration
  def self.up
    create_table :airlines do |t|
      t.string :IATA
      t.string :ICAO
      t.string :airline
      t.string :country
      t.string :callsign

      t.timestamps
    end
  end

  def self.down
    drop_table :airlines
  end
end
