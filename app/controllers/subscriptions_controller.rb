class SubscriptionsController < ApplicationController

	def index
	  @subscription = User.new
	  @feeds = Feed.all
	end


	def create
		email = params[:email].first
		phone_number = params[:phone_number].first
		user = User.new(email: email, phone_number: phone_number)
		if user.valid?
			user = User.find_or_create_by(email: email, phone_number: phone_number)
				if params[:feed]
						params[:feed].each do |feed_id|
							subscription = user.subscriptions.create
							subscription.feed = Feed.find(feed_id)
							subscription.save
						end
				end
				flash[:notice] = "Congrats - youre signed up"
				redirect_to subscriptions_path
		else
			flash[:warning] = user.errors.full_messages
			redirect_to subscriptions_path
		end
	end


	def destroy
		user = User.find(params[:id])
		user.destroy
		flash[:notice] = "#{user.email} - Your subscriptions have been deleted"
		redirect_to subscriptions_path
	end

end