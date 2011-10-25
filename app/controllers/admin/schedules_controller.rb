class Admin::SchedulesController < Admin::BaseController
  
  def generate
    @today = Date.today
    @default_days = Spree::Config[:booking_range].to_i
    @messages = []

    if params[:tour]
      tour = Infos::Tour.find(params[:tour])
      params[:ids].split(',').each do |day|
        tour.gen_schedule(day.to_date)
      end
      render :text => params[:tour] + ' done '
    else    
      Infos::Tour.where(:status => 1).each do |tour|
        gen_tour_schedule(tour, false)
      end
    end
  end
  
  def gen_tour_schedule(tour, gen_schedule)
      if tour.tour_setting && tour.tour_setting.is_auto_gen == 1 && (!tour.tour_setting.last_schedule_date || Date.parse(tour.tour_setting.last_schedule_date) < @today)
        tour_days = []
        days = tour.tour_setting.available_days.to_i
        days = @default_days if days == 0
        (@today..@today + days).each do |day|
          tour_days << day 
        end
        if tour_days.length > 0
          ds = []
          tour_days.each do |d|
            range = d..d+1
            if !Operates::Schedule.exists?(:tour_id => tour.id, :departure_date => range)            
              Operates::Schedule.gen(tour,d) if gen_schedule
              ds << d
            end
          end
          @messages << [tour.id, tour.title, ds] if ds.count > 0
        end
      end
  end
  
	def index
    return @collection if @collection.present?
    pagination_options = {
                            :per_page  => Spree::Config[:admin_products_per_page],
                            :page      => params[:page]}
    params[:search] ||= {}
    params[:search][:meta_sort] ||= "departure_date.asc"
    @search = Operates::Schedule.search(params[:search])
    @collection = @search.paginate(pagination_options)
  end
  def show
    @operates_schedule = Operates::Schedule.find(params[:id])
    @total_seats = 57
  end
  def add_bus
    @operates_schedule = Operates::Schedule.find(params[:id])
    cnt = @operates_schedule.assignments.count + 1
    @operates_assignment = @operates_schedule.assignments.build
    @operates_assignment.title = "#{cnt}"
  end
  def update_bus
    @operates_schedule = Operates::Schedule.find(params[:id])
    @assignment = @operates_schedule.assignments.build
    @assignment.update_attributes(params[:operates_schedule_assignment])
    @total_seats = 57
    render 'update.js'
  end
  def update
    @operates_schedule = Operates::Schedule.find(params[:id])
    @operates_schedule.update_attributes(params[:operates_schedule])
    @assignment = @operates_schedule.assignments.last
    @total_seats = 57
  end
  def hold_seats
    @assignment = Operates::ScheduleAssignment.find(params[:assignment_id])
    params[:seats].split(',').each do |sn|
      seat = @assignment.seats.build
      seat.seat_number = sn
      seat.message1 = '[hold]'
      user_info = Infos::UserInfo.where(:user_id => current_user.id).first
      employee = Infos::Employee.where(:userinfo_id => user_info.id).first
      seat.message2 = "#{employee.nickname}<br />137-234-23434"
      seat.save
    end
  end
end