# frozen_string_literal: true

require 'spec_helper'

include InssCalculator

RSpec.describe FifthDiscountCalculator do
  it 'is true' do
    expect(described_class.new('3000')).to be_truthy
  end

  context 'when salary is below class level' do
    it 'is zero' do
      expect(described_class.new('8157.41').contribution).to eq(0.0)
    end
  end

  context 'when salary fills entirely the class level' do
    it 'is 842.75' do
      expect(described_class.new('13969.49').contribution).to eq(842.75)
    end
  end

  context 'when salary is 9000' do
    it 'is 122.17' do
      expect(described_class.new('9000').contribution).to eq(122.17)
    end
  end

  context 'when salary is beyond salary level' do
    it 'is 842.75' do
      expect(described_class.new('14000').contribution).to eq(842.75)
    end
  end
end
