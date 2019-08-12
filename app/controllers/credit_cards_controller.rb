class CreditCardsController < ApplicationController
    # Use Knock to make sure the current_user is authenticated 
    #before completing request.
    before_action :authenticate_user,  only: [:index_current, 
                                              :show_current, 
                                              :create_current,
                                              :update_current]
    before_action :authorize_as_admin, only: [:index, :show, :update, :delete]
    
    def index
        @credit_cards = CreditCard.all
        render json: @credit_cards, status: :ok
    end
    
    def index_current
        @current = User.find(current_user.id)
        @credit_cards = @current.credit_cards.all
        render json: @credit_cards, status: :ok
    end

    def show
        @credit_card = CreditCard.find(params[:id])
        render json: @credit_card, status: :ok
    end

    def show_current
        @credit_card = current_user.credit_cards.find(params[:id])
        render json: @credit_card, status: :ok
    end

    def create_current
        @current = User.find(current_user.id)
        @credit_card = @current.credit_cards.build(credit_card_params)

        if @credit_card.save
            render json: @credit_card, status: :ok  
        else
            render json: @credit_card.errors, status: :unprocessable_entity
        end
    end

    def update
        @user = User.find(params[:user_id])
        @credit_card = @user.credit_cards.find(params[:id])

        if @credit_card.update(credit_card_params)
            render json: @credit_card, status: :ok  
        else
            render json: @credit_card.errors, status: :unprocessable_entity
        end
    end

    def update_current
        @current = User.find(current_user.id)
        @credit_card = @current.credit_cards.find(params[:id])

        if @credit_card.update(credit_card_params)
            render json: @credit_card, status: :ok  
        else
            render json: @credit_card.errors, status: :unprocessable_entity
        end
    end

    def delete
        @user = User.find(params[:user_id])
        @credit_card = @user.credit_cards.find(params[:id])

        if @credit_card.destroy
            render json: @credit_card, status: :ok
        else
            render json: @credit_card.errors, status: :unprocessable_entity
        end
    end

    def delete_current
        @current = User.find(current_user.id)
        @credit_card = @current.credit_cards.find(params[:id])

        if @credit_card.destroy
            render json: @credit_card, status: :ok
        else
            render json: @credit_card.errors, status: :unprocessable_entity
        end
    end
    
    private
    # Setting up strict parameters for when we add account creation.
    def credit_card_params
        params.require(:credit_card).permit(:card_number, 
                                            :expiration_date, 
                                            :titular_name, 
                                            :billing_address,
                                            :bank_id)
    end   
end
