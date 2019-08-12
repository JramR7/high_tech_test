class UsersController < ApplicationController
    # Use Knock to make sure the current_user is authenticated 
    #before completing request.
    before_action :authenticate_user,  only: [:show_current,  
                                              :update_current]
    before_action :authorize_as_admin, only: [:index, :show, :update]
    
    def index
        @users = User.all
        render json: @users, status: :ok
    end
    
    def show
        @user = User.find(params[:id])
        render json: @user, status: :ok
    end

    def show_current
        render json: current_user, status: :ok
    end
    
    def create
        @user = User.new(user_params)   

        if @user.save
            render json: @user, status: :ok  
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def update
        @user = User.find(params[:id])
   
        if @user.update(user_params)
            render json: @user, status: :ok  
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def update_current       
        if current_user.update(user_params)
            render json: current_user, status: :ok  
        else
            render json: current_user.errors, status: :unprocessable_entity
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
end
