require "yaml"

tasks = YAML.load_file("tasks.yml")

total_time = [0,0,0]

tasks.each_value do |time|
    time.split('_').each_with_index { |value, idx| total_time[idx] += value.to_i }
end

i = 2
while i > 0
    time = total_time[i]
    total_time[i-1] += time / 60
    time %= 60
    total_time[i] = time.to_s.rjust(2,'0')
    i -= 1
end
total_time[0] = total_time[0].to_s

puts "Time left: #{total_time.join(':')}"