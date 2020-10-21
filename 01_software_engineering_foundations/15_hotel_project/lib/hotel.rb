require_relative "room"

class Hotel
    def initialize(name, rooms)
        @name = name
        @rooms = {}
        rooms.each { |name, capacity| @rooms[name] = Room.new(capacity) }
    end

    def name
        capitalize = @name.split.map(&:capitalize)
        capitalize.join(" ")
    end
end
