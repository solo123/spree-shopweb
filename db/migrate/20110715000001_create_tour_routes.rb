class CreateTourRoutes < ActiveRecord::Migration
  def self.up
    create_table :tour_routes do |t|
      t.integer :tour_id
      t.integer :visit_day
      t.integer :visit_order
      t.integer :destination_id
      t.integer :status, :default => 0
      t.integer :edited_by
      t.timestamps
    end
  end

  def self.down
    drop_table :tour_routes
  end
end
