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
# puts "            **To select a stadium by name, type #{'stadium'.red}"
# puts "#{'.................................................................'.green}"
# puts "                                                   "
# puts "                  OR                                                  "
# puts "Enter your #{'zip code'.yellow} to see Stadiums around you!"
# puts "                                                                 "
# puts "                                                                   "
# puts "type #{'stop'.light_red} to exit                                   "
# response = gets.chomp


def list
    print "\e[8;40;60t"
    x = 0
    y = 1
    puts""
    while x < Scraper.all.length
    Scraper.all[x..x+4].each.with_index(y) do |name, i|
        puts "#{i}: " "#{name.stadium_name}"
        puts ""
        end
        print "#{x+5} out of " "#{Scraper.all.length} stadiums. \r".red
        sleep(2)
        print "Select a Stadium by number, or press enter to continue. \r".light_blu
        puts ""
        response = gets.chomp
        if response == "\n"
        end
        x+=5
        y+=5
    end
end

def teams
    print "\e[8;40;60t"
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
    print "\e[8;40;60t"
    years = Scraper.all.sort_by{|obj| obj.year_opened}
    x = 0
    y = 1
    puts""
    while x < years.length
    years[x..x+4].each.with_index(y) do |name, i|
        print "#{i}: " "#{name.stadium_name} was built in: " "#{name.year_opened}     "
        puts "\n\n"
        end
        prints "#{x+5} out of " "#{years.length}. \r".red
        sleep(2)
        print "\r"
        print "Select a Stadium by number, or press enter to continue. \r".light_blue
        puts ""
        response = gets.chomp
        if response == "\r"
        end
        x+=5
        y+=5
    end
end

def year_opened_newest
    print "\e[8;40;60t"
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
        print "Select a Stadium by number, or press enter to continue. \r".light_blue
        puts ""
        response = gets.chomp
        if response == "\n"
            print"\r"
        end
        x+=5
        y+=5
    end
end

def capacity_SmallToBig
    print "\e[8;40;60t"
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
        print "Select a Stadium by number, or press enter to continue. \r".light_blue
        puts ""
        response = gets.chomp
        if response == "\r"
        end
        x+=5
        y+=5
    end
end

def capacity_BigToSmall
    print "\e[8;40;60t"
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
        print "Select a Stadium by number, or press enter to continue. \r".light_blue
        puts ""
        response = gets.chomp
        if response == "\n"
            print"\r"
        end
        x+=5
        y+=5
    end
end

def stadium_info
    puts "Enter a stadium name."
    stadium = gets.chomp.downcase
    home = []
    puts "\n\n"
    print "\e[8;40;60t"
    Scraper.all.select do |team| if team.stadium_name.downcase.include?("#{stadium}")
        puts team.stadium_name.yellow
        puts "was opened in " "#{team.year_opened}" " in ""#{team.location}"" as"
        puts "home to the ""#{team.teams.yellow}."
        puts "The field's surface is ""#{team.surface}, and "
        puts "it can seat up to ""#{team.capacity.blue}" " people."
        puts "\n"
        home = team.stadium_name
        home.to_s
        Scraper.comments.select do |team| if team[0].include?("#{home}")
            puts team[1]
            puts "\n"
            end
        end
    end
    end
    # binding.pry
    puts"\n\n"
    2.times do
    print "                   "
    sleep(1)
    print "       #{'FOOTBALL'.blue.on_red.blink}                  \r"
    sleep(1)
    print "                   "
    sleep(1)
    print "          #{'CENTRAL'.blue.on_red.uncolorize}                \r"
    sleep(1)
    print "                   "
    sleep(1)
    print "       #{'FOOTBALL'.blue.on_red.uncolorize}                  \r"
    sleep(1)
    print "                   "
    sleep(1)
    print "          #{'CENTRAL'.blue.on_red.blink}                     \r"
    sleep(1)
    end
    print "FOOTBALL CENTRAL \r"
    sleep(1)
    home = []
    puts "what would you like to do next?               " ##"3,2,1, hike! (return home?)plus allow enter to exit program "
end

def zipCode
    print "\e[8;40;90t"
    puts ""
    puts "Enter a zip zode"
    code = gets.chomp
    Scraper.locate.select do |neighborhood|
        if "#{code}".start_with?("#{neighborhood[1]}")
        puts " #{'Metro Area found:'.yellow} #{neighborhood[3]}" " (#{neighborhood[4]})."
        stateAbbr = neighborhood[2]
## need to match stateAbbr w/ Scraper.translate array
    end
end
end

    # binding.pry
zipCode
