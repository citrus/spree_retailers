class RetailersController < Spree::BaseController

  def index
    @retailers = Retailer.order(:state, :name)
    @states = State.where(:abbr => @retailers.collect(&:state))
  end

end