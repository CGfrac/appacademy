class Passenger
    attr_reader :name

    def initialize(name)
        @name = name
        @flight_numbers = []
    end
end