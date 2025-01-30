# frozen_string_literal: true

require 'spec_helper'

include InssCalculator

RSpec.describe Legacy::FifthDiscountCalculator do
  it 'is true' do
    expect(described_class.new('3000')).to be_truthy
  end

  context 'when salary is below class level' do
    it 'is zero' do
      expect(described_class.new('7786.02').contribution).to eq(0.0)
    end
  end

  context 'when salary fills entirely the class level' do
    it 'is 804.38' do
      expect(described_class.new('13333.48').contribution).to eq(804.38)
    end
  end

  context 'when salary is 8000' do
    it 'is 31.02' do
      expect(described_class.new('8000').contribution).to eq(31.02)
    end
  end

  context 'when salary is beyond salary level' do
    it 'is 804.38' do
      expect(described_class.new('14000').contribution).to eq(804.38)
    end
  end
end
