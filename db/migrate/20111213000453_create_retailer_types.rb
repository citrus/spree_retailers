class CreateRetailerTypes < ActiveRecord::Migration
  def change
    create_table :spree_retailer_types do |t|
      t.string    :name,      :nil => false
      t.string    :permalink, :nil => false, :length => 40
    end
  end
end
