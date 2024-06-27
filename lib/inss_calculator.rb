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
end
