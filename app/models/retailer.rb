class Retailer < ActiveRecord::Base
  
  validates :name, :address, :city, :presence => true
  validates :state, :zipcode, :presence => true, :if => Proc.new{|record| record.country == "United States" }
  
  validates :email, :email => true, :allow_blank => true
  
  validates_numericality_of :latitude, :longitude, :allow_blank => true
  
  before_validation :geocode, :if => :geocode?


  has_attached_file :logo, 
                    :styles => { :mini => '48x48>', :thumb => '150x150>', :large => '450x400>' },
                    :default_style => :thumb,
                    :url => "/assets/retailers/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/retailers/:id/:style/:basename.:extension"
  
  
  [:address2, :phone, :email].each do |property|
    define_method "has_#{property.to_s}?" do
      val = self.send property
      !(val.nil? || val.empty?)
    end
  end
  
  def has_url?
    !(self.url.nil? || self.url.empty? || self.url == "http://")
  end
  
  def has_logo?
    !self.logo_file_name.blank?
  end

  def url=(value)
    val = value.to_s.strip.downcase
    if val.match(/^http(s)?:\/\//) == nil
      val = "http://" + val
    end
    write_attribute :url, val
  end
  
  def full_address
    "#{address} #{address2} #{city}, #{state} #{zipcode}"
  end
  
  def geocode?
    (new_record? || changed?) && !address.blank?
  end
  
  def geocoded?
    geokit_success && !(latitude.nil? || longitude.nil?)
  end
  
  private
  
    def geocode
      geo = Geokit::Geocoders::MultiGeocoder.geocode(full_address)
      if geo.success
        self.attributes = {  
          :latitude         => geo.lat,
          :longitude        => geo.lng,
          :geokit_provider  => geo.provider,
          :geokit_precision => geo.precision,
          :geokit_accuracy  => geo.accuracy,
          :geokit_success   => true
        }
      else
        self.attributes = {
          :latitude         => nil,
          :longitude        => nil,
          :geokit_provider  => nil,
          :geokit_precision => nil,
          :geokit_accuracy  => nil,
          :geokit_success   => false
        }
      end
    end
  
end
