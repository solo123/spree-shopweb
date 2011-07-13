class Admin::PhotosController < Admin::ResourceController
	before_filter :load_data

	private
	def load_data
		if params[:destination_id]
    	@destination = Destination.find(params[:destination_id])
    end
  end
	def collection
    return @collection if @collection.present?
    
    pagination_options = {
                            :per_page  => Spree::Config[:admin_products_per_page],
                            :page      => params[:page]}
                            
    @search = Photo.search(params[:search])
    @collection = @search.paginate(pagination_options)
  end
	
end