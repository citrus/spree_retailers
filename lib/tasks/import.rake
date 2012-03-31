namespace :spree_retailers do
  desc "Import list of retailers from a CSV"
  task :import => :environment do |t, args|
    file = ENV['FILE']
    type = ENV['TYPE']
    
    if file.empty?
      puts "No CSV specified"
      return
    end
    
    require 'csv'
    
    if type.empty?
      # if no type is defined then pick the first one available
      Spree::RetailerType.all.first
    else
      type = Spree::RetailerType.find_or_create_by_name(type)
    end
    
    def get_column_mappings(row)
      mappings = {}
      row.each_with_index do |heading, index|
        mappings[heading.downcase.gsub(/\A\s*/, '').chomp.gsub(/\s/, '_').to_sym] = index
      end
      mappings
    end
    
    rows = CSV.read(file)
    cols = get_column_mappings(rows[0])
    
    puts "Importing data..."
    
    valid_fields = [
      :name    ,
      :address ,
      :city    ,
      :state   ,
      :country ,
      :zipcode ,
      :phone   ,
      :email   ,
      :url     ,
      :logo
    ]
    
    rows.each do |row|
      info = {}
      
      cols.each do |key, value|
        #Trim whitespace off the beginning and end of row fields
        row[value].try :strip!
        info[key] = row[value] if valid_fields.include? key.to_sym
      end
      
      # default to US
      unless info.has_key? :country
        info[:country] = "United States"
      end
      
      puts "Adding: #{info[:name]}"
           
      type.retailers.create! info
    end
  end
end
