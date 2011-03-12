class CreateTourPoints < ActiveRecord::Migration
  def self.up
    create_table :tour_points do |t|
      t.integer :tour_id
      t.integer :destination_id
      t.integer :visit_day
      t.integer :visit_order
      t.integer :status, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :tour_points
  end
end
