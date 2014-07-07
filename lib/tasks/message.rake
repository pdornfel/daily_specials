namespace :message do


  desc "populate specials from feeds"
  task populate_and_send_messages: :environment do

    #populate specials table
    sq = SqueakyBeaker.new
    sq.get_special_from_web
    sq.populate_special_table

    #get list of users
    users = User.all
    users.each do |user|
        UserMailer.send_specials(user).deliver
      end

  end

end







      # specials = [{description: subscription.feed.specials.last.description, day_description: subscription.feed.specials.last.day_description}]
