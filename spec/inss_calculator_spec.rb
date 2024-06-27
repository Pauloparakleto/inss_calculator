require 'spec_helper'

include InssCalculator

RSpec.describe DiscountPrevidenceCalculator do
  it 'is true' do
    expect(described_class.new('3000')).to be_truthy
  end

  describe '#contribution' do
    context 'when salary is 3000' do
      it 'is 281.62' do
        expect(described_class.new('3000').contribution).to eq(281.62)
      end
    end

    context 'when salary is 0' do
      it 'is 0' do
        expect(described_class.new('0').contribution).to eq(0)
      end
    end

    context 'when salary is 1045' do
      it 'is 78.37' do
        expect(described_class.new('1045').contribution).to eq(78.37)
      end
    end

    context 'when salary is 2089.60' do
      it 'is 172.38' do
        expect(described_class.new('2089.60').contribution).to eq(172.38) # 78.37 + 94.01
      end
    end

    context 'when salary is 3134.40' do
      it 'is 297.76' do
        expect(described_class.new('3134.40').contribution).to eq(297.75)
      end
    end

    context 'when salary is 5000' do
      it 'is 542.80' do
        expect(described_class.new('5000').contribution).to eq(558.93)
      end
    end

    context 'when salary is 6101.06' do
      it 'is 713.09' do
        expect(described_class.new('6101.06').contribution).to eq(713.08)
      end
    end
  end
end
