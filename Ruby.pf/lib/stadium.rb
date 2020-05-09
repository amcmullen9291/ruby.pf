class Stadium

    attr_accessor :stadium_name, :capacity, :location, :surface, :year_opened, :teams, :comment

    @@all = []

    def initialize (stadium_name, capacity, location, surface, teams, year_opened, comment=nil)
        @stadium_name = stadium_name
        @capacity = capacity
        @surface = surface
        @location = location
        @teams = teams
        @year_opened = year_opened
        @@all << self
    end

    def self.all
        @@all
    end

end
