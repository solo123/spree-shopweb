class Photo < ActiveRecord::Base
  belongs_to :ref, :polymorphic => true
end
