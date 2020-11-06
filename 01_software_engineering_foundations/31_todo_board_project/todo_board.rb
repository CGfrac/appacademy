require_relative "list.rb"

class TodoBoard
    def initialize
        @lists = {}
    end

    def get_command
        print "\nEnter a command: "
        cmd, list_label, *args = gets.chomp.split

        case cmd
        when "mklist"
            @lists[list_label] = List.new(list_label)
        when "ls"
            @lists.each_key { |label| puts label }
        when "mktodo"
            @lists[list_label].add_item(*args)
        when "up"
            @lists[list_label].up(*args.map! { |arg| arg.to_i }  )
        when "down"
            @lists[list_label].down(*args.map! { |arg| arg.to_i } )
        when "swap"
            @lists[list_label].swap_index(*args.map! { |arg| arg.to_i } )
        when "sort"
            @lists[list_label].sort_by_date!
        when "priority"
            @lists[list_label].print_priority
        when "print"
            if args.empty?
                @lists[list_label].print
            else
                @lists[list_label].print_full_item(args[0].to_i)
            end
        when "toggle"
            @lists[list_label].toggle_item(args[0].to_i)
        when "rm"
            @lists[list_label].remove_item(args[0].to_i)
        when "purge"
            @lists[list_label].purge
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