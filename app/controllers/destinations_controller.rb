class DestinationsController < Spree::BaseController
  def index
    @destinations = Destination.where('status=1').order('title')
  end
  def show
    @destination = Destination.find(params[:id])
    @related_tours = Tour.where("id in(	select DISTINCT tour_id	from tours_destinations where destination_id=#{@destination.id})")
    @photos = Photo.where("ref_type='Destination' and ref_id=#{@destination.id} and status=1")
  end
end