class SubscriptionsController < ApplicationController

	def index
	  	@subscription = User.new
	end


	def create
		user = User.find_or_create_by(email: email_params)
		user.subscriptions << Feed.find_or_create_by(name: 'Squeaky Beaker')
		flash[:notice] = "Congrats - youre signed up"
		redirect_to subscriptions_path
	end


	private

	def email_params
		params.require(:email)
	end


end