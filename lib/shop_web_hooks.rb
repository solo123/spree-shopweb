class ShopWebHooks < Spree::ThemeSupport::HookListener
  # custom hooks go here
  insert_after :admin_tabs do
  	%(<%= tab(:pages) %> <%= tab(:pages)%>)
  end
end