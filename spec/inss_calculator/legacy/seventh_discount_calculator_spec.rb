# frozen_string_literal: true

require 'spec_helper'

include InssCalculator

RSpec.describe Legacy::SeventhDiscountCalculator do
  it 'is true' do
    expect(described_class.new('3000')).to be_truthy
  end

  context 'when salary is below class level' do
    it 'is zero' do
      expect(described_class.new('26666.94').contribution).to eq(0.0)
    end
  end

  context 'when salary fills entirely the class level' do
    it 'is 4813.38' do
      expect(described_class.new('52000.54').contribution).to eq(4813.38)
    end
  end

  context 'when salary is 30000' do
    it 'is 633.28' do
      expect(described_class.new('30000').contribution).to eq(633.28)
    end
  end

  context 'when salary is beyond salary level' do
    it 'is 530.03' do
      expect(described_class.new('60000').contribution).to eq(4813.38)
    end
  end
end
