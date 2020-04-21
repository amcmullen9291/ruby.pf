require 'pry'
require 'colorize'

require_relative 'scraper'
require_relative 'commentary'

 class Clinteraction

    def initialize
    end

        puts ""
        puts ""
        puts "#{'Welcome to FootBall Central!'.blue}"
        puts ""
        puts "For a list of all Stadiums type 'list'".red
        puts "For a list of stadiums ranked by their size, type 'size'"
        #### maybe do options: top 5, btm 5, all
        puts "To see stadiums ranked by their opening year, type 'year'"
        #### options: oldest, newest, all
        puts "To select a stadium by team name, type 'teams'"
        puts ""
        puts "To search by the stadium name type 'stadium'"
        puts "   OR"
        puts "Enter your zip code to see Stadiums around you!"
        puts ""
        puts ""
        puts "type #{'stop'.light_red} to exit"
        response = gets.chomp

    (response =) case
        when "list"
            Scraper.all.surface.map.with_index do |name, index|
                puts "#{index}: #{name}"
            end
        when teams
            Scraper.teams.each_with_index do |name, index|
                puts "#{index}: #{name}"
            end
        else
            exit(0)
         end

    def stadium_name
        @stadium = stadium_name
    end

    def stadium_name
        @stadium_name = stadium_name
    end

    def surface
        @surface = surface
    end

    def teams
        @teams = teams
    end

    def all
        Scraper.all
    end

# binding.pry

