class Retailer < ActiveRecord::Base
  
  validates_presence_of :name, :address, :city, :state, :zipcode
  
  [:address2, :phone, :email].each do |property|
    define_method "has_#{property.to_s}?" do
      val = self.send property
      !(val.nil? || val.empty?)
    end
  end
  
  def has_url?
    (self.url.nil? || self.url.empty?) && self.url != "http://" 
  end
  

  def url=(value)
    val = value.strip.downcase
    if val.match(/^http(s)?:\/\//) == nil
      val = "http://" + val
    end
    write_attribute :url, val
  end
  
end
