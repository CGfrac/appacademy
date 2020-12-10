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