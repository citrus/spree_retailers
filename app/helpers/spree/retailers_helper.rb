module Spree::RetailersHelper
  
  def state_nav_helper(retailers=[])
    states = retailers.collect(&:state).uniq
    return "" if states.empty?
    states.collect{|state| link_to(state, "##{state.downcase}") }.join(" | ").html_safe 
  end

  def google_map_directions(address)
  	if address.class != String
  		address = [:address, :address2, :city, :state, :zipcode, :country].map {
  			|a| (address.respond_to? a) ? address.send(a) : ""
  		}.join " "
  	end

	q = Rack::Utils::build_query({
		:f => "q",
		:hl => "en",
		:saddr => "",
		:daddr => address
	})

	"http://maps.google.com/maps?#{q}"
  end
end
