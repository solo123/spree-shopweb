class Admin::ToursController < Admin::ResourceController
  
  def destinations
    @tour = Tour.find(params[:tour_id])
  end
  
  private
	def collection
    return @collection if @collection.present?
    
    pagination_options = {
                            :per_page  => Spree::Config[:admin_products_per_page],
                            :page      => params[:page]}
                            
    @search = Tour.search(params[:search])
    @collection = @search.paginate(pagination_options)

  
  end
  
end