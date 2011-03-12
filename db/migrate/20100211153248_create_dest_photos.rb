class CreateDestPhotos < ActiveRecord::Migration
  def self.up
    create_table :dest_photos do |t|
      t.integer :destination_id
      t.integer :show_order
      t.string :title
      t.string :title_cn
      t.integer :status

      t.timestamps
    end
  end

  def self.down
    drop_table :dest_photos
  end
end
