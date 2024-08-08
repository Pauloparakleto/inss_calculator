# frozen_string_literal: true

require 'spec_helper'

include InssCalculator

RSpec.describe SixthDiscountCalculator do
  it 'is true' do
    expect(described_class.new('3000')).to be_truthy
  end

  context 'when salary is below class level' do
    it 'is zero' do
      expect(described_class.new('13333.48').contribution).to eq(0.0)
    end
  end

  context 'when salary fills entirely the class level' do
    it 'is 2200.02' do
      expect(described_class.new('26666.94').contribution).to eq(2200.02)
    end
  end

  context 'when salary is 16000' do
    it 'is 439.97' do
      expect(described_class.new('16000').contribution).to eq(439.97)
    end
  end

  context 'when salary is beyond salary level' do
    it 'is 2200.02' do
      expect(described_class.new('30000').contribution).to eq(2200.02)
    end
  end
end
