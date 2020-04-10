
require 'colorize'
# require 'catpix_mini'

require_relative 'stadium.rb'
require_relative 'commentary.rb'
require_relative 'scraper.rb'

    puts ""
    puts ""
    puts "Welcome to FootBall Central!" " Where all the information about your favorite stadium lives!"
    puts ""
    puts "For a list of all Stadiums type 'all'"
    puts "For a stadiums ranked by size, type 'size'"
    puts "To see stadiums ranked by their opening year, type 'year'"
    puts "To select a stadium by team name, type 'team'"
    puts ""
    puts "To search by the stadium name type 'stadium'"
    puts "      OR "
    puts "enter your Zip Code to see the stadiums closest to you!"

    response = gets.downcase.chomp

    # if response = "all"
    #     Stadium.all do |name|
    #         stadium.name
    #         puts "press <enter> to continue".purple
    #     end
    # elsif response = "size"
    #     size_ranking
    # elsif response == "year"
    #     year_ranking
    # elsif response == "team"
    #     teams
    # elsif response.is_i
    #     state_stadiums
    # elsif response == "stadium"
    #     stadiums
    # else
    #     puts "invalid response. Please try again."
    # end



