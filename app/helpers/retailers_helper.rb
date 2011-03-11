module RetailersHelper
  
  def state_nav_helper
    states = (@retailers || Retailer.select(:state).group(:state).all).collect(&:state).uniq
    return "" unless 1 < states.length
    states.collect{|state| link_to(state, "##{state.downcase}") }.join(" | ").html_safe 
  end 

end 