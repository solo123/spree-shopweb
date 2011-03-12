class PagesController < Spree::BaseController
  def show
    @page = Page.find_by_permalink(params[:id])
  end
end