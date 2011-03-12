class CreateDestinations < ActiveRecord::Migration
  def self.up
    create_table :destinations do |t|
      t.integer :title_pic
      t.string :title
      t.string :title_cn
      t.string :city
      t.string :state
      t.string :country
      t.integer :status

      t.timestamps
    end
  end

  def self.down
    drop_table :destinations
  end
end
