class RetailersController < Spree::BaseController

  def index
    @retailers = Retailer.order(:state, :name)
  end

end