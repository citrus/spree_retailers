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
      
      # geokit
      t.float     :latitude
      t.float     :longitude
      t.string    :geokit_precision, :geokit_provider, :geokit_accuracy
      t.boolean   :geokit_success, :default => false
      
      # paperclip
      t.string     :logo_file_name
	    t.string     :logo_content_type
	    t.string     :logo_file_size
	    t.datetime   :logo_updated_at
      
      t.timestamps
    end
  end
  def self.down
    drop_table :retailers    
  end
end