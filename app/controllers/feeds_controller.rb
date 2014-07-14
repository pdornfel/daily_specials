class FeedsController < ApplicationController

  before_action :get_feed, :only => [:edit, :show]

  def index
    @feeds = Feed.includes(:specials).all
  end

  def new
    @feed = Feed.new
  end

  def create
    @feed = Feed.new(feed_params)
    if @feed.valid?
      @feed.save
      flash[:success] = 'You successfully created a feed.'
      redirect_to feeds_path
    else
      flash.now[:errors] = @feed.errors.full_messages.first
      render :new
    end
  end

  def edit
  end

  def show
  end

private

  def feed_params
    params.require(:feed).permit(:name, :description, :url, :day_selector, :special_selector)
  end

  def get_feed
    @feed = Feed.find(params[:id])
  end

end