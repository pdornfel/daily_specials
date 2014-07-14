namespace :feeds do

  desc "populate specials from feeds"
  task :scrape => :environment do
    Feed.scrape_specials
  end

  desc "send emails"
  task :send_emails => :environment do 
    User.all.each do |user|
      UserMailer.email_specials(user).deliver
    end    
  end

  desc "send texts"
  task :send_emails => :environment do 
    User.all.each do |user|
      TwilioHelper.new.text_specials(user)
    end
  end

  desc "scrape and send"
  task :scrape_and_send => :environment do
    Rake::Task['feeds:scrape'].invoke
    Rake::Task['feeds:send_emails'].invoke
    Rake::Task['feeds:send_texts'].invoke
  end

end