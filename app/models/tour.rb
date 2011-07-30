class Tour < InfosDb
  has_one :description, :as => :desc_data, :dependent => :destroy
  has_many :spots, :order => 'visit_day, visit_order'
end
