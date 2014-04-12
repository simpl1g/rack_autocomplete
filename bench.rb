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

# Results for thin server
# Elapsed time for controller autocomplete: 7.340823556
# Elapsed time for rack autocomplete: 3.050162147
