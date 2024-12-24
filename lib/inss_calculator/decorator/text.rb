# frozen_string_literal: true

module InssCalculator
  # It extends Calculator contribution to a presentable format.
  module Decorator
    require 'forwardable'
    # InssCalculator::Decorator::Text implements the same Calculator interface
    # and its #present method presents the contribution result in a text format.
    class Text
      extend Forwardable

      def_delegators :@calculator, :salary, :net_salary, :contribution

      attr_reader :calculator

      def initialize(inss_calculator)
        @calculator = inss_calculator
      end

      def present
        "#{salary_text} #{contribution_text} #{net_salary_text}"
      end

      private

      def salary_text
        "Com o salário de #{Dinheiro.new(calculator.salary).real_formatado},"
      end

      def contribution_text
        "sua contribuição é de #{Dinheiro.new(calculator.contribution).real_formatado}."
      end

      def net_salary_text
        "Seu salário líquido, portanto, é de #{Dinheiro.new(calculator.net_salary).real_formatado}."
      end
    end
  end
end
