class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :title
      t.text :body;
      t.integer :is_active
      t.string :permalink
      t.datetime :publish_at
      t.string :meta_keywords
      t.string :meta_description
      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
