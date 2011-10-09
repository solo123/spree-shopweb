class Admin::CustomersController < Admin::BaseController

  def index
    return @customers if @customers.present?
    
    pagination_options = {
                            :per_page  => Spree::Config[:admin_products_per_page],
                            :page      => params[:page]}
                            
    @search = Infos::UserInfo.search(params[:search])
    @customers = @search.paginate(pagination_options)
  end
  
  def show
    if params[:id] == 'search'
      @customers = []
      if params[:type]
        if params[:type] == 'name'
          s = params[:q]
          @customers = Infos::UserInfo.where('first_name like "%'+ s +'%"')
        elsif params[:type] == 'tel'
        elsif params[:type] == 'email'
        elsif params[:type] == 'address'
        end
      end
      render 'search', :layout => false
    end
  end
  
end