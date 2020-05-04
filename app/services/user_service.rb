require 'securerandom'

class UserService
    def initialize(email, desc)
        @email = email
        @desc = desc
    end

    def register
        apikey = SecureRandom.urlsafe_base64        
        user = User.where(email: @email).first
        
        if user.nil?
            user = User.create(email: @email, apikey: apikey, desc: @desc)
        end

        user.apikey = apikey
        user.desc = @desc

        if user.save
            UserMailer.with(user: user, newuser: true).new_key.deliver
            return { errors: [] }
        else
            user.errors
        end
    end
end