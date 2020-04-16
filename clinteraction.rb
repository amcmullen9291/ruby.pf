#!/usr/bin/rubys
require 'colorize'
require 'catpix_mini'

require_relative "scraper.rb"
# require_relative "commentary.rb"

# class Interaction
#     attr_accessor :welcome, :stadiums, :response

#     def initialize
#         @respone = response
#     end

    def welcome
        @welcome = welcome
        puts ""
        puts ""
        puts "#{'Welcome to FootBall Central!'.blue}"
        puts ""
        puts "For a list of all Stadiums type 'list'".red
        puts "For stadiums ranked by their size, type 'size'"
        puts "To see stadiums ranked by their opening year, type 'year'"
        puts "To select a stadium by team name, type 'teams'"
        puts ""
        puts "To search by the stadium name type 'stadium'"
        puts "type 'stop' to exit"
        response = gets.downcase.chomp

        if response == "list"
            @stadiums
        elsif response == "size"
            @size_ranking
        elsif response == "year"
            @year_ranking
        elsif response == "teams"
            @teams
        elsif response == "stadium"
            @stadium_name
        elsif response == "stop"
            exit[0]
        else
            puts "Please try again."
            response = gets.chomp
            timeout = 1
            if response != "size" && response != "year" && response != "team" &&response != "stadium" && response != "list"
                3.times do
                puts " Invalid response. Please try again."
                response = gets.chomp
                timeout +=1
                    if timeout == 4
                        puts "goodbye"
                        exit[0]
                    end
                end
            else
                @continue
            end
        end
    end

    def stadiums
        @stadiums = stadiums
        Scraper.all do |name|
            return Scraper.name
            puts "press <enter> to continue".purple
            response = gets.chomp
            if response == "\n"
                puts "type 'main' for main menu"
                response2 = gets.chomp
            if response2 == "main"
                @welcome
            else
                @welcome
            end
        end
    end

    def stadium_name
        @stadium_name = stadium_name
        puts "Enter the name of a stadium"
        team_name = gets.chomp
        Scraper.all.select do |name|
            scraper.name == team_name
            puts "hit enter to continue"
            response = gets.chomp
            if response == "\n"
            @continue
            end
        end
        puts "hit enter to return to the main menu"
        respone = gets.chomp
        if response == "\n"
            @welcome
        end
    end

    def year_ranking
        @year_ranking = year_ranking
        Scraper.year_opened.sort
        puts "hit enter to continue"
        respone = gets.chomp
        if response == "\n"
            @continuing
        end
    end

    def size_ranking
        @size_ranking = size_ranking
        Scraper.all.capacity.sort
        puts "hit enter to continue"
        respone = gets.chomp
        if response == "\n"
            @continuing
        end
    end

    def teams
        @teams = teams
        puts "Type the name of your team. Do not include location (ie: for the Pittsburgh Steelers, enter 'Steelers' "
        response = gets.chomp
        Scraper.all.name.select do |name|
        Scraper.name == response
        @continuing
        end
    end

    def continuing
        @continuing = continuing
        puts "what would you like to do next?"
        response = gets.chomp
        @continue
    end

    def continue
        @continue = continue
        if response == "list"
            @stadiums
        elsif response == "size"
            @size_ranking
        elsif response == "year"
            @year_ranking
        elsif response == "teams"
            @teams
        elsif response == "stadium"
            @stadium_name
        elsif response == "stop"
            exit[0]
        else
            puts "invalid response. Please try again."
            response = gets.chomp
            timeout = 1
                if response != "size" && response != "year" && response != "team" && response != "stadium" && response != "list"
                    3.times do
                    puts "Please try again."
                    response = gets.chomp
                    timeout +=1
                    if timeout == 4
                        puts "goodbye"
                        exit[0]
                    end
                    @continue
                end
                end
            end
        end
    end

# end

