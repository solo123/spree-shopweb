class CreateDescriptions < ActiveRecord::Migration
  def self.up
    create_table :descriptions do |t|
      t.string :ref_type
      t.integer :ref_id

      t.text :en
      t.text :cn
    end
  end

  def self.down
    drop_table :descriptions
  end
end
