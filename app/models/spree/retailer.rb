class Spree::Retailer < ActiveRecord::Base

  attr_accessible :retailer_type_id, :name, :email, :phone, :address, :address2, :city, :state, :zipcode, :url, :logo
  
  belongs_to :retailer_type, :class_name => "Spree::RetailerType"
  
  validates :retailer_type_id, :name, :address, :city, :presence => true
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
        self.latitude         = geo.lat
        self.longitude        = geo.lng
        self.geokit_provider  = geo.provider
        self.geokit_precision = geo.precision
        self.geokit_accuracy  = geo.accuracy
        self.geokit_success   = true
      else
        self.latitude         = nil
        self.longitude        = nil
        self.geokit_provider  = nil
        self.geokit_precision = nil
        self.geokit_accuracy  = nil
        self.geokit_success   = false
      end
    end
  
end
