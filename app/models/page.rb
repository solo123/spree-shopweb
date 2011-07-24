class Page < InfosDb
	def deleted?
    is_active && is_active == 1
  end
end
