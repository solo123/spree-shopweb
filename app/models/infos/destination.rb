class Infos::Destination < InfosDb
  has_one :description, :as => :desc_data, :dependent => :destroy
  accepts_nested_attributes_for :description, :allow_destroy => true
  
  has_many :photos, :as => :photo_data, :dependent => :destroy
  belongs_to :city
  
  belongs_to :title_photo, :class_name => 'Infos::Photo'
  def status_text
    if self.status && self.status > 0
      'show'
    else
      'hide'
    end
  end
end
