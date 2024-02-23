class SocialAccount < Account
    validates :auth_id, uniqueness: :true
    before_validation :generate_password, on: :create
    validates :email, uniqueness: true, allow_nil: true
    before_save :generate_password, if: :new_record?

   def generate_password
    self.password = SecureRandom.hex(8) unless password.present?
    # self.password ||= SecureRandom.hex(8) 
    puts (self.password + "hello shayna")

   end
end
