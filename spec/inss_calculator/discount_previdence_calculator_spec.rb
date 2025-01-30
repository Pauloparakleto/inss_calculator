# frozen_string_literal: true

require 'spec_helper'

include InssCalculator

RSpec.describe DiscountPrevidenceCalculator do
  it 'is true' do
    expect(described_class.new('3000')).to be_truthy
  end

  describe '#present' do
    it 'raises error InssCalculator::NoMethodError' do
      expect { described_class.new('3000').present }.to raise_error InssCalculator::NoMethodError
    end
  end

  describe '#salary' do
    it 'gets salary' do
      expect(described_class.new('3000').salary).to  eq(3000.0)
    end
  end
  
  describe '#net_salary' do
    it 'calculates net salary' do
      expect(described_class.new('3000').net_salary).to  eq(2746.6)
    end

    context 'when 5000' do
      it 'calculates truncated value' do
        expect(described_class.new('5000').net_salary).to eq(4490.42)
      end
    end
  end

  describe '#contribution' do
    context 'when salary is 3000' do
      it 'is 253.4' do
        expect(described_class.new('3000').contribution).to eq(253.4)
      end
    end

    context 'when salary is 0' do
      it 'is 0' do
        expect(described_class.new('0').contribution).to eq(0)
      end
    end

    context 'when salary is 1412.0' do
      it 'is 105.9' do
        expect(described_class.new('1412.0').contribution).to eq(105.9)
      end
    end

    context 'when salary is 1518' do
      it 'is 113.82' do
        expect(described_class.new('1518').contribution).to eq(113.85)
      end
    end

    context 'when salary is 2793.88' do
      it 'is 228.67' do
        expect(described_class.new('2793.88').contribution).to eq(228.67)
      end
    end

    context 'when salary is 4190.83' do
      it 'is 396.3' do
        expect(described_class.new('4190.83').contribution).to eq(396.3)
      end
    end

    context 'when salary is 5000' do
      it 'is 509.58' do
        expect(described_class.new('5000').contribution).to eq(509.58)
      end
    end

    context 'when salary is 8157.41' do
      it 'is 908.85' do
        expect(described_class.new('8157.41').contribution).to eq(951.62)
      end
    end
  end
end
