# frozen_string_literal: true

require 'spec_helper'

include InssCalculator

RSpec.describe SixthDiscountCalculator do
  it 'is true' do
    expect(described_class.new('3000')).to be_truthy
  end

  context 'when salary is below class level' do
    it 'is zero' do
      expect(described_class.new('13969.49').contribution).to eq(0.0)
    end
  end

  context 'when salary fills entirely the class level' do
    it 'is 2304.96' do
      expect(described_class.new('27938.95').contribution).to eq(2304.96)
    end
  end

  context 'when salary is 16000' do
    it 'is 335.03' do
      expect(described_class.new('16000').contribution).to eq(335.03)
    end
  end

  context 'when salary is beyond salary level' do
    it 'is 35000' do
      expect(described_class.new('35000').contribution).to eq(2304.96)
    end
  end
end
