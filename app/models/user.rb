class User < ApplicationRecord
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :desc, length: {minimum: 5, maximum: 200}, allow_blank: true
end
