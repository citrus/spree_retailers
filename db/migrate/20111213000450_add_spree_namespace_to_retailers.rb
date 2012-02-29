class AddSpreeNamespaceToRetailers < ActiveRecord::Migration
  def change
    rename_table :retailers, :spree_retailers
  end
end
