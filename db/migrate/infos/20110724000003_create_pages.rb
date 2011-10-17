class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :title
      t.string :permalink
      t.string :meta_keywords
      t.string :meta_description
      t.integer :status, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
