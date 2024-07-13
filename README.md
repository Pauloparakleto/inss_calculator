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
calculator.salary => 3000.0
calculator.net_salary => 2741.19
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

```

Desta forma, uma requisição que busca somente a primeira faixa salarial seria:

```
YourModel.where("salary <= ?", InssCalculator::FIRST_SALARY_LIMIT)
```

## Nota sobre trabalhar com números decimais em Ruby

Após investigar os resultados dos exemplos contábeis, concluiu-se que os números são truncados.

Cada faixa salarial trunca seu resultado final após aplicar a sua alíquota correspondente.

Por isso o uso do método `.truncate` ao invés de um arredondamento ao final de cada cálculo parcial.

Para mais detalhes, veja a regra e o exemplo [deste site](https://www.contabilizei.com.br/contabilidade-online/desconto-inss/)

### Vídeo de apresentação

[Assista](https://youtu.be/Eu5htw8qb4k?si=mpog6q0PJpxxuEjX) este vídeo no qual apresento um exemplo de uso da gem.

### Feito com amor, feito com Ruby S2
