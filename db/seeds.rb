Feed.find_or_create_by(:name=>"Squeaky Beaker",
            :description=>"An awesome sandwich and salad place with a rotating daily special.",
            :url=>"http://www.squeakybeaker.com/",
            :day_selector=>"#post-23 > div > div > div > h4:nth-child(3) > span",
            :special_selector=>"#post-23 > div > div > div > p:nth-child(4)")

user = User.find_or_create_by(:email => 'pdornfel@gmail.com',
            :phone_number => '617-504-8901')

if user.feeds.empty?
	user.feeds << Feed.first
end

