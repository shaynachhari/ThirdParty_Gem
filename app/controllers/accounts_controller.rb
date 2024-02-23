class AccountsController < ApplicationController
    skip_before_action :authenticate_request, only: [:create]
    before_action :set_account, only: [:show, :update, :destroy]
  

    def index
      @accounts = Account.all
      render json: @accounts
    end
  
   def show
      @account = Account.find(params[:id])
      render json: @account, status: :ok
    end
  

    def create
      @account = Account.new(account_params)
      if @account.save
        render json: @account, status: :ok
      else
        render json: {error: "Record not Created!"}, status: :unprocessable_entity
      end
    end

    def update
       if @account.update(account_params)
        render json: @account, status: :ok
       else
        render json: {error: "Record not updated!"}, status: :unprocessable_entity
       end
    end
  

    def destroy
      @account.destroy
      render json: @account, status: :ok
    end
  

   
    private
    def set_account
       @account = Account.find(params[:id])
       
    end
  
    def account_params
      params.permit(:email,  :password,:username, :auth_id, :type )
    end
end
