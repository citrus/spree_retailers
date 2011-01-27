module SpreeRetailers
  class CustomHooks < Spree::ThemeSupport::HookListener

    insert_after :admin_tabs, 'admin/hooks/retailers_tab'

  end
end