IMAGE_ROOT = "http://www.omeitravel.com/"


class InfosDb < ActiveRecord::Base
  establish_connection :infos
  self.abstract_class = true
end