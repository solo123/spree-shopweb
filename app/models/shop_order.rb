class ShopOrder < OperatesDb
  has_many :order_items, :dependent => :destroy
  accepts_nested_attributes_for :order_items, :reject_if => proc { |atts| atts['num_adult'].blank? }
  has_one :order_details, :dependent => :destroy
  belongs_to :schedule
end