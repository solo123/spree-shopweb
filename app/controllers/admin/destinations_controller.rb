class Admin::DestinationsController < Admin::ResourceController

	def photos
		collection
	end
	
  private
	def collection
    return @collection if @collection.present?
    
    pagination_options = { :per_page  => Spree::Config[:admin_products_per_page],
                           :page      => params[:page]}
                            
    @search = Destination.search(params[:search])
    @collection = @search.paginate(pagination_options)
  end
  
end