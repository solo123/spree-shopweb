class Infos::Location < InfosDb
  has_many :locs, :class_name => 'Location', :foreign_key => 'parent_id'
  belongs_to :parent, :class_name => 'Location'
end
