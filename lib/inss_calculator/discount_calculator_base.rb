# frozen_string_literal: true

module InssCalculator
  # DiscountCalculatorBase provide the common initializer
  # for First, Second, Third and Fourth Discount calculators
  class DiscountCalculatorBase
    attr_reader :salary

    NO_CONTRIBUTION = 0.0
    SALARY_BASE = 0.0

    def initialize(salary)
      @salary = salary.to_f
    end
  end
end
