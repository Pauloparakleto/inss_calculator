# InssCalculator

Calculadora do desconto do INSS sobre o salário bruto 2024 de acordo com a [Portaria Inter Ministerial
número 2 de 11 de Janeiro de 2024](https://www.in.gov.br/en/web/dou/-/portaria-interministerial-mps/mf-n-2-de-11-de-janeiro-de-2024-537035232).

Esta mesma portaria discorre tanto sobre a contribuição do trabalhador do setor público quanto do setor privado.

## Instalation

```
bundle add inss_calculator
```

Não conhecia [esse comando?](https://bundler.io/v2.5/man/bundle-add.1.html) Ele adiciona ao seu Gemfile a gem e ainda a instala.

## Usage

Para calcular a contribuição do trabalhador no setor privado:

```
gross_salary = 3000
calculator = InssCalculator::DiscountPrevidenceCalculator.new(gross_salary)
calculator.contribution => 258.81
calculator.salary => 3000.0
calculator.net_salary => 2741.19

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
  InssCalculator::FIRST_SALARY_BASE = 0.0
  InssCalculator::FIRST_SALARY_LIMIT = 1412.0

  InssCalculator::SECOND_SALARY_BASE = 1412.01
  InssCalculator::SECOND_SALARY_LIMIT = 2666.68

  InssCalculator::THIRD_SALARY_BASE = 2666.69
  InssCalculator::THIRD_SALARY_LIMIT = 4000.03

  InssCalculator::FOURTH_SALARY_BASE = 4000.04
  InssCalculator::FOURTH_SALARY_LIMIT = 7786.02

  # Abaixo as bases e os limites do setor público

  InssCalculator::FIFTH_SALARY_BASE = 7786.03
  InssCalculator::FIFTH_SALARY_LIMIT = 13_333.48

  InssCalculator::SIXTH_SALARY_BASE = 13_333.49
  InssCalculator::SIXTH_SALARY_LIMIT = 26_666.94

  InssCalculator::SEVENTH_SALARY_BASE = 26_666.95
  InssCalculator::SEVENTH_SALARY_LIMIT = 52_000.54

  InssCalculator::EIGTH_SALARY_BASE = 52_000.55
  InssCalculator::EIGTH_SALARY_LIMIT = Float::INFINITY


```

Desta forma, uma requisição que busca somente a primeira faixa salarial seria:

```
YourModel.where("salary <= ?", InssCalculator::FIRST_SALARY_LIMIT)
```

## Decorators

`InssCalculator::Decorator::Text` explica no formato de texto o que o trabalhador precisa saber.
Ideal para uso no parágrafo do HTML. Retire da view esta responsabildade e deixe com este decorator.
Você ainda tem acesso à classe original com `#calculator`.

```
calculator = InssCalculator::DiscountPrevidenceCalculator.new(3000)
text_decorator = InssCalculator::Decorator::Text.new(calculator)
text_decorator.present => "Com o salário de R$ 3.000,00, sua contribuição é de R$ 258,81. Seu salário líquido, portanto, é de R$ 2.741,19."

text_decorator.calculator => InssCalculator::DiscountPrevidenceCalculator.new(3000)

```

## Nota sobre trabalhar com números decimais em Ruby

Após investigar os resultados dos exemplos contábeis, concluiu-se que os números são truncados.

Cada faixa salarial trunca seu resultado final após aplicar a sua alíquota correspondente.

Por isso o uso do método `.truncate` ao invés de um arredondamento ao final de cada cálculo parcial.

Para mais detalhes, veja a regra e o exemplo [deste site](https://www.contabilizei.com.br/contabilidade-online/desconto-inss/)

### Vídeo de apresentação

[Assista](https://youtu.be/Eu5htw8qb4k?si=mpog6q0PJpxxuEjX) este vídeo no qual apresento um exemplo de uso da gem.

### Feito com amor, feito com Ruby S2
