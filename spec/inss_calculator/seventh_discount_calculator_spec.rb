# frozen_string_literal: true

require 'spec_helper'

include InssCalculator

RSpec.describe SeventhDiscountCalculator do
  it 'is true' do
    expect(described_class.new('3000')).to be_truthy
  end

  context 'when salary is below class level' do
    it 'is zero' do
      expect(described_class.new('27938.95').contribution).to eq(0.0)
    end
  end

  context 'when salary fills entirely the class level' do
    it 'is 5042.98' do
      expect(described_class.new('54480.97').contribution).to eq(5042.98)
    end
  end

  context 'when salary is 30000' do
    it 'is 391.59' do
      expect(described_class.new('30000').contribution).to eq(391.59)
    end
  end

  context 'when salary is beyond salary level' do
    it 'is 5042.98' do
      expect(described_class.new('60000').contribution).to eq(5042.98)
    end
  end
end
