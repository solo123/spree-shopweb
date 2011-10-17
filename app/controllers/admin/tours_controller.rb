class Admin::ToursController < Admin::BaseController
  
  def destinations
    @tour = Infos::Tour.find(params[:tour_id])
  end
  
	def index
    return @collection if @collection.present?
    
    pagination_options = {
                            :per_page  => Spree::Config[:admin_products_per_page],
                            :page      => params[:page]}
                            
    @search = Infos::Tour.search(params[:search])
    @collection = @search.paginate(pagination_options)
  end
  def edit
    @infos_tour = Infos::Tour.find(params[:id])
  end
  def update
    @infos_tour = Infos::Tour.find(params[:id])
    @infos_tour.update_attributes(params[:id])
  end
  def destroy
    @infos_tour = Infos::Tour.find(params[:id])
    if @infos_tour.status && @infos_tour.status > 0
      @infos_tour.status = 0
    else
      @infos_tour.status = 1
    end
    @infos_tour.save
  end
  
end