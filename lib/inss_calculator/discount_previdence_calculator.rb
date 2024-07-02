# frozen_string_literal: true

module InssCalculator
  # Based on this insecure protocoll site https://www.coalize.com.br/calculadora-de-inss
  class DiscountPrevidenceCalculator
    attr_reader :salary

    def initialize(salary)
      @salary = salary.to_f
    end

    def contribution
      [
        FirstDiscountCalculator.new(salary).contribution,
        SecondDiscountCalculator.new(salary).contribution,
        ThirdDiscountCalculator.new(salary).contribution,
        FourthDiscountCalculator.new(salary).contribution
      ].reduce(:+).truncate(2)
    end

    def net_salary
      salary - contribution
    end
  end
end
