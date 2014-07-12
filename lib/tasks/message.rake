namespace :message do


  desc "populate specials from feeds"
  task go: :environment do

    #populate specials table
    sq = SqueakyBeaker.new
    sq.get_special_from_web
    sq.populate_special_table

    #get list of users
    users = User.all

    #send emails
    users.each do |user|
      UserMailer.email_specials(user).deliver
    end

    #send text messages
    users.each do |user|
      TwilioHelper.new.text_specials(user)
    end

  end

end