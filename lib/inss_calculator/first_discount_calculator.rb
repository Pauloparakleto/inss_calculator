# frozen_string_literal: true

module InssCalculator
  # FirstDiscountCalculator calculates between its range limit
  # In case the salary is beyond this limit, it will use its quotation apply inside the range salary limit
  class FirstDiscountCalculator < DiscountCalculatorBase
    QUOTATION = 0.075

    def contribution
      return full_contribution if salary > salary_limit

      calculate_contribution
    end

    private

    def calculate_contribution
      (salary * QUOTATION).truncate(2)
    end

    def full_contribution
      ((salary_limit - salary_base) * QUOTATION).truncate(2)
    end

    def salary_limit
      InssCalculator::FIRST_SALARY_LIMIT
    end

    def salary_base
      InssCalculator::FIRST_SALARY_BASE
    end
  end
end
