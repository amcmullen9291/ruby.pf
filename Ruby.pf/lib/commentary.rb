class Commentary
    attr_accessor :named_stadium, :comment

@@comments = []

    def initialize(named_stadium, comment)
        @named_stadium = named_stadium
        @comment = comment
        @@comments << self
    end

    def self.comments
        @@comments
    end
end

