class RetailersController < Spree::BaseController

  def index
    @retailers = Retailer.order(:name) 
    #if request.xhr? 
    #  render :partial => 'list', :layout => false, :locals => { :retailers => @retailers }      
    #end
  end

end