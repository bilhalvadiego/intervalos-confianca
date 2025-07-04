# Intervalos de Confiança com Variância Conhecida

Este projeto implementa o cálculo e a visualização de Intervalos de
Confiança (IC) para a média de distribuições Normais com variância
conhecida, utilizando R moderno e o Quarto Framework para gerar
relatórios interativos e apresentações.

------------------------------------------------------------------------

## Conteúdo do Projeto

-   `funcoes_ic.R`\
    Script R que define a classe `IntervaloConfianca`, contendo funções
    para gerar amostras, calcular ICs e plotar os resultados.

-   `exercicios.qmd`\
    Documento Quarto que utiliza a classe definida para resolver dois
    exercícios:

    -   Exercício 1: 100 amostras de N(4,9), IC 95%
    -   Exercício 2: 150 amostras de N(25,36), IC 90%

    Gera gráficos e exporta os dados para arquivos `.xlsx`.

-   `renv/` e `renv.lock`\
    Ambiente isolado para gerenciar dependências do projeto.

-   `.gitignore`\
    Configurado para projetos R, Quarto e `renv`.

------------------------------------------------------------------------

## Instruções de Uso

### 1. Configuração do ambiente

No R, inicialize o ambiente e instale os pacotes:

``` r
if (!requireNamespace("renv", quietly = TRUE)) install.packages("renv")
renv::init(bare = TRUE)

install.packages(c(
  "tidyverse", "ggplot2", "writexl", "R6", 
  "yaml", "rmarkdown", "knitr"
))

renv::snapshot()
```

### 2. Executar o relatório Quarto

No terminal, rode:

``` bash
quarto preview exercicios.qmd
```

Ou para gerar a apresentação PowerPoint:

``` bash
quarto render exercicios.qmd --to pptx
```

### 3. Visualização dos resultados

-   Os gráficos mostram os ICs calculados e destacam os intervalos que
    **não contêm** a média real.
-   Os arquivos `.xlsx` gerados contêm os dados de cada exercício para
    análise adicional.

------------------------------------------------------------------------

## Dependências principais

-   R \>= 4.0
-   Pacotes R: `tidyverse`, `ggplot2`, `writexl`, `R6`, `yaml`,
    `rmarkdown`, `knitr`
-   Quarto Framework

------------------------------------------------------------------------

## Notas importantes

-   As funções assumem que a variância populacional é **conhecida** e
    usam distribuição Normal (z) para os ICs.
-   O projeto foi estruturado para facilitar manutenção e reutilização,
    com funções encapsuladas em uma classe R6.
-   Atente-se para rodar os comandos dentro do ambiente `renv` para
    evitar conflitos de versão.

------------------------------------------------------------------------

## Autor

Diego Bilhalva, Marcelo Amaral e João Victor Muniz

------------------------------------------------------------------------

## Licença

Projeto aberto para uso educacional.
