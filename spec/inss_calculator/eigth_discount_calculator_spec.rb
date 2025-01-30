# frozen_string_literal: true

require 'spec_helper'

include InssCalculator

RSpec.describe EigthDiscountCalculator do
  it 'is true' do
    expect(described_class.new('3000')).to be_truthy
  end

  context 'when salary is below class level' do
    it 'is zero' do
      expect(described_class.new('52000.54').contribution).to eq(0.0)
    end
  end

  context 'when salary is 60000' do
    it 'is 1214.18' do
      expect(described_class.new('60000').contribution).to eq(1214.18)
    end
  end
end
