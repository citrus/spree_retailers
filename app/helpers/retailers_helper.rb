module RetailersHelper
  
  def state_nav_helper(retailers=[])
    states = retailers.collect(&:state).uniq
    
    puts states
    
    return "" unless 1 < states.length
    states.collect{|state| link_to(state, "##{state.downcase}") }.join(" | ").html_safe 
  end 

end 