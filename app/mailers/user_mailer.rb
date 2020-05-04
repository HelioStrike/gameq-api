class UserMailer < ApplicationMailer
    default from: ENV['gmail_username']
   
		def new_key
			@user = params[:user]
      mail(to: @user.email, subject: 'Your GameQ API key')
    end
  end