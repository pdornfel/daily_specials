class SubscriptionsController < ApplicationController

	def index
	  	@subscription = User.new
	end


	def create
		user = User.find_or_create_by(email: email_params)
		subscription = user.subscriptions.create
		subscription.feed = Feed.find_or_create_by(name: 'Squeaky Beaker', url: "http://www.squeakybeaker.com/")
		if subscription.save
			flash[:notice] = "Congrats - youre signed up"
			redirect_to subscriptions_path
		else
			flash[:warning] = subscription.errors.messages[:user_id].first
			redirect_to subscriptions_path
		end
	end


	private

	def email_params
		params.require(:email)
	end


end