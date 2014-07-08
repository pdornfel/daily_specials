class UserMailer < ActionMailer::Base

  default from: "info@daily_specials.com"


  	def send_specials(user)

      @email = user.email
      @specials = []
      @time = DateTime.now.strftime('%B %d, %Y')


      if !user.subscriptions.empty?
	  	user.subscriptions.each do |subscription|
	    	@specials << subscription.get_todays_special
	    	mail(to: @email, subject: 'Your daily specials are herea')
	     end
	  end
  	end
end
