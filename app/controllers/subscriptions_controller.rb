class SubscriptionsController < ApplicationController

def index
  @subscription = User.new
end


def create
  binding.pry
end


end