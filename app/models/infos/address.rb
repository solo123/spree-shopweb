class Infos::Address < InfosDb
  belongs_to :city
  belongs_to :address_data, :polymorphic => :true
end
