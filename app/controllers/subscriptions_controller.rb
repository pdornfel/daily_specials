class SubscriptionsController < ApplicationController

	def index
	  @subscription = User.new
	  @feeds = Feed.all
	end


	def create
		user = User.new(email: params[:email], phone_number: params[:phone_number])
		if user.valid?
			user = User.find_or_create_by(email: params[:email], phone_number: params[:phone_number])
				subscription = user.subscriptions.create
				subscription.feed = Feed.find_or_create_by(name: 'Squeaky Beaker', url: "http://www.squeakybeaker.com/")
				subscription.save

				flash[:notice] = "Congrats - youre signed up"
				redirect_to subscriptions_path
		else
			flash[:warning] = "Please enter your phone number and email"
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