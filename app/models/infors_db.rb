class InfosDb < ActiveRecord::Base
  establish_connection :infos
  self.abstract_class = true
end