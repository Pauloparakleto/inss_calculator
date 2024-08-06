# frozen_string_literal: true

module InssCalculator
  # Based on this insecure protocoll site https://www.coalize.com.br/calculadora-de-inss
  # Check also the official law https://www.in.gov.br/en/web/dou/-/portaria-interministerial-mps/mf-n-2-de-11-de-janeiro-de-2024-537035232
  class PublicInssCalculator < InssCalculator::DiscountPrevidenceCalculator
    def contribution
      super + public_contribution
    end

    private

    def public_contribution
      [ FifthDiscountCalculator.new(salary).contribution,
        SixthDiscountCalculator.new(salary).contribution,
        SeventhDiscountCalculator.new(salary).contribution,
        EigthDiscountCalculator.new(salary).contribution
      ].reduce(:+).round(2)
    end
  end
end
