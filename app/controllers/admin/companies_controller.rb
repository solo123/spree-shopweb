class Admin::CompaniesController < Admin::ResourceController


	private
	def collection
    return @collection if @collection.present?
    
    pagination_options = {:include   => {:variants => [:images, :option_values]},
                            :per_page  => Spree::Config[:admin_products_per_page],
                            :page      => params[:page]}
                            
    @search = Company.search(params[:search])
    @collection = @search.paginate(pagination_options)

  
  end
	
end