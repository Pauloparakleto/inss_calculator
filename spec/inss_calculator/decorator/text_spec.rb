# frozen_string_literal: true

require 'spec_helper'

include InssCalculator::Decorator

RSpec.describe Text do
  let(:inss_calculator) { InssCalculator::DiscountPrevidenceCalculator.new(3000) }
  let(:text_message) { "Com o salário de R$ 3.000,00, sua contribuição é de R$ 258,81. Seu salário líquido, portanto, é de R$ 2.741,19." }

  it 'describes contribution' do
    expect(described_class.new(inss_calculator).contribution).to eq(text_message)
  end
end
