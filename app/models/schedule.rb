class Schedule < OperatesDb
  belongs_to :tour
  has_one :schedule_assignment
  has_one :schedule_price
  
  def self.gen(tour, day)
    return if !tour || !day
    range = day..day+1 
    return if Schedule.exists?(:tour_id => tour.id, :departure_date => range)
    
    s = Schedule.new
    s.tour = tour
    s.title = ''
    s.departure_date = day
    s.return_date = day.to_date + tour.days
    s.status = 1
    s.build_schedule_price
    if tour.tour_price
      s.schedule_price.price_adult = tour.tour_price.price_adult
      s.schedule_price.price_child = tour.tour_price.price_child
      s.schedule_price.price1 = tour.tour_price.price1
      s.schedule_price.price2 = tour.tour_price.price2
      s.schedule_price.price3 = tour.tour_price.price3
      s.schedule_price.price4 = tour.tour_price.price4
    end
    s.save    
  end
end
