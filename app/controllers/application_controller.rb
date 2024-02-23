class ApplicationController < ActionController::API
    # before_action :authenticate_request
    private
    
      def authenticate_request
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        begin
          @decoded = Jsonwebtoken.decode(header)
          @current_account = Account.find(@decoded[:account_id])
        rescue ActiveRecord::RecordNotFound => e
          render json: { errors: e.message }, status: :unauthorized
        rescue JWT::DecodeError => e
          render json: { errors: e.message }, status: :unauthorized
        end
      end
end