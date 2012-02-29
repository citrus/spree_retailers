class Spree::Admin::RetailersController < Spree::Admin::ResourceController

  before_filter :get_locations, :except => [:index, :destroy]

  private
  
    def collection
      params[:search] ||= {}
      params[:search][:meta_sort] ||= "name.asc"
      @search = super.search(params[:search])
      @collection = @search.page(params[:page]).per(Spree::Config[:orders_per_page])
    end
  
    def get_locations
      @countries = Spree::Country.all.collect{|country| country.name }.sort
      @states = Spree::State.where(:country_id => 214).collect{|state| [state.name, state.abbr] }.sort
    end
  
end
