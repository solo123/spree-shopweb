class Destination < InfoDb
  has_one :description, :as => :ref, :dependent => :destroy
  accepts_nested_attributes_for :description, :allow_destroy => true
  
  has_and_belongs_to_many :tours
  
  def status_text
    if self.status && self.status > 0
      'show'
    else
      'deleted'
    end
  end
end
