def check_word
  word = ''
  while word == ''
    puts 'Введите слово'
    word = gets.to_s.chomp.to_s
  end
  return 2**word.length if word.downcase[-2, 2] == 'cs'

  word.reverse
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
      name = gets.to_s.chomp
    end
    color = ''
    while color == ''
      puts 'Какой цвет?'
      color = gets.to_s.chomp
    end
    pokemons.append({ name: name, color: color })
  end
  pokemons
end
