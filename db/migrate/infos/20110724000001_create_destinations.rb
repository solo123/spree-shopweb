class CreateDestinations < ActiveRecord::Migration
  def self.up
    create_table :destinations do |t|
    	t.string :title
    	t.string :title_cn
    	t.integer :city_id
    	t.integer :title_photo_id
    	t.integer :status
    	t.timestamps
    end
    create_table :descriptions do |t|
    	t.string :desc_data_type
    	t.integer :desc_data_id
    	t.text :en
    	t.text :cn
    	t.timestamps
    end
    create_table :cities do |t|
      t.string :city
      t.string :state
      t.string :country
      t.integer :status, :default => 0
    end
    create_table :photos do |t|
      t.string :photo_data_type
      t.integer :photo_data_id
      t.string :photoset
      t.string :photo_s
      t.string :photo_t
      t.string :photo_m
      t.string :photo_b
      t.timestamps
    end
  end

  def self.down
    drop_table :destinations
    drop_table :descriptions
    drop_table :locations
    drop_table :photos
  end
end
