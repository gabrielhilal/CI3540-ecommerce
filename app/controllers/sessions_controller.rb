class SessionsController < ApplicationController

# The sessions controller is based on the book: Ruby on Rails Tutorial-Learn
#            Rails by Example (Michael Hartl)-http://ruby.railstutorial.org/,
#        full reference details are available in the report's reference list.

  def new
    #before displaying the login form we need to check if the user is already logged.
    unless current_user.nil?
      #if current_user is not nil (someone is logged) we redirect to the application INDEX (store_path)
      redirect_to store_path
    end
  end

  def create
  #first we find the user by its email based on the params email in the login form.
  user = User.find_by_email(params[:email])
  #here we compare the found user (if found) with its password too check if it is correct.
  #if user was found by its email AND the password is correct we create a new session based in the users id.
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    #in the application controller we will find the created session and call it as current_user, so we can
    #                  display the confirmation message and redirect to the application INDEX (store_path).
    #                                                   Please note the application controller for details.
    flash[:success] = "Welcome " + current_user.name
    redirect_to store_path
  else
    #is user wasn't found by its email or the password wasn't correct we display the error message and render
    #                                         the login form, so the user can change the details to try again.
    flash.now[:error] = "Invalid email/password combination."
    render "new"
  end
end

def destroy
  #when destroy method is called (link logout is clicked) we destroy the current session adding nil to the user
  #         session. Than we display a confirmation message and redirect to the application INDEX (store_path).
  session[:user_id] = nil
  flash[:success] = "Logged out"
  redirect_to store_path
end
end
