class TourPoint < ActiveRecord::Base
  has_one :description, :as => :ref
end
