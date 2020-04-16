require 'nokogiri'
require 'pry'
require 'open_uri_redirections'

# require_relative "scraper.rb"
# require_relative "clinteraction.rb"



class Commentary
    @@locate = []
    attr_accessor :prefix, :abbr, :state, :area



    def initialize(prefix, abbr)
        @prefix = prefix
        @abbr = abbr
        @state = state
        @area = area
        @@locate << self
    end


url = 'https://en.wikipedia.org/wiki/List_of_ZIP_Code_prefixes' #location prefix
url4 = 'https://www.sportingnews.com/au/nfl/list/ranking-nfl-stadiums-from-worst-to-best/1eoanvku1n1n51o76bo4o5rc9i/31' #POV ranking

location_query  = URI.open(url)
locations = Nokogiri::HTML(location_query)
opinions_page = URI.open(url4)
scrapped_opinion = Nokogiri::HTML(opinions_page)

            cities = scrapped_opinion.css('#\32 3 > figure > div.section-label.alt-font > span').text
            viewpoint = scrapped_opinion.css('#\31 7 > div > div > p:nth-child(2)')
            ## if Stadium.city == cities, return "commentary" Make a comments Class. and make comments an object.new(city,opinion)
            #-------------------------------------

            # for asking for zip. Use zip to list (by number) stadiums in that state
            prefix = locations.css('#mw-content-text > div > table:nth-child(n+1) > tbody > tr:nth-child(n+1) > td:nth-child(n+1) > b').text
            prefix = prefix.to_s.delete("^0-9").scan(/.{3}/).drop(5)
            abbr = locations.css('#mw-content-text > div > table:nth-child(n+1) > tbody > tr:nth-child(n+1) > td:nth-child(n+1) > b > a').text.scan(/.{2}/) #state abbr.
            # state = locations.css('#mw-content-text > div > table:nth-child(n+1) > tbody > tr:nth-child(n+1) > td:nth-child(n+1) > span > b > a > value').text #full state name.
            # area = locations.css('#mw-content-text > div > table:nth-child(n+1) > tbody > tr:nth-child(n+1) > td:nth-child(n+1) > span > b > a').text.split(/(?<=[a-z])(?=[A-Z])/)

x= 1
            until x >  prefix.length do
                zip = [prefix[x], abbr[x]]
                zip = Commentary.new(prefix[x], abbr[x])
                x+=1

                end
            end

