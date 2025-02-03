# frozen_string_literal: true

module InssCalculator
  # EigthDiscountCalculator calculates between its range limit
  # As the limit is infinity, it always eacrease the contribution.
  class EigthDiscountCalculator < DiscountCalculatorBase
    QUOTATION = 0.22

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
      InssCalculator::SalaryLevels::EIGTH_SALARY_LIMIT
    end

    def salary_base
      InssCalculator::SalaryLevels::SEVENTH_SALARY_LIMIT
    end
  end
end
