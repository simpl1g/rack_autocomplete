require 'open-uri'
time = Time.now

1000.times do
  open('http://localhost:3000/posts/autocomplete').read
end

puts "Elapsed time for controller autocomplete: #{Time.new - time}"

time = Time.now

1000.times do
  open('http://localhost:3000/posts_autocomplete').read
end

puts "Elapsed time for rack autocomplete: #{Time.new - time}"
puts "RSS: #{`ps -eo rss,pid | grep #{Process.pid} | grep -v grep | awk '{ print $1;  }'`}"

# Results for thin server
# Elapsed time for controller autocomplete: 5.606522729
# Elapsed time for rack autocomplete: 2.760737057

# Unicorn blank setup
# Elapsed time for controller autocomplete: 5.46513685
# Elapsed time for rack autocomplete: 2.801258113

# Unicorn 4 workers
# Elapsed time for controller autocomplete: 5.612332648
# Elapsed time for rack autocomplete: 2.521820519

# Puma blank
# Elapsed time for controller autocomplete: 6.179782286
# Elapsed time for rack autocomplete: 2.67874431