require_relative "list.rb"

class TodoBoard
    def initialize(label)
        @list = List.new(label)
    end

    def get_command
        print "\nEnter a command: "
        cmd, *args = gets.chomp.split

        case cmd
        when "mktodo"
            @list.add_item(*args)
        when "up"
            @list.up(*args.map! { |arg| arg.to_i }  )
        when "down"
            @list.down(*args.map! { |arg| arg.to_i } )
        when "swap"
            @list.swap_index(*args.map! { |arg| arg.to_i } )
        when "sort"
            @list.sort_by_date!
        when "priority"
            @list.print_priority
        when "quit"
            return false
        else
            "Wrong command, did you type it correctly?"
        end

        true
    end
end