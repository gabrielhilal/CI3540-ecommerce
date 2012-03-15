class CartsController < ApplicationController
  #as we are creating the cart in the application controller, all we need here is the destroy method.
  def destroy
    #find cart by its id and destroy it. Than redirect to the application INDEX (store_path)
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to store_path
  end
end
