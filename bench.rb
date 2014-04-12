require 'open-uri'
start = Time.now

1000.times do
  open('http://localhost:3000/posts/autocomplete').read
end

puts "Elapsed time for controller autocomplete: #{Time.new - start}"

start = Time.now

1000.times do
  open('http://localhost:3000/posts_autocomplete').read
end

puts "Elapsed time for rack middleware autocomplete: #{Time.new - start}"

start = Time.now

1000.times do
  open('http://localhost:3000/autocomplete/posts').read
end

puts "Elapsed time for rack app autocomplete: #{Time.new - start}"
puts "RSS: #{`ps -eo rss,pid | grep #{Process.pid} | grep -v grep | awk '{ print $1;  }'`}"

# Ruby 2.1.1

# Results for thin server
# Elapsed time for controller autocomplete: 5.612114202
# Elapsed time for rack middleware autocomplete: 1.946385753
# Elapsed time for rack app autocomplete: 2.663584515

# Unicorn
# Elapsed time for controller autocomplete: 5.695448048
# Elapsed time for rack middleware autocomplete: 2.720414571
# Elapsed time for rack app autocomplete: 3.419353762

# Puma blank
# Elapsed time for controller autocomplete: 5.470961704
# Elapsed time for rack middleware autocomplete: 2.439292391
# Elapsed time for rack app autocomplete: 3.442538771
