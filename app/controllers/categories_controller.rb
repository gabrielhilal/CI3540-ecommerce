class CategoriesController < ApplicationController
  #method admin was declared on the application controller to check if the logged user has admin privileges
  #here we are blocking the below actions to be executed if the logged user is not admin.
  before_filter :admin, only: [:new, :create, :index, :edit, :update, :destroy ]
  def index
    #@categories will store all the categories available in the table categories.
    @categories = Category.all
  end
  def new
    #create a new class Category (empty).
    #@category variable will be used in the partial form (empty form), when submitted goes to CREATE action.
    @category = Category.new
  end
  def create
    #create a new category based on the params received from the partial form.
    @category = Category.new(params[:category])
    if @category.save
      #if saved display confirmation and redirect to the INDEX action (categories_path)
      flash[:success] = 'Category was successfully created.'
      redirect_to categories_path
    else
      #if it is not saved the reason will be displayed (please see partial form for details)
      # and render the NEW action, so the partial form can be changed to pass the validations.
      render action: "new"
    end
  end
  def show
    #this action is very important, as it will display all the products related to a specific category.
    #first we need to find the category by its id.
    @category = Category.find(params[:id])
    #than we store all the products related to this category in the variable @products
    @products = @category.products
  end
  def edit
    #similar to the NEW action, but instead of create a empty category, we will find a category
    # by its id and than send its params to the partial form, so the params can be edited.
    #@category variable will be used in the partial form, when submitted goes to UPDATE action.
    @category = Category.find(params[:id])
  end
  def update
    #first we find the category edited in the partial form.
    @category = Category.find(params[:id])
    #than we update the category based on the params received from the partial form.
    if @category.update_attributes(params[:category])
      #if attributes updated display confirmation and redirect to the INDEX action (categories_path).
      flash[:success] = 'Category was successfully updated.'
      redirect_to categories_path
    else
      #if it is not saved the reason will be displayed (please see partial form for details)
      # and render the EDIT action, so the partial form can be changed to pass the validations.
      render action: "edit"
    end
  end
  def destroy
    #first we find the category to be deleted by its id.
    @category = Category.find(params[:id])
    #here we check if there are products related to this category by counting the number of products.
    if @category.products.count == 0
      #if there are no products related to this category, the category will be deleted.
      @category.destroy
      #display deletion confirmation and redirect to the INDEX action (categories_path).
      flash[:success] = 'Category was successfully deleted.'
      redirect_to categories_path
    #if there are products related to this category, it will not be deleted.
    else
      #display error message and redirect to the INDEX action (categories_path).
      flash[:error] = "Category can't be deleted, there are products related to this category"
      redirect_to categories_path
    end
  end
end
