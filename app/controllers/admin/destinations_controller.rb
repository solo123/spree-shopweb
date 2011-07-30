require 'flickraw'

class Admin::DestinationsController < Admin::ResourceController

	def photos
		FlickRaw.api_key = '1e45d3cbe81db329e29dbbf8c966540b'
    FlickRaw.shared_secret = 'cf4894b1ad14d5e5'
    @photo_set = flickr.photosets.getList(:user_id => '65483249@N05')
    if params[:photo]
      params[:photo].each do |para|
        d = Destination.find(para[:dest_id])
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
	  Destination.where('photoset is not null').each do |d|
	    if d.photo
  	    d.photo.photoset = nil
  	    d.save
  	  end
	  end
	  redirect_to :action => :photos
	end
	
  private
	def collection
    return @collection if @collection.present?
    
    pagination_options = { :per_page  => Spree::Config[:admin_products_per_page],
                           :page      => params[:page]}
                            
    @search = Destination.search(params[:search])
    @collection = @search.paginate(pagination_options)
  end
  
end