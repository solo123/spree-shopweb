class CreateDestinations < ActiveRecord::Migration
  def self.connection
    InfosDb.connection
  end
  def self.up
    create_table :destinations do |t|
    	t.string :title
    	t.string :title_cn
    	t.integer :location_id
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
    create_table :locations do |t|
      t.integer :parent_id
    	t.string :abbr
    	t.string :title
    	t.string :title_cn
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
