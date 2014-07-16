class TwilioHelper

	def initialize
		# put your own credentials here
		account_sid = TWILIO_CONFIG[:twilio_account_sid]
		auth_token = TWILIO_CONFIG[:twilio_auth_token]


		# set up a client to talk to the Twilio REST API
		@client = Twilio::REST::Client.new(account_sid, auth_token)
	end

	def text_specials(user)

		body_text = "Here are your Specials for Today: "

		user.latest_specials.each do |special|
			body_text += "#{special.feed_name} => #{special.day_description} - #{special.description},"
		end

		if !user.subscriptions.empty? && Special.last != Special.last[-2]
			@client.account.messages.create({
				:from => TWILIO_CONFIG[:twilio_from_phone_number],
				:to => user.phone_number,
				:body => body_text,
			})
		end
	end

end




