class ToursController < Spree::BaseController

  def index
     @tours = Infos::Tour.where('status=1').order('days')
  end

  def show
    if (params[:id] == 'bus')
      @tours = Infos::Tour.where('status=1 and tour_type=1').order('days')
      render :index
      return
    end
    if (params[:id] == 'package')
      @tours = Infos::Tour.where('status=1 and tour_type=2').order('days')
      render :index
      return
    end
    if (params[:id] == 'cruise')
      @tours = Infos::Tour.where('status=1 and tour_type=3').order('days')
      render :index
      return
    end
    @tour = Infos::Tour.find(params[:id])
  end

end