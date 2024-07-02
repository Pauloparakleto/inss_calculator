# frozen_string_literal: true

require 'spec_helper'

include InssCalculator

RSpec.describe FourthDiscountCalculator do
  it 'is true' do
    expect(described_class.new('3000')).to be_truthy
  end

  context 'when salary is below class level' do
    it 'is zero' do
      expect(described_class.new('4000.03').contribution).to eq(0.0)
    end
  end

  context 'when salary fills entirely the class level' do
    it 'is 530.03' do
      expect(described_class.new('7786.02').contribution).to eq(530.03)
    end
  end

  context 'when salary is beyond salary level' do
    it 'is 530.03' do
      expect(described_class.new('10000').contribution).to eq(530.03)
    end
  end
end
