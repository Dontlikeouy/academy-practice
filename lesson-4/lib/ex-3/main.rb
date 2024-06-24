# frozen_string_literal: true

# Обновляет файл
def update(file, text)
  file.rewind
  file.truncate(0)
  file.write(text)
end

path = 'balance.txt'
is_exist = File.exist?(path)

file = File.open(path, 'a+')
balance = is_exist ? file.read.to_i : 100

loop do
  puts "\nВведите команду D/W/B/Q:"
  case gets.to_s.chomp
  when 'D' # deposit
    puts 'Введите сумму:'
    add = gets.to_s.chomp.to_i
    if add.positive?
      balance += add
      puts "Новый баланс: #{balance}"
    else
      puts 'Некорректная сумма'
    end
  when 'W' # withdraw
    puts 'Введите сумму для снятия:'
    remove = gets.to_s.chomp.to_i
    if remove.positive? && remove <= balance
      balance -= remove
      puts "Новый баланс: #{balance}"
    else
      puts 'Некорректная сумма'
    end
  when 'B' # balance
    puts "Баланс: #{balance}"
  when 'Q' # quit
    update(file, balance.to_s)
    break
  else
    puts 'Неверная команда'
  end
end

file.close
