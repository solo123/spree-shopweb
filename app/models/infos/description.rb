class Infos::Description < InfosDb
  belongs_to :desc_data, :polymorphic => true
end



