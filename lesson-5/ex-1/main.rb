class CashMachine
  attr_accessor :path_file

  def initialize(path_file)
    is_exist = File.exist?(path_file)
    @file = File.open(path_file, 'a+')
    @balance = is_exist ? @file.read.to_i : 100
  end

  def input
    puts 'Введите сумму:'
    gets.to_s.chomp.to_i
  end

  def deposit
    add = input
    if add.positive?
      @balance += add
      show_balance
    else
      puts 'Некорректная сумма'
    end
  end

  def withdraw
    remove = input
    if remove.positive? && remove <= @balance
      @balance -= remove
      show_balance
    else
      puts 'Некорректная сумма'
    end
  end

  def show_balance
    puts "Баланс: #{@balance}"
  end

  def quit
    @file.rewind
    @file.truncate(0)
    @file.write(@balance)
    @file.close
  end
end

path = 'balance.txt'
cash_machine = CashMachine.new(path)

loop do
  puts "\nВведите команду:"
  case gets.to_s.chomp
  when 'D' # deposit
    cash_machine.deposit
  when 'W' # withdraw
    cash_machine.withdraw
  when 'B' # balance
    cash_machine.show_balance
  when 'Q' # quit
    cash_machine.quit
    break
  else
    puts 'Неверная команда'
  end
end
