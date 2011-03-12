class ToursController < Spree::BaseController

  def index
     @tours = Tour.where('status=1').order('days')
  end

  def show
    if (params[:id] == 'bus')
      @tours = Tour.where('status=1 and tour_type=1').order('days,show_order')
      render :index
      return
    end
    if (params[:id] == 'package')
      @tours = Tour.where('status=1 and tour_type=2').order('days,show_order')
      render :index
      return
    end
    if (params[:id] == 'cruise')
      @tours = Tour.where('status=1 and tour_type=3').order('days,show_order')
      render :index
      return
    end
    @tour = Tour.find(params[:id])
    @tour_points = TourPoint.where("tour_id=#{@tour.id}").order("visit_day,visit_order")
  end

end