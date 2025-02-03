# # frozen_string_literal: true

require 'spec_helper'

include InssCalculator

RSpec.describe ThirdDiscountCalculator do
  it 'is true' do
    expect(described_class.new('3000')).to be_truthy
  end

  context 'when salary is below the salary level' do
    it 'is zero' do
      expect(described_class.new('2793.88').contribution).to eq(0.0)
    end
  end

  context 'when salary is 3000' do
    it 'is 24.73' do
      expect(described_class.new('3000').contribution).to eq(24.73)
    end
  end

  context 'when salary fills entirely the class level' do
    it 'is 167.63' do
      expect(described_class.new(4190.83).contribution).to eq(167.63)
    end
  end
  
  context 'when salary is beyond the class level' do
    it 'is 167.63' do
      expect(described_class.new(5000.03).contribution).to eq(167.63)
    end
  end
end
