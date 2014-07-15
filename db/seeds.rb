Feed.create(:name=>"Squeaky Beaker",
            :description=>"An awesome sandwich and salad place with a rotating daily special.",
            :url=>"http://www.squeakybeaker.com/",
            :day_selector=>"#post-23 > div > div > div > h4:nth-child(3) > span",
            :special_selector=>"#post-23 > div > div > div > p:nth-child(4)")

user = User.create(:email => 'mbarackman@leaf.me',
            :phone_number => '2036486007')


user.feeds << Feed.first