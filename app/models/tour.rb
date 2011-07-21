class Tour < ActiveRecord::Base
  has_one :description, :as => :ref, :dependent => :destroy
  has_many :spots, :order => 'visit_day, visit_order'
end
