# funcoes_ic.R

# Carregando pacotes necessários
library(tidyverse)
library(ggplot2)

# Definição da classe
IntervaloConfianca <- R6::R6Class(
    "IntervaloConfianca",
    public = list(
        gerar_ic = function(n_amostras, n, media, variancia, nivel_confianca) {
            sigma <- sqrt(variancia)
            z <- qnorm(1 - (1 - nivel_confianca) / 2)
            
            amostras <- replicate(n_amostras, rnorm(n, mean = media, sd = sigma))
            
            tibble(
                amostra = 1:n_amostras,
                media_amostral = colMeans(amostras),
                erro_padrao = sigma / sqrt(n),
                lim_inf = media_amostral - z * erro_padrao,
                lim_sup = media_amostral + z * erro_padrao,
                contem_media_real = lim_inf <= media & lim_sup >= media
            )
        },
        
        plotar_ic = function(df_ic, media_real, titulo) {
            ggplot(df_ic, aes(x = amostra, y = media_amostral)) +
            geom_point(size = 1.5) +
            geom_errorbar(aes(ymin = lim_inf, ymax = lim_sup, color = contem_media_real), width = 0.5) +
            geom_hline(yintercept = media_real, linetype = "dashed", color = "red") +
            scale_color_manual(values = c("TRUE" = "blue", "FALSE" = "orange")) +
            labs(
                title = titulo,
                x = "Amostra",
                y = "Intervalo de Confiança para a Média",
                color = "Contém μ?"
            ) +
            theme_minimal()
        }
    )
)
