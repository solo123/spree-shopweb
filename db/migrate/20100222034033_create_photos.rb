class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.integer :ref_id
      t.string :ref_type
      t.string :title
      t.string :title_cn
      t.integer :show_order
      t.integer :status

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
