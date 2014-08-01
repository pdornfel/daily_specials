namespace :feeds do

  desc "populate specials from feeds"
  task :scrape => :environment do
    Feed.scrape_specials
  end

  desc "send emails"
  task :send_emails => :environment do
    User.send_emails
  end

  desc "send texts"
  task :send_texts => :environment do
    User.send_texts
  end

  desc "scrape and send"
  task :scrape_and_send => :environment do

    if !Time.now.saturday? || !Time.now.sunday?
      Rake::Task['feeds:scrape'].invoke
      Rake::Task['feeds:send_texts'].invoke
  end

    if Time.now.friday?
      Rake::Task['feeds:send_emails'].invoke
    end
  end

end