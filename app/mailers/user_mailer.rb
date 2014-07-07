class UserMailer < ActionMailer::Base

  default from: "info@daily_specials.com"


  def send_specials(user)

      @email = user.email
      @specials = []

      user.subscriptions.each do |subscription|
        @specials << subscription.get_todays_special
      end

      mail(to: @email, subject: 'Your daily specials are herea')
  end
end
