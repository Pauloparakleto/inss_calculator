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

  context 'when salary is 1518.0' do
    it 'is 113.85' do
      expect(described_class.new('1518.0').contribution).to eq(113.85)
    end
  end

  context 'when salary is above 3412.01' do
    it 'is 113.85' do
      expect(described_class.new('3412.01').contribution).to eq(113.85)
    end
  end
end
