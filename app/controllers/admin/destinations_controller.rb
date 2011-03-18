class Admin::DestinationsController < Admin::BaseController
  resource_controller
  
  index.before do
  	@destination = Destination.new()
  end
  
  def collection
  	
    return @collection if @collection.present?
   	@collection = end_of_association_chain.paginate(
   		:per_page  => Spree::Config[:admin_products_per_page],
        :page      => params[:page])
  end
end