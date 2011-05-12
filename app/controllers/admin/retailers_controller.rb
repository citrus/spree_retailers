class Admin::RetailersController < Admin::ResourceController

  before_filter :get_locations, :except => [:index,:destroy]

  private
  
    def collection
      params[:search] ||= {}
      params[:search][:meta_sort] ||= "name.asc"
      @search = super.search(params[:search])
      @collection = @search.paginate(:per_page => Spree::Config[:orders_per_page], :page => params[:page])
    end
  
    def get_locations
      @countries = Country.all.collect{|country| country.name }.sort
      @states = State.where(:country_id => 214).collect{|state| [state.name, state.abbr] }.sort
    end
  
end
