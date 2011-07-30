class DestinationsController < Spree::BaseController
  def index
    @destinations = Destination.where('status=1').order('title')
  end
  def show
    @destination = Destination.find(params[:id])
    spots = Spot.select('DISTINCT tour_id').where(:destination_id => @destination.id)
    tours = []
    spots.each {|spot| tours << spot.tour_id }
    @related_tours = Tour.find(tours)
  end
end