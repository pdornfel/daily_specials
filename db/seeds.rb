Feed.find_or_create_by(:name=>"Squeaky Beaker",
            :description=>"An awesome sandwich and salad place with a rotating daily special.",
            :url=>"http://www.squeakybeaker.com/",
            :day_selector=>"#post-23 > div > div > div > h4:nth-child(3) > span",
            :special_selector=>"#post-23 > div > div > div > p:nth-child(4)")

user1 = User.find_or_create_by(:email => 'mbarackman@leaf.me',
            :phone_number => '203-648-6007')

user2 = User.find_or_create_by(:email => 'pdornfel@gmail.com',
            :phone_number => '617-504-8901')

if user1.feeds.empty?
	user1.feeds << Feed.first
end

if user2.feeds.empty?
	user2.feeds << Feed.first
end