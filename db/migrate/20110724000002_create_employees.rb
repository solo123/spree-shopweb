class CreateEmployees < ActiveRecord::Migration
  def self.connection
    InfosDb.connection
  end

  def self.up
    create_table :companies do |t|
    	t.string :short_name
    	t.string :company_name
    	t.integer :address_id
    	t.string :telephone
    	t.string :fax
    	t.string :contact_person
    	t.string :email
    	t.integer :company_type
    	t.string :icon_url
    	t.string :website
    	t.text :description
    	t.decimal :discount, :precision => 8, :scale => 2, :default => 0
    	t.decimal :max_credit, :precision => 8, :scale => 2, :default => 0
    	t.decimal :balance,  :precision => 8, :scale => 2, :default => 0
    	t.integer :status, :default => 0
    	t.timestamps
    end
    create_table :employees do |t|
    	t.integer :company_id
    	t.integer :user_id
    	t.string :nickname
    	t.datetime :employ_date
    	t.string :ssn
    	t.datetime :birthday
    	t.integer :status, :default => 0
    	t.timestamps
    end
    create_table :user_infos do |t|
    	t.integer :user_id
    	t.integer :address_id
    	t.string :first_name
    	t.string :last_name
    	t.string :telephone
    	t.string :email
    	t.string :mail_list
    	t.string :user_type
    	t.integer :status, :default => 0
    	t.timestamps
    end
  end

  def self.down
    drop_table :companies
    drop_table :employees
    drop_table :user_infos
  end
end
