class Operates::Order < OperatesDb
  has_many :items, :class_name => 'OrderItem', :dependent => :destroy
  accepts_nested_attributes_for :items, :reject_if => proc { |atts| atts['num_adult'].blank? }

  has_one :price, :class_name => 'OrderPrice', :dependent => :destroy
  has_one :order_operate, :dependent => :destroy
  
  
  belongs_to :created_by, :class_name => 'Employee', :foreign_key => 'created_by_id'
  belongs_to :operator, :class_name => 'Employee', :foreign_key => 'operator_id'
end