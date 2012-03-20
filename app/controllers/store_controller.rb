class StoreController < ApplicationController
  #index is the root_path of this application
  def index
    #@products will store the found products in the search method created in the product model.
    # If there is no search params, the method return all products, please note product model for details.
    @products = Product.search(params[:search])
  end

end
