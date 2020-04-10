require_relative 'stadium.rb'
require_relative 'scraper.rb'
require_relative 'clinteraction.rb'

class Commentary
    attr_accessor :prefix, :abbr, :state

    @@locate = []

    def initialize(prefix, abbr, state)
        @prefix = prefix
        @abbr = abbr
        @state = state
        @@locate << self
    end

end
