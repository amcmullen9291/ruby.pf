require 'colorize'
require 'pry'
require_relative 'scraper'

# ------------------------------------------------------------------------------
print "\e[8;40;60t"
puts "      ||                                           ||"
puts "      ||                                           ||"
puts "                  #{'FootBall Central!'.blue}         "
puts "      ||###########################################||"
puts "                           ##                                 "
puts "  For a list of all Stadiums type #{'list'.red}"
puts "                                                             "
puts "            ** For a list of stadiums ranked by their size, type #{'size'.red}"
puts  "           ** To see stadiums ranked by their opening year, type #{'year'.red}"
puts "#{'............................................................'.green}"
puts "                                                   "
puts "                  OR                                                  "
puts "   "
puts "           to see stadiums around you, start by typing #{'zip'.yellow}!"
puts "                                                                 "
puts "                                                                   "
puts "type #{'stop'.light_red} to exit                                   "
response = gets.chomp

def reFresh
    puts "\n\n\n\n"
    puts "  For a list of all stadiums type #{'list'.red}"
    puts "                                                             "
    puts "            ** For a list of stadiums ranked by their size, type #{'size'.red}"
    puts  "           ** To see stadiums ranked by their opening year, type #{'year'.red}"
    puts "#{'............................................................'.green}"
    puts "                                                                  "
    puts "                  OR                                                  "
    puts "           to see stadiums around you, start by typing #{'zip'.yellow}!"
    puts "                                                                 "
    puts "                                                                   "
    puts "type #{'stop'.light_red} to exit                                   "
    response = gets.chomp
        if response == "list"
            list
        elsif response == "size"
                capacity
        elsif response =="year"
                year_opened
        elsif response == "zip"
            zip_code
        else
            teams
        end
    end

    def list
        print "\e[8;40;60t"
        x = 0
        y = 1
        puts""
        while x < Scraper.all.length
        Scraper.all[x..x+15].each.with_index(y) do |name, i|
            puts "#{i}: " "#{name.stadium_name}"
            puts ""
            end
            print "#{x+15} out of " "#{Scraper.all.length} stadiums. \r".red
            sleep(2)
            print "Press enter to continue. \r".light_blue
            response = gets.chomp
            if response == "\n"
            end
            x += 15
            y += 15
            # print "                                                "
        end
        puts ""
        puts "Enter 'home'."
    home_bound = gets.chomp
        if home_bound == "home"
            reFresh
        end
end

def teams
    print "\e[8;40;60t"
    colors = ["red", "light_red", "green", "light_black", "light_green", "yellow", "blue", "light_blue", "light_magenta", "light_yellow", "cyan", "light_cyan", "magenta", ]
    x = 0
    y = 1
    puts""
    while x < Scraper.all.length
    Scraper.all[x..x+4].each.with_index(y) do |name, i|
        hh = rand(13)
        choice = colors[hh]
        color = "#{choice}"
        puts "#{i}: " "#{name.teams}".colorize(:"#{color}")
        puts ""
        sleep(0.5)
        end
            x+=5
            y+=5
    end
    sleep(2)
    puts "Go Team!".green
    sleep(3)
    puts "\e[H\e[2J"
    exit()
end

def year_opened
    puts "Enter '1' for the oldest stadiums first, or '2' to start with the newer stadiums."
    answer = gets.chomp
    print "\e[8;40;60t"
    if answer == "1"
        years = Scraper.all.sort_by{|obj| obj.year_opened}
    elsif answer == "2"
        years = Scraper.all.sort_by{|obj| obj.year_opened}.reverse
    end
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
        x+=5
        y+=5
        puts "Choose a stadium by number, or press enter to continue. \r".light_blue
        response = gets.chomp
        response = response.to_i
        if response != 0 && response != nil
            team = years[response-1]
            # binding.pry
                puts team.stadium_name.yellow
                puts "was opened in " "#{team.year_opened}" " in ""#{team.location}"" as"
                puts "home to the ""#{team.teams.yellow}."
                puts "The field's surface is ""#{team.surface}, and "
                puts "it can seat up to ""#{team.capacity.blue}" " people."
                puts "\n"
                homes = team.stadium_name
                homes.to_s
                Scraper.comments.select do |team| if team[0].include?("#{homes}")
                    print "In other words: ".light_black
                    puts team[1]
                    puts "\n"
                    sleep(2)
                    puts "Enter 'home' to go back."
                    home_bound = gets.chomp
                        if home_bound == "home"
                            reFresh

                        end
                    end
                end
            break
        else
            x += 5
            y+= 5
        end
    end
    puts "Enter 'home' to go back."
    home_bound = gets.chomp
        if home_bound == "home"
            reFresh
        end
end

def capacity
    puts "Enter '1' for stadiums biggest to smallest stadiums, or '2' for smaller stadiums first."
    answer = gets.chomp
    print "\e[8;40;60t"
    if answer == "1"
    size = Scraper.all.sort_by{|obj| obj.capacity}.reverse
    elsif answer == "2"
    size = Scraper.all.sort_by{|obj| obj.capacity}
    end
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
        print "Choose a stadium by number, or press enter to continue. \r".light_blue
        puts ""
        response = gets.chomp
        response = response.to_i
        if response != 0 && response != nil
            team = size[response-1]
            # binding.pry
                puts team.stadium_name.yellow
                puts "was opened in " "#{team.year_opened}" " in ""#{team.location}"" as"
                puts "home to the ""#{team.teams.yellow}."
                puts "The field's surface is ""#{team.surface}, and "
                puts "it can seat up to ""#{team.capacity.blue}" " people."
                puts "\n"
                homes = team.stadium_name
                homes.to_s
                Scraper.comments.select do |team| if team[0].include?("#{homes}")
                    print "In other words: ".light_black
                    puts team[1]
                    puts "\n"
                    sleep(2)
                    puts "Enter 'home' to go back."
                    home_bound = gets.chomp
                        if home_bound == "home"
                            reFresh

                        end
                    end
                end
            break
        else
            x += 5
            y+= 5
        end
    end
    puts "Enter 'home' to go back."
    home_bound = gets.chomp
        if home_bound == "home"
            reFresh
        end
end

def zip_code
    puts ""
    puts "Enter a zip zode".light_red
    puts "\n"
    code = gets.chomp
    Scraper.locate.select do |neighborhood|
        if "#{code}".start_with?("#{neighborhood[1]}")
        puts "#{'Metro Area found:'.yellow} #{neighborhood[3]}" " (#{neighborhood[4]})."
        puts "\n\n"
        stateAbbr = neighborhood[2]
        Scraper.translate.select do |fullNames| if stateAbbr == "#{fullNames[1]}"
        fullName = fullNames[0]
        Scraper.all.select do |ballpark|
            if ballpark.location.include?("#{fullName}")
            puts ballpark.stadium_name.yellow
            puts "was opened in " "#{ballpark.year_opened}" " in ""#{ballpark.location}"" as"
            puts "home to the ""#{ballpark.teams.yellow}."
            puts "The field's surface is ""#{ballpark.surface}, and "
            puts "it can seat up to ""#{ballpark.capacity.blue}" " people."
            puts "\n"
            home = ballpark.stadium_name
            home.to_s
            Scraper.comments.select do |team| if team[0].include?("#{home}")
                print "In other words: ".light_black
                puts team[1]
                puts "\n"
            end
            end
        end
        end
        end
        end
    end
    end
    puts "Enter 'home'."
    home_bound = gets.chomp
    if home_bound == "home"
        reFresh
    end
end

if response == "list"
    list
elsif response == "size"
        capacity
elsif response =="year"
        year_opened
elsif response == "zip"
    zip_code
else
    teams
end
