class TourOrdersController < Spree::BaseController
  def new
    redirect_back_or_default '/login' if !current_user
    @tour = Tour.find(params[:tour])
    @order = ShopOrder.new
    @order.order_items.build
    @datelist = @tour.schedules.map {|s| '[' + s.departure_date.strftime('%Y.%m.%d')+ ']'}.join()
    @max_date = (@tour.schedules.last.departure_date.to_date - Date.today).to_i
  end
  
  def edit
    @order = ShopOrder.find(params[:id])
    @tour = @order.schedule.tour
  end
  
  def create
    @order = ShopOrder.new(params[:shop_order])
    @order.save!
    
    redirect_to edit_tour_order_path(@order)
  end
    
end