require 'flickraw'

class Admin::DestinationsController < Admin::BaseController

	def photos
		FlickRaw.api_key = '1e45d3cbe81db329e29dbbf8c966540b'
    FlickRaw.shared_secret = 'cf4894b1ad14d5e5'
    if params[:dest_id]
        d = Infos::Destination.find(params[:dest_id])
        d.build_photo if !d.photo
        ph = d.photo
        ph.photoset = params[:photoset]
        s = flickr.photosets.getInfo(:photoset_id => ph.photoset)
        i = flickr.photos.getInfo(:photo_id => s.primary)
        ph.photo_s = FlickRaw.url_s(i)
        ph.photo_t = FlickRaw.url_t(i)
        ph.photo_m = FlickRaw.url_m(i)
        d.save!

      render :text => 'OK:' + d.id.to_s
      return
    end
      @photo_set = flickr.photosets.getList(:user_id => '65483249@N05')
	end
	def save_photos
    if params[:photo]
      params[:photo].each do |para|
        d = Infos::Destination.find(para[:dest_id])
        d.build_photo if !d.photo
        ph = d.photo
        ph.photoset = para[:photo_id]
        s = flickr.photosets.getInfo(:photoset_id => ph.photoset)
        i = flickr.photos.getInfo(:photo_id => s.primary)
        ph.photo_s = FlickRaw.url_s(i)
        ph.photo_t = FlickRaw.url_t(i)
        ph.photo_m = FlickRaw.url_m(i)
        d.save!
      end
    end	  
	end
	def photos_reset
	  Infos::Destination.where('photoset is not null').each do |d|
	    if d.photo
  	    d.photo.photoset = nil
  	    d.save
  	  end
	  end
	  redirect_to :action => :photos
	end
	
	def index
    return @collection if @collection.present?
    
    pagination_options = { :per_page  => Spree::Config[:admin_products_per_page],
                           :page      => params[:page]}

    @search = Infos::Destination.search(params[:search])
    @collection = @search.paginate(pagination_options)
  end
  def edit
    @infos_destination = Infos::Destination.find(params[:id])
  end
  def update
    @infos_destination = Infos::Destination.find(params[:id])
    @infos_destination.update_attributes(params[:infos_destination])
  end  
  def new
    @infos_destination = Infos::Destination.new
  end
  def create
    @infos_destination = Infos::Destination.new
    @infos_destination.update_attributes(params[:infos_destination])
  end
  def destroy
    @infos_destination = Infos::Destination.find(params[:id])
    if @infos_destination.status && @infos_destination.status > 0
      @infos_destination.status = 0
    else
      @infos_destination.status = 1
    end
    @infos_destination.save
  end
  
end