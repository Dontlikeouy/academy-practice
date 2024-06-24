require 'rspec'
require './lib/ex-1/main'

describe 'Main' do
  file = File.open('file.txt')
  text_file = file.read
  file.close
  file_edited = File.open('file_edited.txt', 'w+')
  file_edited.write(text_file)
  file_edited.rewind

  it '#find' do
    expect(find(file_edited, 1)).to eq "Шапошникова Лада 12\n"
  end

  it '#where' do
    expect(where(file_edited, '21')).to eq "Попов Даниил 21\n"
  end
end
