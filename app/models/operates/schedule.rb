class Operates::Schedule < OperatesDb
  belongs_to :tour, :class_name => 'Infos::Tour'
  has_many :assignments, :class_name => 'Operates::ScheduleAssignment'
  accepts_nested_attributes_for :assignments, :reject_if => :all_blank
  
  has_one :price, :class_name => 'Operates::SchedulePrice'
  accepts_nested_attributes_for :price
  
end
