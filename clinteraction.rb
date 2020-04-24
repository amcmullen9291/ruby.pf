require 'colorize'
require 'pry'
require_relative 'scraper'

##def walk_dogs
#     Scraper.all.each.with_index(1) do |stadium, i|
#         puts  "#{i}: ""#{stadium.stadium_name}\n\n"
#         end
# end
#------------------------------------------------------------------------------
# puts "      ||                                           ||"
# puts "      ||                                           ||"
# puts "       #{'FootBall Central!'.blue}          "
# puts "      ||###########################################||"
# puts "                           ##                                 "
# puts "  For a list of all Stadiums type #{'list'.red}"
# puts "                                                             "
# puts "            ** For a list of stadiums ranked by their size, type #{'size'.red}"
# puts  "           **To see stadiums ranked by their opening year, type #{'year'.red}"
# puts "            **To select a stadium by team name, type #{'teams'.red}"
# puts "#{'.................................................................'.green}"
# puts "                                                   "
# puts "                  OR                                                  "
# puts "Enter your #{'zip code'.yellow} to see Stadiums around you!"
# puts "                                                                 "
# puts "                                                                   "
# puts "type #{'stop'.light_red} to exit                                   "
# response = gets.chomp


def list
    x = 0
    y = 1
    puts""
    while x < Scraper.all.length
    Scraper.all[x..x+4].each.with_index(y) do |name, i|
        puts "#{i}: " "#{name.stadium_name}"
        puts ""
        end
        puts "#{x+5} out of " "#{Scraper.all.length} stadiums".red
        puts "Select a Stadium by number, or press enter to continue".light_blue
        response = gets.chomp
        if response == "\n"
        end
        x+=5
        y+=5
    end
end

def teams
    x = 0
    y = 1
    puts""
    puts "Select a Team by number, or press enter to continue \n\n".green

    while x < Scraper.all.length
    Scraper.all[x..x+4].each.with_index(y) do |name, i|
        puts "#{i}: " "#{name.teams}".yellow
        puts ""
        end
        # puts "#{x+5} out of " "#{Scraper.all.length} stadiums".red
        response = gets.chomp
        if response == "\n"
        end
        x+=5
        y+=5
    end
end


def year_opened_oldest
    years = Scraper.all.sort_by{|obj| obj.year_opened}
    x = 0
    y = 1
    puts""
    while x < years.length
    years[x..x+4].each.with_index(y) do |name, i|
        print "#{i}: " "#{name.stadium_name} was built in: " "#{name.year_opened}     "
        puts "\n\n"
        end
        prints "#{x+5} out of " "#{years.length}".red
        sleep(2)
        print "\r"
        print "Select a Stadium by number, or press enter to continue".light_blue
        response = gets.chomp
        if response == "\r"
        end
        x+=5
        y+=5
    end
end

def year_opened_newest
    years = Scraper.all.sort_by{|obj| obj.year_opened}.reverse
    x = 0
    y = 1
    puts""
    while x < years.length
    years[x..x+4].each.with_index(y) do |name, i|
        print "#{i}: " "#{name.stadium_name} was built in: " "#{name.year_opened}        "
        puts "\r"
        end
        puts "\n\n"
        print "#{x+5} out of " "#{years.length}".red
        sleep(2)
        print "\r"
        print "Select a Stadium by number, or press enter to continue".light_blue
        response = gets.chomp
        if response == "\n"
            print"\r"
        end
        x+=5
        y+=5
    end
end

def capacity_SmallToBig
    size = Scraper.all.sort_by{|obj| obj.capacity}
    x = 0
    y = 1
    puts""
    while x < size.length
    size[x..x+4].each.with_index(y) do |name, i|
        puts "#{i}: " "#{name.stadium_name} holds: " "#{name.capacity}     \r"
        puts "\r"
        end
        print "#{x+5} out of " "#{size.length} ".red
        sleep(2)
        print"\r"
        print "Select a Stadium by number, or press enter to continue \r".light_blue
        response = gets.chomp
        if response == "\r"
        end
        x+=5
        y+=5
    end
end

def capacity_BigToSmall
    size = Scraper.all.sort_by{|obj| obj.capacity}.reverse
    x = 0
    y = 1
    puts""
    while x < size.length
    size[x..x+4].each.with_index(y) do |name, i|
        print "#{i}: " "#{name.stadium_name} holds: " "#{name.capacity}        "
        puts "\r"
        end
        print "#{x+5} out of " "#{size.length}".red
        sleep(2)
        print "\r"
        print "Select a Stadium by number, or press enter to continue".light_blue
        response = gets.chomp
        if response == "\n"
            print"\r"
        end
        x+=5
        y+=5
    end
end

    # binding.pry
 teams
