class Operates::BusSeat < OperatesDb
  belongs_to :schedule_assignment
  belongs_to :order
end
