class ProductsController < ApplicationController
  #method admin was declared on the application controller to check if the logged user has admin privileges
  #here we are blocking all actions to be executed if the logged user is not admin.
  before_filter :admin

  def index
    #@products will store all the products available in the table products.
    @products = Product.all
  end

  def new
    #create a new class Product (empty).
    #@product variable will be used in the partial form (empty form), when submitted goes to CREATE action.
    @product = Product.new
  end

  def create
    #create a new product based on the params received from the partial form.
    @product = Product.new(params[:product])
      if @product.save
        #if saved display confirmation and redirect to the INDEX action (products_path)
        flash[:success] = 'Product was successfully created.'
        redirect_to products_path
      else
        #if it is not saved the reason will be displayed (please see partial form for details)
        # and render the NEW action, so the partial form can be changed to pass the validations.
        render action: "new"
      end
  end

  def edit
    #similar to the NEW action, but instead of create a empty product, we will find a product
    #    by its id and than send its params to the partial form, so the params can be edited.
    #@product variable will be used in the partial form, when submitted goes to UPDATE action.
    @product = Product.find(params[:id])
  end

  def update
    #first we find the product edited in the partial form.
    @product = Product.find(params[:id])
    #than we update the product based on the params received from the partial form.
      if @product.update_attributes(params[:product])
        #if attributes updated display confirmation and redirect to the INDEX action (products_path).
        flash[:success] = 'Product was successfully updated.'
        redirect_to products_path
      else
        #if it is not saved the reason will be displayed (please see partial form for details)
        # and render the EDIT action, so the partial form can be changed to pass the validations.
        render action: "edit"
      end
  end

  def destroy
    #first we find the product to be deleted by its id.
    @product = Product.find(params[:id])
    #here we check if there are line_items (the found products in the cart).
    if @product.line_items.count == 0
      #if there are no line_items related to this product, the product will be deleted.
      @product.destroy
      #display deletion confirmation and redirect to the INDEX action (products_path).
      flash[:success] = 'Product was successfully deleted.'
      redirect_to products_path
    else
      #display error message and redirect to the INDEX action (products_path).
      flash[:error] = "Product can't be deleted, there are orders related to this product"
      redirect_to products_path
    end

  end
end
