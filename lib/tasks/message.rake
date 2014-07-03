namespace :subscription do


  desc "populate specials from feeds"
  task populate_and_send_messages: :environment do

    sq = SqueakyBeaker.new
    sq.get_special_from_web
    sq.populate_special_table



  end

end
