class OrdersController < ApplicationController

  #method authorize was declared on the application controller to check if the user is logged.
  #here we are blocking the SHOW and INDEX actions to be executed if the user is not logged.
  #also blocking EDIT and UPDATE as only logged users can edit details.
  before_filter :authorize, only: [ :show, :index, :edit, :update ]

  #method admin was declared on the application controller to check if the logged user has admin privileges
  #here we are blocking the below actions to be executed if the logged user is not admin.
  before_filter :admin, only: [ :index, :edit, :update ]

  #index action is protected above, so only user with admin privileges can access it.
  def index
    #here we find all orders in the orders table and add to the @orders variable.
    @orders = Order.all
  end

  #show action is available only for logged users.
  def show
    #here we find the other by its id.
    @order = Order.find(params[:id])
    #however we need to prevent users to access orders from other users, so we check id the found order
    #                                                                      belongs to the logged users.
    unless @order.user.id == current_user.id
      #if not we display an error message and redirect to the "manage account" for the logged user.
      flash[:error] = 'Authorisation is required to access this content.'
      redirect_to user_path(current_user)
    end
  end

  def new
    #despite the fact that the link to check out is only available if the cart is not empty
    #       (please see cart partial for details), we can also avoid empty orders as below.
    #to avoid empty orders, we ensure that there are products (line_items) in the cart.
    if current_cart.line_items.empty?
      #if cart is empty display error message.
      flash[:error] = "Your cart is empty"
      redirect_to store_path
    #if cart is not empty, we need to check that the user is logged.
    elsif current_user.nil?
      #if user is not logged, we display error message and redirect to login_path (new session).
      flash[:error] = "Please login first"
      redirect_to login_path
    #if the user is logged and the cart is not empty we can proceed.
    else
    #here we create a new class Order (empty), so the card details will be filled in the NEW view.
    @order = Order.new
    #we also create a variable to store all the items in the cart, so we can show the items in the checkout page.
    @items = current_cart.line_items
    end
  end

  def create
    #now we create a new order based in the params filled in the form (NEW view)
    @order = Order.new(params[:order])
    #than we add the line_items from the cart to the order (please note order model for details, as the method
    #                                                             add_line_items_from_cart was created there).
    @order.add_line_items_from_cart(current_cart)
    #we also need to specify which user the new order belongs, so we add the current user id to the column user_id
    #                                                                                         in the orders table.
    @order.user_id = current_user.id
    #now we try to save the order
    if @order.save
      #if the order was saved (line items added to the order) we can destroy the current cart.
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      #so we display a success message and redirect to the application INDEX (store_path).
      flash[:success] = 'Thank you for shopping with us. Please see your order status under the "Manage Account" session.'
      redirect_to store_path
    else
      #if it is not saved the reason will be displayed (please see NEW view for details)
      #   and render the NEW action, so the form can be changed to pass the validations.
      #please note that we need the @items declared in the NEW action again here, as we are displaying
      #                                                             it above the form in the NEW view.
      @items = current_cart.line_items
      render 'new'
    end
  end

  #only logged users with admin privileges can access this action.
  def edit
    #similar to the NEW action, but instead of create a empty order, we will find a order
    #   by its id and than send only the STATUS to the partial form, so it can be edited.
    #@order variable will be used in the partial form, when submitted goes to UPDATE action.
    @order = Order.find(params[:id])
  end

  def update
    #first we find the order edited in edit view (actually only the STATUS will be edited).
    @order = Order.find(params[:id])
    #than we update the order based on the new status received from the edit view.
      if @order.update_attributes(params[:order])
        #if status updated display confirmation and redirect to the INDEX action (orders_path).
        flash[:success] = 'Order status changed to ' + @order.status
        redirect_to orders_path
      else
        #if it is not saved the reason will be displayed (please see edit view for details)
        # and render the EDIT action, so the status can be changed to pass the validations.
        render action: "edit"
      end
  end

end
