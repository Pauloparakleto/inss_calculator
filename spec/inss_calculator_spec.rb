# frozen_string_literal: true

require 'spec_helper'

include InssCalculator

RSpec.describe DiscountPrevidenceCalculator do
  it 'is true' do
    expect(described_class.new('3000')).to be_truthy
  end

  describe '#salary' do
    it 'gets salary' do
      expect(described_class.new('3000').salary).to  eq(3000.0)
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

    context 'when salary is 2666.68' do
      it 'is 112.92 + first full contribution' do
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
      it 'is 908.84' do
        expect(described_class.new('7786.02').contribution).to eq(908.84)
      end
    end
  end
end
