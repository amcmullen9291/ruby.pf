#!/usr/bin/env ruby

require 'nokogiri'
require 'open_uri_redirections'
require 'pry'

class Scraper
    attr_accessor :stadium_name, :capacity, :location, :surface, :year_opened, :teams, :abbr, :area, :prefix

@@all = []
@@locate = []
@@comments = []
@@translate = [["Alabama", "AL"], ["Alaska", "AK"], ["Arizona", "AZ"], ["Arkansas", "AR"], ["California", "CA"], ["Colorado", "CO"], ["Connecticut", "CT"], ["Delaware", "DE"], ["Florida", "FL"], ["Georgia", "GA"], ["Hawaii", "HI"], ["Idaho", "ID"], ["Illinois", "IL"], ["Indiana", "IN"], ["Iowa", "IA"], ["Kansas", "KS"], ["Kentucky", "KY"], ["Louisiana", "LA"], ["Maine", "ME"], ["Maryland", "MD"], ["Massachusetts", "MA"], ["Michigan", "MI"], ["Minnesota", "MN"], ["Mississippi", "MS"], ["Missouri", "MO"], ["Montana", "MT"], ["Nebraska", "NE"], ["Nevada",  "NV"], ["New Hampshire", "NH"], ["New Jersey", "NJ"], ["New Mexico", "NM"], ["New York", "NY"], ["North Carolina", "NC"], ["North Dakota", "ND"], ["Ohio", "OH"], ["Oklahoma", "OK"], ["Oregon", "OR"], ["Pennsylvania", "PA"], ["Rhode Island", "RI"], ["South Carolina", "SC"], ["South Dakota", "SD"], ["Tennessee", "TN"], ["Texas", "TX"], ["Utah", "UT"], ["Vermont", "VT"], ["Virginia", "VA"], ["Washington", "WA"], ["West Virginia", "WV"], ["Wisconsin", "WI"],["District of Columbia" , "DC"], ["Wyoming" , "WY"], ["Puerto Rico" , "PR"], ["Virgin Islands" , "VI"]]

    def initialize(stadium_name=nil, capacity=nil, location=nil, surface=nil, teams=nil, year_opened=nil)
        @stadium_name = stadium_name
        @capacity = capacity
        @surface = surface
        @location = location
        @teams = teams
        @year_opened = year_opened
        @prefix = prefix
        @abbr = abbr
        @area = area
        @@all << self
    end

    def all
        @@all
    end

##prework
        url = 'https://simple.wikipedia.org/wiki/List_of_ZIP_Code_prefixes' #zipcode/area info
        url2 = 'https://en.wikipedia.org/wiki/List_of_current_National_Football_League_stadiums' #stadium info
        url4 = 'https://www.sportingnews.com/au/nfl/list/ranking-nfl-stadiums-from-worst-to-best/1eoanvku1n1n51o76bo4o5rc9i/31' #POV ranking

        location_query = URI.open(url)
        zip = Nokogiri::HTML(location_query)
        opinions_page = URI.open(url4)
        scraped_opinion = Nokogiri::HTML(opinions_page)
        stadium_query = URI.open(url2)
        stadium_info = Nokogiri::HTML(stadium_query)
        stadium_name = stadium_info.css('#mw-content-text > div > table:nth-child(19) > tbody > tr:nth-child(n+1) > th > a').text
 #Proper names; Variable inputs
            stadium_name = stadium_name.gsub("MetLife","Metlife ")
            stadium_name = stadium_name.gsub("FedEx"," FedEx ")
            stadium_name = stadium_name.gsub("CenturyLink","Centurylink")
            stadium_name = stadium_name.gsub("AT&T", "AT&T ")
            stadium_name = stadium_name.gsub("SoFi", "So-Fi")
            stadium_name = stadium_name.gsub("High FedEx", "HighFedex" )
            stadium_name = stadium_name.gsub("Energy", " enegry")
        stadium_name = stadium_name.split(/(?<=[a-z])(?=[A-Z])/)
        capacity = stadium_info.css('#mw-content-text > div > table:nth-child(19) > tbody > tr:nth-child(n+1) > td:nth-child(3)').text.chomp("\n").split("\n")
        location = stadium_info.css('#mw-content-text > div > table:nth-child(19) > tbody > tr:nth-child(n+1) > td:nth-child(4) > a').text.split /(?<=[a-z])(?=[A-Z])/
        surface = stadium_info.css('#mw-content-text > div > table:nth-child(19) > tbody > tr:nth-child(n+1) > td:nth-child(5)').text.chomp("\n").split("\n")
        teams = stadium_info.css('#mw-content-text > div > table:nth-child(19) > tbody > tr:nth-child(n+1) > td:nth-child(7) > a').text
            teams = teams.gsub("Los Angeles RamsLos Angeles Chargers", "Los Angeles Rams, Los Angeles Chargers")
            teams = teams.gsub("New York GiantsNew York Jets", "New York Giants, New York Jets")
            teams = teams.split /(?<=[a-z])(?=[A-Z])/
        year_opened = stadium_info.css('#mw-content-text > div > table:nth-child(19) > tbody > tr:nth-child(n+1) > td:nth-child(8)').text.chomp("\n").split("\n")
    x = 0
            while x < stadium_name.length do
                stadium = [stadium_name[x], capacity[x], location[x], surface[x], teams[x], year_opened[x]]
                stadium = Scraper.new(stadium_name[x], capacity[x], location[x], surface[x], teams[x], year_opened[x])
                 x+=1
                end
##commentary data

        total = zip.css('#mw-content-text > div > table:nth-child(n+1) > tbody > tr:nth-child(n+1)').drop(6)

    y = 0
            while y < total.count do
                total[y]
                located = total[y].children.text.split("\n")
                @@locate << located
                y+=1
            end
            # binding.pry
    pg = 0
        named_stadium = scraped_opinion.css('figure > div.section-label.alt-font > span.title').text.split(/(?<=[)])/)
        comment = scraped_opinion.css('div > div > p:nth-child(2)').text
        comment = comment.gsub("quaint.\"The Grand Old Lady\"", "quaint.The Grand Old Lady") #more poor grammer structure
        comment = comment.split(/(?<=[[:lower:]]['.'])(?=[A-Z])|(?<=[[:digit:]]['.'])(?=[A-Z])/)

        while pg < named_stadium.length do
            commentary = [named_stadium[pg], comment[pg]]
            pg+=1
            @@comments << commentary
            end

        binding.pry

end

