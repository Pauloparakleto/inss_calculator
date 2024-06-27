# frozen_string_literal: true

module InssCalculator
  # FourthDiscountCalculator calculates between its range limit
  # In case the salary is beyond this limit, it will use its quotation apply inside the range salary limit
  class FourthDiscountCalculator < DiscountCalculatorBase
    QUOTATION = 0.14
    SALARY_BASE = 4000.04
    SALARY_LIMIT = 7786.02
    FULL_CONTRIBUTION = ((SALARY_LIMIT - SALARY_BASE) * QUOTATION).truncate(2)

    def contribution
      return NO_CONTRIBUTION if salary <= SALARY_BASE

      return FULL_CONTRIBUTION if salary > SALARY_LIMIT

      ((salary - SALARY_BASE) * QUOTATION).truncate(2)
    end
  end
end
