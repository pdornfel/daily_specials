Feed.create(:name=>"Squeaky Beaker",
            :description=>"An awesome sandwich and salad place with a rotating daily special.",
            :url=>"http://www.squeakybeaker.com/",
            :day_selector=>"#post-23 > div > div > div > h4:nth-child(3) > span",
            :special_selector=>"#post-23 > div > div > div > p:nth-child(4)")

user1 = User.create(:email => 'mbarackman@leaf.me',
            :phone_number => '203-648-6007')

user2 = User.create(:email => 'pdornfel@gmail.com',
            :phone_number => '617-504-8901')


user1.feeds << Feed.first
user2.feeds << Feed.first