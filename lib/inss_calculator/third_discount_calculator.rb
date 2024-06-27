# frozen_string_literal: true

module InssCalculator
  # ThirdDiscountCalculator calculates between its range limit
  # In case the salary is beyond this limit, it will use its quotation apply inside the range salary limit
  class ThirdDiscountCalculator < DiscountCalculatorBase
    QUOTATION = 0.12
    SALARY_BASE = 2089.60
    SALARY_LIMIT = 3134.40
    FULL_CONTRIBUTION = ((SALARY_LIMIT - SALARY_BASE) * QUOTATION).truncate(2)

    def contribution
      return NO_CONTRIBUTION if salary <= SALARY_BASE

      return FULL_CONTRIBUTION if salary > SALARY_LIMIT

      ((salary - SALARY_BASE) * QUOTATION).truncate(2)
    end
  end
end
