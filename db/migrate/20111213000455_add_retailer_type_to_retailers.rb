class AddRetailerTypeToRetailers < ActiveRecord::Migration
  def change
    add_column :spree_retailers, :retailer_type_id, :integer
  end
end
