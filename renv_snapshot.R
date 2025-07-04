# Inicializa o renv se ainda não foi feito
if (!requireNamespace("renv", quietly = TRUE)) install.packages("renv")

# Inicia o ambiente (bare evita instalar o que já existe globalmente)
renv::init(bare = TRUE)

# Instala todos os pacotes necessários para o projeto Quarto + IC
install.packages(c(
    "tidyverse",   # Manipulação de dados
    "ggplot2",     # Gráficos
    "writexl",     # Exportação para Excel
    "R6",          # Programação orientada a objetos (classe IC)
    "yaml",        # Parsing de arquivos .qmd
    "rmarkdown",   # Renderização de documentos
    "knitr"        # Execução dos chunks R nos documentos Quarto
))

# Salva os pacotes usados no renv.lock
renv::snapshot()
