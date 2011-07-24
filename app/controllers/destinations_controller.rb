class DestinationsController < Spree::BaseController
  def index
    @destinations = Destination.where('status=1').order('title')
  end
  def show
    @destination = Destination.find(params[:id])
    @related_tours = []
  end
end