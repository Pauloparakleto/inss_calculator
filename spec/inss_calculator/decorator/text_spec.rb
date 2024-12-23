# frozen_string_literal: true

require 'spec_helper'

include InssCalculator::Decorator

RSpec.describe Text do
  let(:inss_calculator) { InssCalculator::DiscountPrevidenceCalculator.new(3000) }
  let(:text_message) { "Com o salário de R$ 3.000,00, sua contribuição é de R$ 258,81. Seu salário líquido, portanto, é de R$ 2.741,19." }

  describe '#present' do
    it 'presents contribution' do
      expect(described_class.new(inss_calculator).present).to eq(text_message)
    end
  end

  describe '#calculator' do
    it 'calls original class decorated' do
      expect(described_class.new(inss_calculator).calculator)
        .to be_an_instance_of(InssCalculator::DiscountPrevidenceCalculator)
    end
  end
  
  describe '#contribution' do
    it 'calls original contribution' do
      expect(described_class.new(inss_calculator).contribution)
        .to eq(258.81)
    end
  end
end
