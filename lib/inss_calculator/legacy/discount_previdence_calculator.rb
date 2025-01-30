# frozen_string_literal: true

module InssCalculator
  module Legacy
    # Based on this insecure protocoll site https://www.coalize.com.br/calculadora-de-inss
    # Check also the official law https://www.in.gov.br/en/web/dou/-/portaria-interministerial-mps/mf-n-2-de-11-de-janeiro-de-2024-537035232
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
        ].reduce(:+).round(2)
      end

      def net_salary
        (salary - contribution).round(2)
      end

      def present
        raise InssCalculator::NoMethodError, message: 'Use a decorator instead!'
      end
    end
  end
end
