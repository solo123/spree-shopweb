class Description < ActiveRecord::Base
  belongs_to :ref, :polymorphic => true
end



