# 🧬 Шаблон анализа клинических данных
# ⚠️ Используйте синтетические данные для демонстрации!

library(tidyverse)
library(lubridate)

# Генерация примера данных (НЕ реальные пациенты!)
set.seed(42)
patient_data <- tibble(
  patient_id = paste0("P", sprintf("%04d", 1:100)),
  age = sample(18:85, 100, replace = TRUE),
  gender = sample(c("F", "M"), 100, replace = TRUE),
  bacteria = sample(c("E.coli", "S.aureus"), 100, replace = TRUE),
  resistance = round(runif(100, 0, 100), 1)
)

# Базовый анализ
summary_stats <- patient_data %>%
  group_by(bacteria) %>%
  summarise(n = n(), mean_res = mean(resistance), .groups = "drop")

print(summary_stats)