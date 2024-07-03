# frozen_string_literal: true

module InssCalculator
  # SecondDiscountCalculator calculates between its range limit
  # In case the salary is beyond this limit, it will use its quotation apply inside the range salary limit
  class SecondDiscountCalculator < DiscountCalculatorBase
    QUOTATION = 0.09
    SALARY_BASE = 1412.0
    SALARY_LIMIT = 2666.68
    FULL_CONTRIBUTION = ((SALARY_LIMIT - SALARY_BASE) * QUOTATION).truncate(2)

    def contribution
      return NO_CONTRIBUTION if salary < salary_base

      return full_contribution if salary > salary_limit

      calculate_contribution
    end

    private

    def calculate_contribution
      ((salary - salary_base) * QUOTATION).truncate(2)
    end

    def full_contribution
      ((salary_limit - salary_base) * QUOTATION).truncate(2)
    end

    def salary_limit
      InssCalculator::SECOND_SALARY_LIMIT
    end

    def salary_base
      InssCalculator::SECOND_SALARY_BASE
    end

  end
end
