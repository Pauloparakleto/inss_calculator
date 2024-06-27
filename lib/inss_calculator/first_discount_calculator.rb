# frozen_string_literal: true

module InssCalculator
  # FirstDiscountCalculator calculates between its range limit
  # In case the salary is beyond this limit, it will use its quotation apply inside the range salary limit
  class FirstDiscountCalculator < DiscountCalculatorBase
    QUOTATION = 0.075
    SALARY_BASE = 0.00
    SALARY_LIMIT = 1412.0
    FULL_CONTRIBUTION = ((SALARY_LIMIT - SALARY_BASE) * QUOTATION).truncate(2)

    def contribution
      return FULL_CONTRIBUTION if salary > SALARY_LIMIT

      (salary * QUOTATION).truncate(2)
    end
  end
end
