# frozen_string_literal: true

require_relative 'inss_calculator/version'
require_relative 'inss_calculator/legacy/salary_levels'
require_relative './dinheiro'
require_relative 'inss_calculator/discount_calculator_base'
require_relative 'inss_calculator/legacy/discount_previdence_calculator'
require_relative 'inss_calculator/legacy/public_inss_calculator'
require_relative 'inss_calculator/legacy/first_discount_calculator'
require_relative 'inss_calculator/legacy/second_discount_calculator'
require_relative 'inss_calculator/legacy/third_discount_calculator'
require_relative 'inss_calculator/legacy/fourth_discount_calculator'
require_relative 'inss_calculator/legacy/fifth_discount_calculator'
require_relative 'inss_calculator/legacy/sixth_discount_calculator'
require_relative 'inss_calculator/legacy/seventh_discount_calculator'
require_relative 'inss_calculator/legacy/eigth_discount_calculator'
require_relative 'inss_calculator/decorator/text'

module InssCalculator
  class Error < StandardError; end
  # Your code goes here...
end

require_relative 'inss_calculator/error/no_method_error'
