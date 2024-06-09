# frozen_string_literal: true

class CashMachine
  def initialize
    path_file = 'balance.txt'
    @file = File.open(path_file, 'a+')
    if File.exist?(path_file)
      @balance = @file.read.to_i
    else
      @balance = 100
      write_file
    end
  end

  def deposit(sum_add)
    check_file

    sum_add = String(sum_add).chomp.to_i

    return 'Uncorrected sum' unless sum_add.positive?

    @balance += sum_add
    show_balance
  end

  def withdraw(sum_remove)
    check_file

    sum_remove = String(sum_remove).chomp.to_i
    return 'Uncorrected sum' unless sum_remove.positive? && sum_remove <= @balance

    @balance -= sum_remove
    show_balance
  end

  def show_balance
    check_file

    "Balance: #{@balance}"
  end

  def quit
    check_file

    write_file
    @file.close
    'Bye bye'
  end

  private

  def check_file
    throw 'You quit from CashMachine' if @file.closed?
  end

  def write_file
    @file.truncate(0)
    @file.write(@balance)
    @file.rewind
  end
end
