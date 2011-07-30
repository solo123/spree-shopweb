class ToursController < Spree::BaseController

  def index
     @tours = Tour.where('status=1').order('days')
  end

  def show
    if (params[:id] == 'bus')
      @tours = Tour.where('status=1 and tour_type=1').order('days')
      render :index
      return
    end
    if (params[:id] == 'package')
      @tours = Tour.where('status=1 and tour_type=2').order('days')
      render :index
      return
    end
    if (params[:id] == 'cruise')
      @tours = Tour.where('status=1 and tour_type=3').order('days')
      render :index
      return
    end
    @tour = Tour.find(params[:id])
  end

end