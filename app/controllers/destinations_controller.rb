class DestinationsController < Spree::BaseController
  def index
    @destinations = Infos::Destination.where('status=1').order('title')
  end
  def show
    @destination = Infos::Destination.find(params[:id])
    spots = Infos::Spot.select('DISTINCT tour_id').where(:destination_id => @destination.id)
    tours = []
    spots.each {|spot| tours << spot.tour_id }
    @related_tours = Infos::Tour.find(tours)
  end

end