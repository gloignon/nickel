library(tidyverse)

df <- read_csv("rsqaq_sequentielles_2007-2023.csv", col_types = cols(LD = col_double()))

table(df$Contaminant)
table(df$Station)

df_nickel_lim <-
  df %>% filter(
    Contaminant %in% c("Nickel PST", "Nickel PM10") &
      Station == "03006 - Québec - Vieux-Limoilou"
  )

df_nickel_lim %>% ggplot(aes(x = Date, y = Resultat, color = Contaminant)) +
  geom_line() +
  geom_smooth()+
  scale_y_log10()+
  ggpubr::theme_pubclean() +
  labs(title = "Nickel à Limouilou", caption = "Allo Sol", y = "Résultat (log10)")

df_nickel_lim %>% ggplot(aes(x = Date, y = Resultat, color = Contaminant)) +
  geom_line() +
  geom_smooth()+
  # scale_y_log10()+
  ggpubr::theme_pubclean() +
  labs(title = "Nickel à Limouilou", caption = "Allo Sol", y = "Résultat")
