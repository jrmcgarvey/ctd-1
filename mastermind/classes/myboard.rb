require_relative "board"

class MyBoard < Board
    def initialize(secret)
        @secret=secret
    end
end
