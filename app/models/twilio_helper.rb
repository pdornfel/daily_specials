require 'twilio-ruby' 

class TwilioHelper

	def initialize
		# put your own credentials here 
		account_sid = ENV['account_sid']
		auth_token = ENV['auth_token']


		# set up a client to talk to the Twilio REST API 
		@client = Twilio::REST::Client.new account_sid, auth_token  
	end

	def text_specials(user)

		phone_number = user.phone_number
		specials = []
		formatted_text = ""

		user.subscriptions.each do |subscription|
			specials << subscription.get_todays_special
		end

		specials.each do |special| 
			formatted_text.concat("#{special.feed.name} - #{special.day_description} - #{special.description}")
		end

		if !user.subscriptions.empty? && Special.last != Special.last[-2]
			@client.account.messages.create({
				:from => '+18572541160', 
				:to => phone_number, 
				:body => "Here are your Specials for Today: #{formatted_text}",  
			})
		end
	end

end


 

