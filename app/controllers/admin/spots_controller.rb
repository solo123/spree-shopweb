class Admin::SpotsController < Admin::BaseController

  def create_after
    if params[:tour_id]
      @tour = Tour.find(params[:tour_id])
      @tour.spots << @spot
      @tour.save
    end
  end
  def location_after_save
    admin_tour_spots_url(@tour)
  end

  def index
    return @collection if @collection.present?
    if params[:tour_id]
      @tour = Infos::Tour.find(params[:tour_id])
      @collection = @tour.spots
    end
  end
  def edit
    @infos_spot = Infos::Spot.find(params[:id])
    @infos_tour = Infos::Tour.find(params[:tour_id])
    @infos_spot.build_description if !@infos_spot.description
  end
  def update
    @infos_spot = Infos::Spot.find(params[:id])
    @infos_spot.update_attributes(params[:infos_spot])
    @infos_tour = Infos::Tour.find(params[:tour_id])
  end
  def new
    @infos_spot = Infos::Spot.new
  end
  def create
    @infos_spot = Infos::Spot.new
    @infos_spot.tour_id = params[:tour_id].to_i
    @infos_spot.update_attributes(params[:infos_spot])
  end
end