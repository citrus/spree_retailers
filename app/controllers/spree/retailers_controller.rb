class Spree::RetailersController < Spree::BaseController

  def index
    @retailers = Spree::Retailer.order(:country, :state, :name)
    @states = {}
    Spree::State.where(:abbr => @retailers.collect(&:state).uniq).all.each do |state|
      @states[state.abbr] = state.name
    end
  end

end
