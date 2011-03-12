class Destination < ActiveRecord::Base
  has_one :description, :as => :ref, :dependent => :destroy
  has_many :photos, :as => :ref, :dependent => :destroy
  accepts_nested_attributes_for :description, :allow_destroy => true
  accepts_nested_attributes_for :photos, :allow_destroy =>true
end
