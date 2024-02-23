class Account < ApplicationRecord
    has_secure_password
    # validates :auth_id, uniqueness: :true
    # validates :email, presence: true, unless: :social_account?
    # validates :username, presence: true
    # private
    # def social_account?
    #     self.type == 'SocialAccount'
    # end
end
