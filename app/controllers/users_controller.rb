class UsersController < ApplicationController
  #method authorize was declared on the application controller to check if the user is logged.
  #here we are blocking the SHOW and INDEX actions to be executed if the user is not logged.
  #also blocking EDIT and UPDATE as only logged users can edit details.
  before_filter :authorize, only: [ :show, :index, :edit, :update ]
  #method admin was declared on the application controller to check if the logged user has admin privileges.
  #here we are blocking the below actions to be executed if the logged user is not admin.
  before_filter :admin, only: [ :index, :destroy ]

  #index action is available only for user with admin privileges, but first we check if the user is logged with
  # the authorize method. Otherwise we will have an error, as admin method check the current user, if there is
  # no current user current_user.admin? doesn't exist (application error!!).
  def index
    #@users will store all the users available in the table users.
    @users=User.all
  end
  #show action is available only for logged users, as per method authorize above.
  def show
    #here e find the user by its id to display its information. However, we need to impede users without
    # admin privileges to see other users information.
    #so first we check if someone is logged.
    unless current_user.nil?
      #if someone is logged we need to check if the logged user if admin.
      if current_user.admin?
        #if the user is admin we allow finding a user by its id.
        @user = User.find(params[:id])
      #if the logged user is not admin we add the current user in the variable @user, so the show view
      # will display only the current user information.
      else
        @user = current_user
      end
    end
  end
  def new
    #fist we need to check if there is someone already logged.
    if current_user.nil?
      #if not, we create a new class User (empty).
      #@user variable will be used in the partial form (empty form), when submitted goes to CREATE action.
      @user = User.new
      #here we ensure that the new user will not be set as admin. Please note partial form for details.
      @user.admin ||= "0"
    #if there is someone logged (current_user exists) we do the below.
    else
      #we need to check if the current user is admin, as only logged users with admin privileges can create new users.
      if current_user.admin?
        #if current_user has admin privileges.
        #@user variable will be used in the partial form (empty form), when submitted goes to CREATE action.
        #please note partial form for details, where we only display admin check box for admin users.
        @user = User.new
      #the last option is for logged users without admin privileges. If so, we display an error massage
      # asking the user to logout before creating a new account, and redirect to the INDEX application (store_path).
      else
        flash[:error] = "Please logout first"
        redirect_to store_path
      end
    end
  end
  def create
    #create a new user based on the params received from the partial form.
    @user = User.new(params[:user])
    #first we need to check if the user has been successfully saved.
    if @user.save
      #if saved we need to check if there is a user logged (only admin can be logged at this stage,
      # please see action NEW for details).
      if current_user.nil?
        #if current_user doesn't exist (nobody is logged) we create a new session based in the saved user.
        #the created user will be automatically logged in, a message welcome will be created and redirect
        # to the application INDEX (store_path).
        session[:user_id] = @user.id
        flash[:success] = "Welcome " + @user.name
        redirect_to store_path
      #if the current_user is not nil, means that the logged user has admin privileges, please see action
      # NEW for details. Display success message and redirect to the INDEX action (users_path).
      else
        flash[:success] = "User " + @user.name + " created!"
        redirect_to users_path
      end
    #if the user is not saved the reason will be displayed (please see partial form for details)
    # and render the NEW action, so the partial form can be changed to pass the validations.
    else
      render "new"
    end
  end
  #edit action is available only for logged user as per "before_filter :authorize".
  def edit
    #similar to the NEW action, but instead of create a empty user, we will find a user by its id and than
    # send its params to the partial form, so the params can be edited. Please note the partial form
    # for details, as the column admin can be edited only buy logged users with admin privileges.
    #@user variable will be used in the partial form, when submitted goes to UPDATE action.
    @user = User.find(params[:id])
    #only admin can edit other users information, so we first check if the user is admin.
    unless current_user.admin?
      #if the user is not admin it can edit only its own information, so we redirect to edit its own information
      unless @user.id == current_user.id
        redirect_to edit_user_path (current_user)
      end
    end
  end
  #update action is available only for logged user as per "before_filter :authorize".
  def update
    #first we find the user edited in the partial form.
    @user = User.find(params[:id])
    #than we update the user based on the params received from the partial form.
    if @user.update_attributes(params[:user])
      #if attributes updated display confirmation.
      flash[:success] = "User details updated!"
        #if logged user is admin redirect to the INDEX (users_path).
        if current_user.admin?
          redirect_to users_path
        #if logged user isn't admin redirect to application INDEX (store_path).
        else
          redirect_to user_path
        end
    #if it user is not saved, the reason will be displayed (please see partial form for details)
    # and render the EDIT action, so the partial form can be changed to pass the validations.
    else
      render 'edit'
    end
  end
  #destroy action is available only for users with admin privileges, as per "before_filter :admin".
  def destroy
    #first we find the user by its id.
    @user = User.find(params[:id])
    #than we need to check if the user is not trying to delete its self. So, we check if the found user is the logged one.
    if @user == current_user
      #if yes, we display the error message and redirect to INDEX action.
      flash[:error] = "User can't be deleted"
      redirect_to users_path
    else
      #if the logged user in not the same as the user to be deleted, we can delete it and display a success message.
      @user.destroy
      flash[:success] = "User deleted!"
      redirect_to users_path
    end
  end
end
