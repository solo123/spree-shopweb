class Admin::PagesController < Admin::ResourceController
	def collection
    return @collection if @collection.present?

    unless request.xhr?
      params[:search] ||= {}
      # Note: the MetaSearch scopes are on/off switches, so we need to select "not_deleted" explicitly if the switch is off


      params[:search][:meta_sort] ||= "name.asc"
      @search = super.metasearch(params[:search])

      pagination_options = {
                            :per_page  => Spree::Config[:admin_products_per_page],
                            :page      => params[:page]}

      @collection = @search.paginate(pagination_options)
    else
      @collection = super.where(["title #{LIKE} ?", "%#{params[:q]}%"])
      @collection = @collection.limit(params[:limit] || 10)

      @collection.uniq
    end

  end
end