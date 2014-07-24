class UserMailer < ActionMailer::Base

  default from: "pdornfeld@leaf.me"

  	def email_specials(user)

      @user = user
      @specials = []
      @date = DateTime.now.strftime('%A, %B %d, %Y')

      if !user.feeds.empty?
	    	  mail(to: @user.email, subject: 'Your daily specials are here!')
	    end
    end

end

