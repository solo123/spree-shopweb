class Destination < ActiveRecord::Base
  has_one :description, :as => :ref, :dependent => :destroy
  has_many :photos, :as => :ref, :dependent => :destroy
  accepts_nested_attributes_for :description, :allow_destroy => true
  accepts_nested_attributes_for :photos, :allow_destroy =>true
  has_and_belongs_to_many :tours
  
  has_many :destination_photos, :as => :viewable, :order => :position, :dependent => :destroy
end
