# frozen_string_literal: true

require 'spec_helper'

include InssCalculator

RSpec.describe Legacy::SecondDiscountCalculator do
  it 'is true' do
    expect(described_class.new('3000')).to be_truthy
  end

  context 'when salary is below salary class level' do
    it 'is zero' do
      expect(described_class.new('1412.0').contribution).to eq(0.0)
    end
  end
 
  context 'when salary is 1500' do
    it 'is 113.82' do
      expect(described_class.new('1500').contribution).to eq(7.92)
    end
  end

  context 'when salary is 2666.68' do
    it 'is 112.92' do
      expect(described_class.new('2666.68').contribution).to eq(112.92)
    end
  end

  context 'when salary is beyond 2666.68' do
    it 'is 112.92' do
      expect(described_class.new('3000').contribution).to eq(112.92)
    end
  end
end
