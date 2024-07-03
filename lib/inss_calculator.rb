# frozen_string_literal: true

require_relative 'inss_calculator/version'
require_relative 'inss_calculator/discount_calculator_base'
require_relative 'inss_calculator/discount_previdence_calculator'
require_relative 'inss_calculator/first_discount_calculator'
require_relative 'inss_calculator/second_discount_calculator'
require_relative 'inss_calculator/third_discount_calculator'
require_relative 'inss_calculator/fourth_discount_calculator'

module InssCalculator
  class Error < StandardError; end
  # Your code goes here...
  FIRST_SALARY_BASE = 0.0
  FIRST_SALARY_LIMIT = 1412.0

  SECOND_SALARY_BASE = 1412.01
  SECOND_SALARY_LIMIT = 2666.68

  THIRD_SALARY_BASE = 2666.69
  THIRD_SALARY_LIMIT = 4000.03

  FOURTH_SALARY_BASE = 4000.04
  FOURTH_SALARY_LIMIT = 7786.02
end
