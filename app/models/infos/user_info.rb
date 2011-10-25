class Infos::UserInfo < InfosDb
  has_many :telephones, :as => :tel_number, :dependent => :destroy
  accepts_nested_attributes_for :telephones, :allow_destroy => true
  
  has_many :emails, :as => :email_data, :dependent => :destroy
  accepts_nested_attributes_for :emails, :allow_destroy => true
  
  has_many :addresses, :as => :address_data, :dependent => :destroy
  accepts_nested_attributes_for :addresses, :allow_destroy => true  
end