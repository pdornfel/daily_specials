require 'nokogiri'
require 'open-uri'

class Nokogiri

  def initialize

    doc = Nokogiri::HTML(open('http://www.squeakybeaker.com/'))

    @day = doc.css('#post-23 > div > div > div > h4:nth-child(3) > span').text
    @special = doc.css('#post-23 > div > div > div > p:nth-child(4)').text

  end

end


