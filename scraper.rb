require 'nokogiri'
require 'open_uri_redirections'
require 'pry'

# require_relative "clinteraction.rb"

class Scraper
    attr_accessor :stadium_name, :capacity, :location, :surface, :year_opened, :team_name, :stadium

@@all = []
@@locate = []

    def initialize(stadium_name, capacity, location, surface, teams, year_opened)
        @stadium_name = stadium_name
        @capacity = capacity
        @surface = surface
        @location = location
        @teams = teams
        @year_opened = year_opened
        @@all << self
    end

    def all
        @@all
    end

        url = 'https://en.wikipedia.org/wiki/List_of_ZIP_Code_prefixes' #location prefix
        url2 = 'https://en.wikipedia.org/wiki/List_of_current_National_Football_League_stadiums' #stadium info
        url4 = 'https://www.sportingnews.com/au/nfl/list/ranking-nfl-stadiums-from-worst-to-best/1eoanvku1n1n51o76bo4o5rc9i/31' #POV ranking

##prework
        location_query = URI.open(url)
        locations = Nokogiri::HTML(location_query)
        opinions_page = URI.open(url4)
        scrapped_opinion = Nokogiri::HTML(opinions_page)
        stadium_query = URI.open(url2)
        stadium_info = Nokogiri::HTML(stadium_query)
                stadium_name = stadium_info.css('#mw-content-text > div > table:nth-child(19) > tbody > tr:nth-child(n+1) > th > a').text
                stadium_name.gsub(/{'MetLife |Met Life''Fed Ex', 'Link', 'AT&T', 'Century|Century Link', "Energy', 'SoFi'}/, 'Fed Ex' => ' Fedex', 'Link' => 'Link', 'AT&T' => ' AT&T ', 'Century|Centurylink' => "Centurylink".chomp(""), 'Energy' => 'energy', 'MetLife\Met Life' => 'MetLife', 'SoFi' => 'So-Fi')
                    # if str.length >
                stadium_name = stadium_name.split(/(?<=[a-z])(?=[A-Z])/)
                capacity = stadium_info.css('#mw-content-text > div > table:nth-child(19) > tbody > tr:nth-child(n+1) > td:nth-child(3)').text.chomp("\n").split("\n")
                location = stadium_info.css('#mw-content-text > div > table:nth-child(19) > tbody > tr:nth-child(n+1) > td:nth-child(4) > a').text.split /(?<=[a-z])(?=[A-Z])/
                surface = stadium_info.css('#mw-content-text > div > table:nth-child(19) > tbody > tr:nth-child(n+1) > td:nth-child(5)').text.chomp("\n").split("\n")
                teams = stadium_info.css('#mw-content-text > div > table:nth-child(19) > tbody > tr:nth-child(n+1) > td:nth-child(7) > a').text.split /(?<=[a-z])(?=[A-Z])/
                year_opened = stadium_info.css('#mw-content-text > div > table:nth-child(19) > tbody > tr:nth-child(n+1) > td:nth-child(8)').text.chomp("\n").split("\n")
                x = 0
                29.times do
                    stadium = [stadium_name[x], capacity[x], location[x], surface[x], teams[x], year_opened[x]]
                    stadium = Scraper.new(stadium_name[x], capacity[x], location[x], surface[x], teams[x], year_opened[x])
                    x+=1
                end
binding.pry
            end
