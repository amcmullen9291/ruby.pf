require'nokogiri'
require 'pry'
require 'open-uri'

require_relative 'commentary.rb'
require_relative 'stadium.rb'
require_relative 'clinteraction.rb'


class Scraper
    attr_accessor :stadium_name, :capacity, :location, :surface, :year_opened, :team_name, :stadium


        url = 'https://en.wikipedia.org/wiki/List_of_ZIP_Code_prefixes' #location prefix
        url2 = 'https://en.wikipedia.org/wiki/List_of_current_National_Football_League_stadiums' #stadium info
        url3 = 'https://www.tiemart.com/blogs/tiepedia/nfl-team-colors' #team colors
        url4 = 'https://www.sportingnews.com/au/nfl/list/ranking-nfl-stadiums-from-worst-to-best/1eoanvku1n1n51o76bo4o5rc9i/31' #POV ranking

##prework
        location_query  = URI.open(url)
        locations = Nokogiri::HTML(location_query)
        opinions_page = URI.open(url4)
        scrapped_opinion = Nokogiri::HTML(opinions_page)
        stadium_query = URI.open(url2)
        stadium_info = Nokogiri::HTML(stadium_query)

            xyx=2
            until xyx == 30
                stadium_name = stadium_info.css('#mw-content-text > div > table:nth-child(19) > tbody > tr:nth-child(xyx) > th > a').text
                capacity = stadium_info.css('#mw-content-text > div > table:nth-child(19) > tbody > tr:nth-child(xyx) > td:nth-child(3)').text
                location = stadium_info.css('#mw-content-text > div > table:nth-child(19) > tbody > tr:nth-child(xyx) > td:nth-child(4) > a').text
                surface = stadium_info.css('#mw-content-text > div > table:nth-child(19) > tbody > tr:nth-child(xyx) > td:nth-child(5)').text
                teams = stadium_info.css('#mw-content-text > div > table:nth-child(19) > tbody > tr:nth-child(xyx) > td:nth-child(7) > a').text
                year_opened = stadium_info.css('#mw-content-text > div > table:nth-child(19) > tbody > tr:nth-child(xyx) > td:nth-child(8)').text

                stadium = Stadium.new(stadium_name, capacity, location, surface, teams, year_opened)
                xyx+=1
            end

            # cities = scrapped_opinion.css('#\32 3 > figure > div.section-label.alt-font > span').text
            # ## if Stadium.city == cities, return "commentary" Make a comments Class. and make comments an object.new(city,opinion)

    #for asking for zip. Use zip to list (by number) stadiums in that state
        tb =2
        col = 1
        rw = 1
        while tb < 24
          1.loop do
            rw = (1..10)
                1.loop do
                col = (1..10)
                prefix = locations.css('#mw-content-text > div > table:nth-child(tb) > tbody > tr:nth-child(col) > td:nth-child(rw) > b')
                prefix = prefix.to_s.delete("^0-9")
                abbr = locations.css('#mw-content-text > div > table:nth-child(tb) > tbody > tr:nth-child(col) > td:nth-child(rw) > b > a').text #state abbr.
                state = locations.css('#mw-content-text > div > table:nth-child(tb) > tbody > tr:nth-child(col) > td:nth-child(rw) > b > a')[0]['title'] #full state name.
                    if col == 10
                        rw +=1
                    end
                end
                if row == 10
                    tables +=2
                end
            end
        zip = Commentary.new(prefix, abbr, state)
        end

    # binding.pry
#thoughts. add a pictures to details page.and a song to the wisconsin page #"wisconins state song"
#besides scraper, stadium class and comments class, which holds state abrr(s) and #comments. CLI is #like Owner class - it holds the methods.
end
