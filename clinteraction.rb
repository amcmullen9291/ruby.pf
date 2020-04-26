require 'colorize'
require 'pry'
require_relative 'scraper'

# ------------------------------------------------------------------------------
puts "      ||                                           ||"
puts "      ||                                           ||"
puts "       #{'FootBall Central!'.blue}         "
puts "      ||###########################################||"
puts "                           ##                                 "
puts "  For a list of all Stadiums type #{'list'.red}"
puts "                                                             "
puts "            ** For a list of stadiums ranked by their size, type #{'size'.red}"
puts  "           **To see stadiums ranked by their opening year, type #{'year'.red}"
puts "            **To select a stadium by name, type #{'stadium'.red}"
puts "#{'............................................................'.green}"
puts "                                                   "
puts "                  OR                                                  "
puts "Type #{'zip'.yellow} to see Stadiums around you!"
puts "                                                                 "
puts "                                                                   "
puts "type #{'stop'.light_red} to exit                                   "
response = gets.chomp

def reFresh
    puts "\n\n\n\n"
    puts "  For a list of all Stadiums type #{'list'.red}"
    puts "                                                             "
    puts "            ** For a list of stadiums ranked by their size, type #{'size'.red}"
    puts  "           **To see stadiums ranked by their opening year, type #{'year'.red}"
    puts "            **To select a stadium by name, type #{'stadium'.red}"
    puts "#{'............................................................'.green}"
    puts "                                                   "
    puts "                  OR                                                  "
    puts "Type #{'zip'.yellow} to see Stadiums around you!"
    puts "                                                                 "
    puts "                                                                   "
    puts "type #{'stop'.light_red} to exit                                   "
    response = gets.chomp
        if response == "list"
            list
        elsif response == "size"
            puts " enter '1' for stadiums biggest to smallest stadiums, or '2' for smaller stadiums first."
            answer = gets.chomp
            if answer == "1"
                capacity_BigToSmall
            elsif answer == "2"
                capacity_SmallToBig
            end
        elsif response =="year"
            puts " enter '1' for newest stadiums first, or '2' to start with the oldest stadiums."
            answer = gets.chomp
            if answer == "1"
                year_opened_newest
            elsif answer == "2"
                year_opened_oldest
            end
        elsif response == "stadium"
            stadium_info
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
    Scraper.all[x..x+4].each.with_index(y) do |name, i|
        puts "#{i}: " "#{name.stadium_name}"
        puts ""
        end
        print "#{x+5} out of " "#{Scraper.all.length} stadiums. \r".red
        sleep(2)
        print "Select a Stadium by number, or press enter to continue. \r".light_blue
        puts ""
        response = gets.chomp
        if response == "\n"
        end
        x+=5
        y+=5
    end
    puts "Enter 'home' to continue"
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
        # binding.pry
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
        print "#{x+5} out of " "#{years.length}. \r".red
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
    puts "Enter 'home' to continue"
    home_bound = gets.chomp
        if home_bound == "home"
            reFresh
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
    puts "Enter 'home' to continue"
    home_bound = gets.chomp
        if home_bound == "home"
            reFresh
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
    puts "Enter 'home' to go back."
    home_bound = gets.chomp
        if home_bound == "home"
            reFresh
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
            5.times do
            print "\r"
            end
        end
        x+=5
        y+=5
    puts "Enter 'home' to go back."
    home_bound = gets.chomp
        if home_bound == "home"
            reFresh
        end
    end
end

def stadium_info
    puts "Enter a stadium name."
    stadium = gets.chomp.downcase
    home_team = []
    puts "\n\n"
    print "\e[8;40;60t"
    Scraper.all.select do |team| if team.stadium_name.downcase.include?("#{stadium}")
        puts team.stadium_name.yellow
        puts "was opened in " "#{team.year_opened}" " in ""#{team.location}"" as"
        puts "home to the ""#{team.teams.yellow}."
        puts "The field's surface is ""#{team.surface}, and "
        puts "it can seat up to ""#{team.capacity.blue}" " people."
        puts "\n"
        homes = team.stadium_name
        homes.to_s
        Scraper.comments.select do |team| if team[0].include?("#{homes}")
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
    print "                                                              "
    sleep(1)
    home_team = []
    puts "Enter 'home' to continue."
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
    puts "Enter 'home' to continue."
    home_bound = gets.chomp
    if home_bound == "home"
        reFresh
    end
end

if response == "list"
    list
elsif response == "size"
    puts " enter '1' for stadiums biggest to smallest stadiums, or '2' for smaller stadiums first."
    answer = gets.chomp
    if answer == "1"
        capacity_BigToSmall
    elsif answer == "2"
        capacity_SmallToBig
    end
elsif response =="year"
    puts " enter '1' for newest stadiums first, or '2' to start with the oldest stadiums."
    answer = gets.chomp
    if answer == "1"
        year_opened_newest
    elsif answer == "2"
        year_opened_oldest
    end
elsif response == "stadium"
    stadium_info
elsif response == "zip"
    zip_code
else
    teams
end

    # binding.pry
