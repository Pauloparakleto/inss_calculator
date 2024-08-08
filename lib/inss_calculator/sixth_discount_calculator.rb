# frozen_string_literal: true

module InssCalculator
  # SixthDiscountCalculator calculates between its range limit
  # In case the salary is beyond this limit, it will use its quotation apply inside the range salary limit
  class SixthDiscountCalculator < DiscountCalculatorBase
    QUOTATION = 0.165

    def contribution
      return NO_CONTRIBUTION if salary <= salary_base

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
      InssCalculator::SIXTH_SALARY_LIMIT
    end

    def salary_base
      InssCalculator::FIFTH_SALARY_LIMIT
    end
  end
end
