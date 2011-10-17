class Operates::Schedule < OperatesDb
  belongs_to :tour, :class_name => 'Infos::Tour'
  has_many :assignments, :class_name => 'Operates::ScheduleAssignment'
  has_one :price, :class_name => 'Operates::SchedulePrice'
  
  def self.gen(tour, day)
    return if !tour || !day
    range = day..day+1 
    return if Operates::Schedule.exists?(:tour_id => tour.id, :departure_date => range)
    
    s = Operates::Schedule.new
    s.tour = tour
    s.title = ''
    s.departure_date = day
    s.return_date = day.to_date + tour.days
    s.status = 1
    s.build_price
    if tour.tour_price
      s.price.price_adult = tour.tour_price.price_adult
      s.price.price_child = tour.tour_price.price_child
      s.price.price1 = tour.tour_price.price1
      s.price.price2 = tour.tour_price.price2
      s.price.price3 = tour.tour_price.price3
      s.price.price4 = tour.tour_price.price4
    end
    s.save    
  end
end
