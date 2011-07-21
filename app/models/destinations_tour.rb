class DestinationsTour < ActiveRecord::Base
  belongs_to :tour
  belongs_to :destination
  has_one :description, :as => :ref, :dependent => :destroy
end