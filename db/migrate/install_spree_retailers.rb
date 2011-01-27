class InstallSpreeRetailers < ActiveRecord::Migration
  def self.up
    create_table :retailers do |t|
      t.string    :name, :required => true
      t.string    :address, :required => true
      t.string    :address2
      t.string    :city
      t.string    :state
      t.string    :zipcode
      t.string    :country
      t.string    :phone
      t.string    :email
      t.string    :url
      t.timestamps
    end
  end
  def self.down
    drop_table :retailers    
  end
end