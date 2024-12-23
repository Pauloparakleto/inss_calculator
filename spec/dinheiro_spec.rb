require 'spec_helper'

RSpec.describe Dinheiro do
  it 'is R$ 12,00' do
    expect(Dinheiro.new(12).real_formatado).to eq('R$ 12,00')
  end

  it 'is R$ 12,34' do
    expect(Dinheiro.new(12.34).real_formatado).to eq('R$ 12,34')
  end

  it 'is R$ 123,00' do
    expect(Dinheiro.new(123).real_formatado).to eq('R$ 123,00')
  end

  it 'is R$ 123,45' do
    expect(Dinheiro.new(123.45).real_formatado).to eq('R$ 123,45')
  end

  it 'is R$ 1234' do
    expect(Dinheiro.new(1234).real_formatado).to eq('R$ 1.234,00')
  end
 
  it 'is R$ 123.456,78' do
    expect(Dinheiro.new(123456.78).real_formatado).to eq('R$ 123.456,78')
  end
end
