class Admin::CustomersController < Admin::BaseController

  def index
    return @customers if @customers.present?
    
    pagination_options = {
                            :per_page  => Spree::Config[:admin_products_per_page],
                            :page      => params[:page]}
                            
    @search = Infos::UserInfo.search(params[:search])
    @customers = @search.paginate(pagination_options)
  end
  

  
end