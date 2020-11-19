require "colorize"

class Tile
    def initialize(value, given)
        @value = value
        @given = given
    end

    def to_s
        if @given
            @value.light_green
        else
            @value.on_light_green
        end
    end
end