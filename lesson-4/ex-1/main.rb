# Выводит все строки
def index(file)
  file.rewind
  file.read
end

# Находит конкретную строку в файл и выводит её
def find(file, id_line)
  file.rewind
  file.readlines[id_line]
end

# Находит все строки, где есть указанный паттерн
def where(file, pattern)
  file.rewind
  file.select { |line| line.match?(pattern) }.join
end

# Обновляет конкретную строку файла
def update(file, id_line, text)
  file.rewind
  lines = file.readlines
  file.rewind
  lines[id_line] = "#{text}\n"
  file.truncate(0)
  file.write(lines.join)
end

# Удаляет конкретную строку файла
def delete(file, id_line)
  file.rewind
  lines = file.readlines
  file.rewind
  lines.delete_at(id_line)
  file.truncate(0)
  file.write(lines.join.chomp)
end

# Добавляет строку в конец файла
def create(file, text)
  file.seek(0, IO::SEEK_END)
  file.write("\n#{text}")
end

file = File.open('file.txt')
text_file = file.read
file.close

File.open('file_edited.txt', 'w+') do |file_edited|
  file_edited.write(text_file)
  file_edited.rewind

  puts "\nВыводит все строки:"
  puts index(file_edited)

  puts "\nНаходит конкретную строку в файл и выводит её:"
  puts find(file_edited, 1)

  puts "\nНаходит все строки, где есть указанный паттерн:"
  puts where(file_edited, '21')

  puts "\nОбновляет конкретную строку файла:"
  update(file_edited, 0, 'Акимов Алексей 20')

  puts "\nУдаляет строку:"
  delete(file_edited, 0)

  puts "\nДобавляет строку в конец файла:"
  create(file_edited, 'Акимов Алексей 20')
end
