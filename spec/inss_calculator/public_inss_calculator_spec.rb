# frozen_string_literal: true

require 'spec_helper'

include InssCalculator

RSpec.describe PublicInssCalculator do
  it 'is true' do
    expect(described_class.new('3000')).to be_truthy
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

    context 'when salary is 13969.49' do
      it 'is 1794.37' do
        expect(described_class.new('13969.49').contribution).to eq(1794.37)
      end
    end

    context 'when salary is 27938.95' do
      it 'is 4099.33' do
        expect(described_class.new('27938.95').contribution).to eq(4099.33)
      end
    end

    context 'when salary is 54480.97' do
      it 'is 9142.31' do
        expect(described_class.new('54480.97').contribution).to eq(9142.31)
      end
    end

    xcontext 'when salary is 60000.00' do
      it 'is 10356.49' do
        expect(described_class.new('60000.00').contribution).to eq(10356.49)
      end
    end

    xcontext 'when salary is 100000' do
      it 'is 19156.48' do
        expect(described_class.new('100000').contribution).to eq(19156.48)
      end
    end
  end
end
