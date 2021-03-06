class ApplicationController < ActionController::Base
  protect_from_forgery
  #the code below was based on the book "Agile Web Development with Rails" (page 106), full reference details are available in the report's reference list.
  private
  #everything declared in the private will be available only for controllers.
  # Furthermore, it prevents the methods to be available as an action in the controllers.

  #here we start the "current_cart" method.
  def current_cart
    #first we try to find the cart by its ID.
    Cart.find(session[:cart_id])
    #if the cart can't be found we create a new cart.
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    #this method returns the current cart or (if it doesn't exist) a new cart.
    cart
  end
  #the helper_method will allow the current_cart to be used in any view (html.erb)
  helper_method :current_cart

  #method to find the current user (logged user), based on the book: Ruby on Rails Tutorial-Learn Rails by Example
  # (Michael Hartl)-http://ruby.railstutorial.org/, full reference details are available in the report's reference list.

  #here we start the "current_user" method.
  def current_user
    #||= means that the operation on the right will be called only the first time, so after the variable has
    # a value it returns current_user without calling the operation on the right.
    #if session[:user_id] was created in the session controller CREATE action, we find the user by its id and
    # add it to the @current_user variable.
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  #the helper_method will allow the "current_user" to be used in any view (html.erb)
  helper_method :current_user

  #create a method to protect actions to be proceeded if the user is not admin. Please note comments on
  # controllers for details (products controller, for example, can only be accessed by a logged user with admin privileges).
  def admin
    unless current_user.admin?
      #if logged user is not admin display error message and redirect to application INDEX (store_path)
      flash[:error] = "Authorisation is required to access this content."
      redirect_to store_path
    end
  end

  #create a method to protect actions to be proceeded if the user is not logged. Please note comments on
  # controllers for details (action SHOW on user controller, for example, can only be accessed by a logged user.
  def authorize
    unless User.find_by_id(session[:user_id])
      #if user is not logged, display error message and redirect to session NEW (login_path)
      flash[:error] = "Please login first."
      redirect_to login_path
    end
  end
end
