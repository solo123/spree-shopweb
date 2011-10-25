class Infos::Tour < InfosDb
  has_one :description, :as => :desc_data, :dependent => :destroy
  accepts_nested_attributes_for :description, :allow_destroy => true
  has_many :spots, :order => 'visit_day, visit_order'
  belongs_to :title_photo, :class_name => 'Infos::Photo'
  
  has_one :tour_setting, :dependent => :destroy
  accepts_nested_attributes_for :tour_setting, :allow_destroy => true
  has_one :tour_price, :dependent => :destroy
  accepts_nested_attributes_for :tour_price, :allow_destroy => true
  
  has_many :schedules, :class_name => 'Operates::Schedule'
  has_many :active_schedules, :class_name => 'Operates::Schedule', :conditions => ['departure_date > ?', Date.today + 1]
  
  def gen_schedule(day)
    return if !day || self.schedules.exists?(:departure_date => day)
    
    s = self.schedules.build
    s.departure_date = day
    s.return_date = day + days
    s.status = 1
    p = s.build_price
    if self.tour_price
      tp = self.tour_price
      p.price_adult = tp.price_adult
      p.price_child = tp.price_child
      p.price1 = tp.price1
      p.price2 = tp.price2
      p.price3 = tp.price3
      p.price4 = tp.price4
    end
    s.save    
  end
    
end
