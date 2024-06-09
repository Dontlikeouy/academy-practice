# frozen_string_literal: true

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
