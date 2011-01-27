class Admin::RetailersController < Admin::BaseController

  resource_controller

  actions :all

	create.response do |wants|
		wants.html {redirect_to admin_retailers_path}
  end
    
	update.response do |wants|
		wants.html {redirect_to admin_retailers_path}
  end

  index.response do |wants|
    wants.html { render :action => :index }
    wants.json { render :json => @collection.to_json() }
  end
  
  destroy.success.wants.js { render_js_for_destroy }

  private
  
  def object
    get_states
    super
  end
  
  def collection
    return @collection if @collection.present?
    unless request.xhr?
      params[:search] ||= {}
      params[:search][:order] ||= "ascend_by_name"      

      @search = Retailer.searchlogic(params[:search])

      #set order by to default or form result
      @search.order ||= "ascend_by_name"

      @collection = @search.do_search.paginate(:per_page => Spree::Config[:admin_products_per_page], :page => params[:page])
    else
      @collection = Retailer.find(:all,
                          :conditions => params[:q] ? ["Retailer.name like :search OR Retailer.email like :search OR Retailer.phone like :search", {:search => "#{params[:q].strip}%"}] : nil,
                          :limit => (params[:limit] || 100))
    end
  end

  def get_states
    @states = State.where(:country_id => 214).collect{|state| state.name }.sort
  end
  
end
