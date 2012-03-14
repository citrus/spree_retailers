class Spree::RetailersController < Spree::BaseController

  def index
    @retailer_types = Spree::RetailerType.order(:name).all
    @retailers = default_scope.all
    get_states
  end

private 

  def default_scope
    return @default_scope if @default_scope
    scope = if params[:retailer_type_id].present?
      @retailer_type = Spree::RetailerType.find_by_permalink!(params[:retailer_type_id])
      @retailer_type.retailers
    else
      Spree::Retailer.scoped
    end
    @default_scope = scope.order(:country, :state, :name)
  end

  def get_states
    @states = {}
    Spree::State.where(:abbr => @retailers.collect(&:state).uniq).all.each do |state|
      @states[state.abbr] = state.name
    end
  end

end
