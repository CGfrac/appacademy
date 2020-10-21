require_relative "room"

class Hotel
    def initialize(name, rooms)
        @name = name
        @rooms = {}
        rooms.each { |name, capacity| @rooms[name] = Room.new(capacity) }
    end

    def name
        @name.split.map(&:capitalize).join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(name)
        @rooms.has_key?(name)
    end

    def check_in(person_name, room_name)
        if self.room_exists?(room_name)
            if @rooms[room_name].add_occupant(person_name)
                puts "check in successful"
            else
                puts "sorry, room is full"
            end
        else
            puts "sorry, room does not exist"
        end
    end

    def has_vacancy?
        @rooms.any? { |name, room| !room.full? }
    end

    def list_rooms
        @rooms.each_key { |name| puts "#{name}.*#{@rooms[name].available_space}" }
    end
end
