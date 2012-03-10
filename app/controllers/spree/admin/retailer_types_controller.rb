class Spree::Admin::RetailerTypesController < Spree::Admin::ResourceController

  def show
    redirect_to admin_retailer_types_path
  end
  
private
  
  def location_after_save
    admin_retailer_types_path
  end
  
  def find_resource
    Spree::RetailerType.find_by_permalink!(params[:id])
  end  
    
  def collection
    params[:search] ||= {}
    params[:search][:meta_sort] ||= "name.asc"
    @search = Spree::RetailerType.metasearch(params[:search])
    @collection = @search.page(params[:page]).per(Spree::Config[:orders_per_page])
  end

end
