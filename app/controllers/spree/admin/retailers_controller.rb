class Spree::Admin::RetailersController < Spree::Admin::ResourceController

  before_filter :get_locations, :except => [:index, :destroy]
  
private

  def collection
    params[:q] ||= {}
    params[:q][:s] ||= "name asc"
    @search = Spree::Retailer.search(params[:q])
    @collection = @search.result.includes(:retailer_type).page(params[:page]).per(Spree::Config[:orders_per_page])
  end

  def get_locations
    @countries = Spree::Country.all.collect{|country| country.name }.sort
    @states = Spree::State.where(:country_id => 214).order(:name).collect{|state| [state.name, state.abbr] }
  end
  
end
