class Admin::ShopOrdersController < Admin::BaseController

  def index
    return @shop_orders if @shop_orders.present?
    
    pagination_options = {
                            :per_page  => Spree::Config[:admin_products_per_page],
                            :page      => params[:page]}
                            
    @search = Operates::Order.search(params[:search])
    @shop_orders = @search.paginate(pagination_options)
  end
  
  def show
    @shop_order = Operates::Order.find(params[:id])
  end
  
  def edit
    @shop_order = Operates::Order.find(params[:id])
    
  end
  
  def update
    @shop_order = Operates::Order.find(params[:id])
    @shop_order.update_attributes(params[:operates_order])
  end
  
  def new
    @shop_order = Operates::Order.new
  end
  def create
    @shop_order = Operates::Order.new(params[:shop_order])
    @shop_order.save
    redirect_to :action => 'show', :id => @shop_order
  end


end
