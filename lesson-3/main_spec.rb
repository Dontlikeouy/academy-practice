require 'rspec'
require './main'

describe 'Main' do
  it '#check_word' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('foo')
    expect(check_word).to eq 'oof'
  end

  it '#check_word' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('foocs')
    expect(check_word).to eq 32
  end

  it '#add_pokemon' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('1', 'Первый', 'Голубой')
    expect(add_pokemon).to eq [{ color: 'Голубой', name: 'Первый' }]
  end
end
