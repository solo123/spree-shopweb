class Admin::SpotsController < Admin::ResourceController

  create.after :create_after

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

  private
  def collection
    return @collection if @collection.present?
    if params[:tour_id]
      @tour = Tour.find(params[:tour_id])
      @collection = @tour.spots
    end
  end
end