require "colorize"

class Tile
    attr_reader :given
    attr_writer :value

    def initialize(value, given)
        @value = value
        @given = given
    end

    def to_s
        if @given
            @value.light_green
        else
            @value.black.on_light_green
        end
    end
end