# frozen_string_literal: true

require 'spec_helper'

include InssCalculator

RSpec.describe FourthDiscountCalculator do
  it 'is true' do
    expect(described_class.new('3000')).to be_truthy
  end

  context 'when salary is below class level' do
    it 'is zero' do
      expect(described_class.new('4190.83').contribution).to eq(0.0)
    end
  end

  context 'when salary fills entirely the class level' do
    it 'is 555.32' do
      expect(described_class.new('8157.41').contribution).to eq(555.32)
    end
  end

  context 'when salary is 5000' do
    it 'is 113.28' do
      expect(described_class.new('5000').contribution).to eq(113.28)
    end
  end

  context 'when salary is beyond salary level' do
    it 'is 555.32' do
      expect(described_class.new('10000').contribution).to eq(555.32)
    end
  end
end
