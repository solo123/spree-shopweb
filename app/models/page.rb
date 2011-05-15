class Page < ActiveRecord::Base
	def deleted?
    !!deleted_at
  end
end
