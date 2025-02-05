# InssCalculator

Calculadora de desconto do INSS de 2025 de acordo com a [Portaria Interministerial n. 6 de 10 de Janeiro de 2025](https://www.in.gov.br/en/web/dou/-/portaria-interministerial-mps/mf-n-6-de-10-de-janeiro-de-2025-606526848)

Esta mesma portaria discorre tanto sobre a contribuição do trabalhador do setor público quanto do setor privado.

## Instalation

```
bundle add inss_calculator
```

Não conhecia [esse comando?](https://bundler.io/v2.5/man/bundle-add.1.html) Ele adiciona ao seu Gemfile a gem e ainda a instala.

## Usage

Para calcular a contribuição do trabalhador no setor privado:

```
gross_salary = 1518.0
calculator = InssCalculator::DiscountPrevidenceCalculator.new(gross_salary)
calculator.contribution => 113.85
calculator.salary => 1518.0
calculator.net_salary => 1404.15

```
Para calcular a contribuição do trabalhador no setor público:

```

gross_salary = 52000.54
calculator = InssCalculator::PublicInssCalculator.new(gross_salary)
calculator.contribution => 8726.63
calculator.salary => 52000.54
calculator.net_salary => 43273.91

```
```
```
### Precisas realizar uma query ao Banco de Dados por grupo de faixa salarial?

InssCalculator providencia as seguintes constantes:

```
  InssCalculator::SalaryLevels::FIRST_SALARY_BASE = 0.0
  InssCalculator::SalaryLevels::FIRST_SALARY_LIMIT = 1518.0

  InssCalculator::SalaryLevels::SECOND_SALARY_BASE = 1518.01
  InssCalculator::SalaryLevels::SECOND_SALARY_LIMIT = 2793.88

  InssCalculator::SalaryLevels::THIRD_SALARY_BASE = 2793.89
  InssCalculator::SalaryLevels::THIRD_SALARY_LIMIT = 4190.83

  InssCalculator::SalaryLevels::FOURTH_SALARY_BASE = 4190.84
  InssCalculator::SalaryLevels::FOURTH_SALARY_LIMIT = 8157.41

  # Abaixo as bases e os limites do setor público

  InssCalculator::SalaryLevels::FIFTH_SALARY_BASE = 8157.42
  InssCalculator::SalaryLevels::FIFTH_SALARY_LIMIT = 13969.49

  InssCalculator::SalaryLevels::SIXTH_SALARY_BASE = 13969.5
  InssCalculator::SalaryLevels::SIXTH_SALARY_LIMIT = 27938.95

  InssCalculator::SalaryLevels::SEVENTH_SALARY_BASE = 27938.96
  InssCalculator::SalaryLevels::SEVENTH_SALARY_LIMIT = 54480.97

  InssCalculator::SalaryLevels::EIGTH_SALARY_BASE = 54480.98
  InssCalculator::SalaryLevels::EIGTH_SALARY_LIMIT = Float::INFINITY


```

Desta forma, uma requisição que busca somente a primeira faixa salarial seria:

```
  YourModel.where("salary <= ?", InssCalculator::SalaryLevels::FIRST_SALARY_LIMIT)
```

## Decorators

`InssCalculator::Decorator::Text` explica no formato de texto o que o trabalhador precisa saber.
Ideal para uso no parágrafo do HTML. Retire da view esta responsabildade e deixe com este decorator.
Você ainda tem acesso à classe original com `#calculator`.

```
calculator = InssCalculator::DiscountPrevidenceCalculator.new(3000)
text_decorator = InssCalculator::Decorator::Text.new(calculator)
text_decorator.present => "Com o salário de R$ 3.000,00, sua contribuição é de R$ 253,40. Seu salário líquido, portanto, é de R$ 2.746,60."

text_decorator.calculator => InssCalculator::DiscountPrevidenceCalculator.new(3000)

```

## Nota sobre trabalhar com números decimais em Ruby

Após investigar os resultados dos exemplos contábeis, concluiu-se que os números são truncados.

Cada faixa salarial trunca seu resultado final após aplicar a sua alíquota correspondente.

Por isso o uso do método `.truncate` ao invés de um arredondamento ao final de cada cálculo parcial.

### Vídeo de apresentação

[Assista](https://youtu.be/Eu5htw8qb4k?si=mpog6q0PJpxxuEjX) este vídeo no qual apresento um exemplo de uso da gem.

## Ainda precisa da calculadora de 2024?

Calculadora do desconto do INSS sobre o salário bruto 2024 de acordo com a [Portaria Inter Ministerial
número 2 de 11 de Janeiro de 2024](https://www.in.gov.br/en/web/dou/-/portaria-interministerial-mps/mf-n-2-de-11-de-janeiro-de-2024-537035232) foi movida para o módulo `InssCalculator::Legacy::DiscountPrevidenceCalculator`.

### Feito com amor, feito com Ruby S2
