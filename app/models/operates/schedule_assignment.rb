class Operates::ScheduleAssignment < OperatesDb
  belongs_to :schedule
  belongs_to :bus, :class_name => 'Infos::Bus'
  belongs_to :driver, :class_name => 'Infos::Employee'
  belongs_to :driver_assistance, :class_name => 'Infos::Employee'
  belongs_to :tour_guide, :class_name => 'Infos::Employee'
  belongs_to :tour_guide_assistance, :class_name => 'Infos::Employee'
  
  has_many :seats, :class_name => 'Operates::BusSeat'
  
  def total_seats
    if bus_id
      10
    else
      57
    end
  end
end
