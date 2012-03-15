class StoreController < ApplicationController

  #index is the root_path of this application
  def index
    #@products will store the 5 newest products (last added)) available in the table products
    @products=Product.all(limit: 5)
  end

end
