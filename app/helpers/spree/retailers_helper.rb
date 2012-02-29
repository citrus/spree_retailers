module Spree::RetailersHelper
  
  def state_nav_helper(retailers=[])
    states = retailers.collect(&:state).uniq
    return "" if states.empty?
    states.collect{|state| link_to(state, "##{state.downcase}") }.join(" | ").html_safe 
  end

end
