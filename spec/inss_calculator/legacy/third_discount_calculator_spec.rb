# # frozen_string_literal: true

require 'spec_helper'

include InssCalculator

RSpec.describe Legacy::ThirdDiscountCalculator do
  it 'is true' do
    expect(described_class.new('3000')).to be_truthy
  end

  context 'when salary is below the salary level' do
    it 'is zero' do
      expect(described_class.new('2666.68').contribution).to eq(0.0)
    end
  end

  context 'when salary is 2800' do
    it 'is 15.99' do
      expect(described_class.new('2800').contribution).to eq(15.99)
    end
  end

  context 'when salary fills entirely the class level' do
    it 'is 160.0' do
      expect(described_class.new(4000.03).contribution).to eq(160.0)
    end
  end
  
  context 'when salary is beyond the class level' do
    it 'is 160.0' do
      expect(described_class.new(5000.03).contribution).to eq(160.0)
    end
  end
end
