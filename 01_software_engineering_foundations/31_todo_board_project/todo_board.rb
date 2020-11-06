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
        when "print"
            if args.empty?
                @list.print
            else
                @list.print_full_item(args[0].to_i)
            end
        when "toggle"
            @list.toggle_item(args[0].to_i)
        when "rm"
            @list.remove_item(args[0].to_i)
        when "purge"
            @list.purge
        when "quit"
            return false
        else
            print "Wrong command, did you type it correctly?"
        end

        true
    end

    def run
        while true
            break if !get_command
        end
    end
end