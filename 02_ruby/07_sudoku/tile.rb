require "colorize"

class Tile
    attr_reader :given

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

    def is_empty?
        @value == ' '
    end

    def value=(value)
        @value = value unless @given
    end
end