Deface::Override.new(:virtual_path  => "spree/layouts/admin",
                     :name          => "converted_admin_tabs_for_spree_retailers",
                     :insert_bottom => "[data-hook='admin_tabs'], #admin_tabs[data-hook]",
                     :partial       => "spree/admin/hooks/retailers_tab",
                     :disabled      => false)
