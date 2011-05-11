class Admin::RetailersController < Admin::ResourceController

  before_filter :get_locations, :except => [:index,:destroy]

  #resource_controller
  #
  #actions :all
  #
	#create.response do |wants|
	#	wants.html {redirect_to admin_retailers_path}
  #end
  #  
	#update.response do |wants|
	#	wants.html {redirect_to admin_retailers_path}
  #end
  #
  #index.response do |wants|
  #  wants.html { render :action => :index }
  #  wants.json { render :json => @collection.to_json() }
  #end
  #
  #destroy.success.wants.js { render_js_for_destroy }

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
