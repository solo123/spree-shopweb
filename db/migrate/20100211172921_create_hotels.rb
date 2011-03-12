class CreateHotels < ActiveRecord::Migration
  def self.up
    create_table :hotels do |t|
      t.string :name
      t.integer :icon
      t.decimal :stars, :precision =>3, :scale => 1
      t.string :price_info
      t.string :contact
      t.integer :status

      t.timestamps
    end
  end

  def self.down
    drop_table :hotels
  end
end
