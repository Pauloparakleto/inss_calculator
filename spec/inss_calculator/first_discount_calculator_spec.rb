require 'spec_helper'

include InssCalculator

RSpec.describe FirstDiscountCalculator do
  it 'is true' do
    expect(described_class.new(3000)).to be_truthy
  end

  context 'when salary is 0' do
    it 'is 0' do
      expect(described_class.new('0').contribution).to eq(0)
    end
  end

  context 'when salary is 1412.0' do
    it 'is 105.9' do
      expect(described_class.new('1412.0').contribution).to eq(105.9)
    end
  end

  context 'when salary is 1100.0' do
    it 'is 105.9' do
      expect(described_class.new('1100.0').contribution).to eq(82.5)
    end
  end

  context 'when salary is above 1412.0' do
    it 'is 105.9' do
      expect(described_class.new('3412.01').contribution).to eq(105.9)
    end
  end
end
