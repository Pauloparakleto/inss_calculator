# frozen_string_literal: true

module InssCalculator
  # Based on this insecure protocoll site https://www.coalize.com.br/calculadora-de-inss
  # Check also the official law https://www.in.gov.br/en/web/dou/-/portaria-interministerial-mps/mf-n-2-de-11-de-janeiro-de-2024-537035232
  class PublicInssCalculator < InssCalculator::DiscountPrevidenceCalculator
    attr_reader :salary

    def initialize(salary)
      @salary = salary.to_f
    end

    def contribution
      [
        FirstDiscountCalculator.new(salary).contribution,
        SecondDiscountCalculator.new(salary).contribution,
        ThirdDiscountCalculator.new(salary).contribution,
        FourthDiscountCalculator.new(salary).contribution,
        FifthDiscountCalculator.new(salary).contribution,
        SixthDiscountCalculator.new(salary).contribution,
        SeventhDiscountCalculator.new(salary).contribution,
        EigthDiscountCalculator.new(salary).contribution
      ].reduce(:+).round(2)
    end

    def net_salary
      (salary - contribution).round(2)
    end
  end
end
