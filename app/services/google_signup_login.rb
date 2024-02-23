require 'httparty'
class GoogleSignupLogin
    class << self
      def get_data(params)
        begin
          uri = URI("https://www.googleapis.com/oauth2/v3/userinfo?access_token=#{params[:access_token]}")
          res = Net::HTTP.get_response(uri)
        rescue Exception => e
          return [], e
        end
        data = JSON.parse(res.body)
        return data, res
      end
    end
end