class UsersController < ApplicationController
    # Use Knock to make sure the current_user is authenticated 
    #before completing request.
    before_action :authenticate_user,  only: [:show_current,  
                                              :update]
    before_action :authorize_as_admin, only: [:index, :show, :update]
    before_action :authorize,          only: [:update]
    
    # Should work if the current_user is admin.
    def index
        @users = User.all
        render json: @users
    end
    
    def show
        @user = User.find(params[:id])
        render json: @user, status: :ok
    end

    # Call this method to check if the user is logged-in.
    # If the user is logged-in we will return the user's information.
    def show_current
        @current = User.find(current_user.id)
        render json: @current, status: :ok
    end
    
    def create
        @user = User.new(user_params)   
   
        if @user.save
            render json: @user, status: :ok
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    private
    # Setting up strict parameters for when we add account creation.
    def user_params
        params.require(:user).permit(:name, 
                                     :phone, 
                                     :address, 
                                     :email,
                                     :password, 
                                     :password_confirmation, 
                                     :role, 
                                     :location_id)
    end
    
    # Adding a method to check if current_user can update itself. 
    # This uses our UserModel method.
    def authorize
        render status: :unauthorized unless (current_user && 
            current_user.can_modify_user?(params[:id]))
    end
end
