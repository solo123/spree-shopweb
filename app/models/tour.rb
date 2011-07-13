class Tour < ActiveRecord::Base
  has_one :description, :as => :ref
  accepts_nested_attributes_for :description, :allow_destroy => true
  has_and_belongs_to_many :destinations
end
