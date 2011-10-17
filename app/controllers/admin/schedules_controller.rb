class Admin::SchedulesController < Admin::BaseController
  
  def generate
    today = Date.today
    default_days = Spree::Config[:booking_range].to_i
    @messages = []
    @gen_schedule = params[:op] && params[:op] == 'do'
    
    Infos::Tour.where(:status => 1).each do |tour|
      if tour.tour_setting && tour.tour_setting.is_auto_gen == 1 && (!tour.tour_setting.last_schedule_date || Date.parse(tour.tour_setting.last_schedule_date) < today)
        tour_days = []
        days = tour.tour_setting.available_days.to_i
        days = default_days if days == 0
        (today..today + days).each do |day|
          tour_days << day 
        end
        if tour_days.length > 0
          ds = []
          tour_days.each do |d|
            range = d..d+1
            if !Operates::Schedule.exists?(:tour_id => tour.id, :departure_date => range)            
              Operates::Schedule.gen(tour,d) if @gen_schedule
              ds << d
            end
          end
          @messages << [tour.id, tour.title, ds]
        end
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
  
end