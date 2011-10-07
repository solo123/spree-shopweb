IMAGE_ROOT = "http://www.omeitravel.com/"

class InfosDb < ActiveRecord::Base
  establish_connection :infos
  self.abstract_class = true
end

class OperatesDb < ActiveRecord::Base
  establish_connection :operates
  self.abstract_class = true
end

Devise.setup do |config|
  config.authentication_keys = [ :login ]
end