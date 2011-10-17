class PagesController < Spree::BaseController
  def show
    @page = Infos::Page.find_by_permalink(params[:id])
    if !@page
    	@page = Infos::Page.new
    	@page.permalink = params[:id]
    	@page.save
    end
  end
end