class Tour < ActiveRecord::Base
  has_one :description, :as => :ref
  accepts_nested_attributes_for :description, :allow_destroy => true
end
