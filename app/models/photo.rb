class Photo < InfosDb
  belongs_to :photo_data, :polymorphic => true
end



