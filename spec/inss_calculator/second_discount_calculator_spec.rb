# frozen_string_literal: true

require 'spec_helper'

include InssCalculator

RSpec.describe SecondDiscountCalculator do
  it 'is true' do
    expect(described_class.new('3000')).to be_truthy
  end

  context 'when salary is below salary class level' do
    it 'is zero' do
      expect(described_class.new('1518.0').contribution).to eq(0.0)
    end
  end
 
  context 'when salary is 1700' do
    it 'is 16.38' do
      expect(described_class.new('1700').contribution).to eq(16.38)
    end
  end

  context 'when salary is 2793.88' do
    it 'is 114.82' do
      expect(described_class.new('2793.88').contribution).to eq(114.82)
    end
  end

  context 'when salary is beyond 2793.88' do
    it 'is 114.82' do
      expect(described_class.new('4000').contribution).to eq(114.82)
    end
  end
end
