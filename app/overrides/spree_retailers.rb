Deface::Override.new(:virtual_path  => "layouts/admin",
                     :name          => "converted_admin_tabs_for_spree_retailers",
                     :insert_bottom => "[data-hook='admin_tabs'], #admin_tabs[data-hook]",
                     :partial       => "admin/hooks/retailers_tab",
                     :disabled      => false)
