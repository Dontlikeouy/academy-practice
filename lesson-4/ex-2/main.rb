File.open('file.txt') do |file|
  text = file.read
  start = text.length
  file.rewind
  age = 0
  while age <= 0
    puts 'Введите возраст:'
    age = gets.to_s.chomp.to_i
  end

  text = file.select { |line| line.match?(" #{age}") }.join

  File.open('result.txt', 'w') do |result|
    result.write(text)
  end

  # ¯\_(ಠ_ಠ)_/¯
  if start != text.length
    loop do
      puts 'Введите -1:'
      break if gets.to_s.chomp.to_i == -1
    end
  end

  puts text
end
