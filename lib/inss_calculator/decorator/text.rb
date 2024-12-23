module InssCalculator::Decorator
  class Text
    attr_reader :contribution
    private attr_reader :calculator

    def initialize(inss_calculator)
      @calculator = inss_calculator
    end

    def contribution
      "Com o salário de #{Dinheiro.new(calculator.salary).real_formatado}, sua contribuição é de #{Dinheiro.new(calculator.contribution).real_formatado}. Seu salário líquido, portanto, é de #{Dinheiro.new(calculator.net_salary).real_formatado}."
    end
  end
end
