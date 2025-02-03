# frozen_string_literal: true

require 'spec_helper'

include InssCalculator

RSpec.describe Legacy::PublicInssCalculator do
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
      expect(described_class.new('3000').net_salary).to  eq(2741.19)
    end

    context 'when 5000' do
      it 'calculates truncated value' do
        expect(described_class.new('5000').net_salary).to eq(4481.19)
      end
    end
  end

  describe '#contribution' do
    context 'when salary is 3000' do
      it 'is 281.62' do
        expect(described_class.new('3000').contribution).to eq(258.81)
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

    context 'when salary is 1500' do
      it 'is 113.82' do
        expect(described_class.new('1500').contribution).to eq(113.82)
      end
    end

    context 'when salary is 2666.68' do
      it 'is 112.92 + first full contribution' do
        expect(described_class.new('2666.68').contribution).to eq(112.92 + 105.9)
      end
    end

    context 'when salary is 2800' do
      it 'is 234.81' do
        expect(described_class.new('2666.68').contribution).to eq(112.92 + 105.9)
      end
    end

    context 'when salary is 4000.03' do
      it 'is 378.82' do
        expect(described_class.new('4000.03').contribution).to eq(378.82)
      end
    end

    context 'when salary is 5000' do
      it 'is 518.81' do
        expect(described_class.new('5000').contribution).to eq(518.81)
      end
    end

    context 'when salary is 7786.02' do
      it 'is 908.85' do
        expect(described_class.new('7786.02').contribution).to eq(908.85)
      end
    end

    # the expectations above is the same for private employeers contributions

    context 'when salary is 13333.48' do
      it 'is 1713.23' do
        expect(described_class.new('13333.48').contribution).to eq(1713.23)
      end
    end

    context 'when salary is 26666.94' do
      it 'is 3913.25' do
        expect(described_class.new('26666.94').contribution).to eq(3913.25)
      end
    end

    context 'when salary is 52000.54' do
      it 'is 8726.63' do
        expect(described_class.new('52000.54').contribution).to eq(8726.63)
      end
    end

    context 'when salary is 60000.00' do
      it 'is 10486.51' do
        expect(described_class.new('60000.00').contribution).to eq(10486.51)
      end
    end

    context 'when salary is 100000' do
      it 'is 19286.51' do
        expect(described_class.new('100000').contribution).to eq(19286.51)
      end
    end
  end
end
