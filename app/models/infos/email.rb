class Infos::Email < InfosDb
  belongs_to :email_data, :polymorphic => :true
end
