class Admin::ToursController < Admin::BaseController
  respond_to :html, :js
  #resource_controller
  
  #index.before do
  #	@destination = Destination.new()
  #end
  
  def index
  	@search = Tour.search(params[:search])
  	@tour = Tour.new
    return @collection if @collection.present?
   	@collection = @search.all.paginate(
   		:per_page  => Spree::Config[:admin_products_per_page],
        :page      => params[:page])
  end
  
  def edit
    @tour = Tour.find(params[:id])
  end
	def new
		@tour = Tour.new
	end
  def create
    @tour = Tour.new(params[:tour])
    respond_to do |format|
      if @tour.save
        format.html { redirect_to(@tour, :notice => 'Tour was successfully created.') }
        format.js
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /entries/1
  # PUT /entries/1.xml
  def update
    @tour = Tour.find(params[:id])

    respond_to do |format|
      if @tour.update_attributes(params[:tour])
        format.html { redirect_to(@tour, :notice => 'Tour was successfully updated.') }
        format.js
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.xml
  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to(entries_url) }
      format.js
      format.xml  { head :ok }
    end
  end

  
  
end