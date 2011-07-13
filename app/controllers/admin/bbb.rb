  def index
  	@search = Destination.search(params[:search])
  	@destination = Destination.new
    return @collection if @collection.present?
   	@collection = @search.all.paginate(
   		:per_page  => Spree::Config[:admin_products_per_page],
        :page      => params[:page])
  end
  
  def edit
    @destination = Destination.find(params[:id])
    if !@destination.description
    	@destination.description = Description.new
    	@destination.save
    end
  end
	def new
		@destination = Destination.new
		@destination.description = Description.new
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
  def show
  	@destination = Destination.find(params[:id])
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

  