# InssCalculator

Calculadora do desconto do INSS sobre o salário bruto 2024

## Instalation

```
bundle add inss_calculator
```

Não conhecia [esse comando?](https://bundler.io/v2.5/man/bundle-add.1.html) Ele adiciona ao seu Gemfile a gem e ainda a instala.

## Usage

```
gross_salary = 3000
calculator = InssCalculator::DiscountPrevidenceCalculator.new(gross_salary)
calculator.contribution => 258.81
```

## Nota sobre trabalhar com números decimais em Ruby

Após investigar os resultados dos exemplos contábeis, concluiu-se que os números são truncados.

Cada faixa salarial trunca seu resultado final após aplicar a sua alíquota correspondente.

Por isso o uso do método `.truncate` ao invés de um arredondamento ao final de cada cálculo parcial.

Para mais detalhes, veja a regra e o exemplo [deste site](https://www.contabilizei.com.br/contabilidade-online/desconto-inss/)


### Feito com amor, feito com Ruby S2
