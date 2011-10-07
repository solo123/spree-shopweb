class Infos::UserInfo < InfosDb
  has_many :telephones, :as => :tel_number, :dependent => :destroy
  accepts_nested_attributes_for :telephones, :allow_destroy => true
  
  has_many :emails, :as => :email_data, :dependent => :destroy
  accepts_nested_attributes_for :emails, :allow_destroy => true
  
  has_many :t_addresses, :as => :address_data, :dependent => :destroy
  accepts_nested_attributes_for :t_addresses, :allow_destroy => true  
end