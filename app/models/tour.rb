class Tour < InfosDb
  has_one :description, :as => :desc_data, :dependent => :destroy
  accepts_nested_attributes_for :description, :allow_destroy => true
  has_many :spots, :order => 'visit_day, visit_order'
  
  has_one :tour_setting, :dependent => :destroy
  accepts_nested_attributes_for :tour_setting, :allow_destroy => true
  has_one :tour_price, :dependent => :destroy
  accepts_nested_attributes_for :tour_price, :allow_destroy => true
  
  has_many :schedules, :conditions => ['departure_date > ?', Date.today + 1]
end
