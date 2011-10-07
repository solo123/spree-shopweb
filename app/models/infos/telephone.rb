class Infos::Telephone < InfosDb
  belongs_to :tel_number, :polymorphic => :true
end
