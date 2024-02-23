class SocialAccountsController < ApplicationController

    def index
      @accounts = SocialAccount.all
      render json: @accounts
    end

  def create
    google_data, res = GoogleSignupLogin.get_data(params)
    
    if params[:access_token].present?
      if google_data.key?("errors")
        render json: { errors: "Failed to fetch user data from Google." }, status: :unprocessable_entity
      else
        

        account = SocialAccount.new(email: google_data["email"], auth_id: google_data["sub"])

        if account.save
          render json: account, status: :ok
        else
          render json: { errors: account.errors }, status: :unprocessable_entity
        end
      end
    else
      render json: { errors: "Access token not provided" }, status: :unprocessable_entity
    end
  end
end
