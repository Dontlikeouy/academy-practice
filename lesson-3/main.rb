def check_word
  word = ''
  while word == ''
    puts 'Введите слово'
    word = gets.chomp.to_s
  end
  if word.downcase[-2, 2] == 'cs'
    puts 2**word.length
  else
    puts word.reverse
  end
end

def add_pokemon
  puts 'Сколько добавить покемонов?'
  count_pokemon = gets.to_i
  pokemons = []
  count_pokemon.times do |time|
    puts "\nПокемон №#{time}"
    name = ''
    while name == ''
      puts 'Какое имя?'
      name = gets.chomp.to_s
    end
    color = ''
    while color == ''
      puts 'Какой цвет?'
      color = gets.chomp.to_s
    end
    pokemons.append({ name: name, color: color })
  end
  pokemons
end

puts check_word
puts add_pokemon
