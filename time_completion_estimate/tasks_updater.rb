require "yaml"

tasks = YAML.load_file("tasks.yml")

def valid_time(time)
    units = time.split('_')
    return false if units.length != 3
    hours, minutes, seconds = units
    return false if hours.length != 2 || hours.to_i < 0 || hours.to_i > 24
    return false if minutes.length != 2 || minutes.to_i < 0 || minutes.to_i > 59
    return false if seconds.length != 2 || seconds.to_i < 0 || seconds.to_i > 59
    true
end

while true
    puts "Type a command. Type 'help' for a list of valid commands."
    cmd = gets.chomp

    case cmd
    when "display"
        tasks.each { |task, time| puts task.ljust(50) + time }
    when "new"
        puts "Input task in the following format: name_task HH_MM_SS"
        task = gets.chomp.split
        if task.length != 2 || !valid_time(task[1])
            puts "Invalid input"
        else
            tasks[task[0]] = task[1]
        end
    when "cleared"
        key = tasks.keys[0]
        tasks.delete(key)
    when "save"
        File.write("tasks.yml", tasks.to_yaml)
        break
    when "quit"
        break
    when "help"
        puts "display - show task list"
        puts "new - input a new task"
        puts "cleared - remove oldest task"
        puts "save - save tasks file"
        puts "quit - quit without saving"
    else
        puts "Invalid command, type 'help' to list valid inputs"
    end
end
