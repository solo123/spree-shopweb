class Schedule < OperatesDb
  belongs_to :tour
  has_one :schedule_assignment
  has_one :schedule_price
end
