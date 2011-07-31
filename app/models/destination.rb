class Destination < InfosDb
  has_one :description, :as => :desc_data, :dependent => :destroy
  accepts_nested_attributes_for :description, :allow_destroy => true
  
  has_one :photo, :as => :photo_data, :dependent => :destroy
  def status_text
    if self.status && self.status > 0
      'show'
    else
      'deleted'
    end
  end
end
