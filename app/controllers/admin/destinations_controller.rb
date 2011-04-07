class Admin::DestinationsController < Admin::BaseController
  respond_to :html, :js
  #resource_controller
  
  #index.before do
  #	@destination = Destination.new()
  #end
  
  def index
  	@destination = Destination.new
    return @collection if @collection.present?
   	@collection = Destination.all.paginate(
   		:per_page  => Spree::Config[:admin_products_per_page],
        :page      => params[:page])
  end
  
  def edit
    @destination = Destination.find(params[:id])
  end

  def create
    @destination = Destination.new(params[:destination])
    respond_to do |format|
      if @destination.save
        format.html { redirect_to(@destination, :notice => 'Destination was successfully created.') }
        format.js
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /entries/1
  # PUT /entries/1.xml
  def update
    @destination = Destination.find(params[:id])

    respond_to do |format|
      if @destination.update_attributes(params[:destination])
        format.html { redirect_to(@destination, :notice => 'Destination was successfully updated.') }
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