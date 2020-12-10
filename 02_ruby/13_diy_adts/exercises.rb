class Stack
    def initialize
        # create ivar to store stack here!
        @ivar = []
    end

    def push(el)
        # adds an element to the stack
        @ivar << el
    end

    def pop
        # removes one element from the stack
        @ivar.pop
    end

    def peek
        # returns, but doesn't remove, the top element in the stack
        @ivar[-1]
    end
end

class Queue
    def initialize
        @ivar = []
    end

    def enqueue(el)
        @ivar << el
    end

    def dequeue
        @ivar.shift
    end

    def peek
        @ivar[0]
    end
end

class Map
    def initialize
        @ivar = []
    end

    def set(key, value)
        found = false

        @ivar.each do |el| 
            if el[0] == key
                el[1] = value
                found = true
                break
            end
        end

        @ivar << [key, value] unless found
    end

    def get(key)
        @ivar.each { |el| return el[1] if el[0] == key }
    end

    def delete(key)
        @ivar.each_with_index do |el, i|
            if el[0] == key
                @ivar = @ivar[0...i] + @ivar[i+1..-1]
                break
            end
        end
    end

    def show
        print "#{@ivar} \n"
    end
end