require 'pry'

require_relative "scraper.rb"
require_relative "clinteraction.rb"
require_relative "commentary.rb"

class Stadium
    attr_accessor :stadium_name, :capacity, :location, :surface, :year_opened, :team_name, :scraper

@@all = []

    def initialize (stadium_name, capacity, location, surface, year_opened, team_name)
        @stadium_name = stadium_name
        @capacity = capacity
        @location = location
        @surface = surface
        @team_name = team_name
        @year_opened = year_opened
        @@all << self
    end
# binding.pry
    def all
        @@all
    end

end


