class RetailersController < Spree::BaseController

  def index
    @retailers = Retailer.order(:country, :state, :name)
    @states = {}
    State.where(:abbr => @retailers.collect(&:state).uniq).all.each do |state|
      @states[state.abbr] = state.name
    end
  end

end
