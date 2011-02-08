module RetailersHelper
  
  def state_nav_helper
    retailers = Retailer.select(:state).group(:state).order(:state).all
    return "" unless 1 < retailers.length
    retailers.collect{|retailer| link_to(retailer.state, "##{retailer.state.downcase}") }.join(" | ").html_safe 
  end 

end 