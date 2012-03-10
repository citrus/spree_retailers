Deface::Override.new(:virtual_path  => "spree/layouts/admin",
                     :name          => "converted_admin_tabs_for_spree_retailers",
                     :insert_bottom => "[data-hook='admin_tabs'], #admin_tabs[data-hook]",
                     :partial       => "spree/admin/hooks/retailers_tab",
                     :disabled      => false)

Deface::Override.new(:virtual_path  => "spree/admin/configurations/index",
                     :name          => "add_retailer_types_to_admin_configurations_menu",
                     :insert_bottom => "[data-hook='admin_configurations_menu'], #admin_configurations_menu[data-hook]",
                     :partial       => "spree/admin/retailer_types/config_option",
                     :disabled      => false)
