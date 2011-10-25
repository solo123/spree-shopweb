class CreateEmployees < ActiveRecord::Migration
  def self.up
    create_table :telephones do |t|
      t.string :tel_number_type
      t.integer :tel_number_id
      t.string :tel_type
      t.string :tel
      t.string :remark
      t.timestamps
    end
    create_table :emails do |t|
      t.string :email_data_type
      t.integer :email_data_id
      t.string :email_address
      t.string :remark
      t.timestamps
    end
    create_table :addresses do |t|
      t.string :address_data_type
      t.integer :address_data_id
      t.string :address1
      t.string :address2
      t.string :zipcode
      t.integer :city_id
      t.integer :usage_type
      t.timestamps
    end
    create_table :companies do |t|
    	t.string :short_name
    	t.string :company_name
    	t.integer :company_type
    	t.string :icon_url
    	t.string :website
    	t.text :description
    	t.integer :status, :default => 0
    	t.timestamps
    end
    create_table :company_accounts do |t|
      t.integer :company_id
      t.decimal :discount, :precision => 8, :scale => 2, :default => 0
      t.decimal :max_credit, :precision => 8, :scale => 2, :default => 0
      t.decimal :balance,  :precision => 8, :scale => 2, :default => 0
      t.timestamps
    end
    create_table :contacts do |t|
      t.integer :company_id
      t.string :contact_name
      t.timestamps
    end
    create_table :employees do |t|
    	t.integer :company_id
    	t.integer :user_info_id
    	t.string :nickname
    	t.datetime :employ_date
    	t.string :ssn
    	t.datetime :birthday
    	t.integer :status, :default => 0
    	t.timestamps
    end
    create_table :user_infos do |t|
    	t.integer :user_id
    	t.string :first_name
    	t.string :last_name
    	t.string :user_type
    	t.integer :user_level, :default => 0
    	t.string :login
    	t.string :pin
    	t.integer :status, :default => 0
    	t.timestamps
    end
  end

  def self.down
    drop_table :telephones
    drop_table :emails
    drop_table :addresses
    drop_table :companies
    drop_table :company_accounts
    drop_table :contacts
    drop_table :employees
    drop_table :user_infos
  end
end
