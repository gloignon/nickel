library(tidyverse)

df <- read_csv("rsqaq_sequentielles_2007-2023.csv", col_types = cols(LD = col_double()), na = "")

table(df$Contaminant)
table(df$Station)

df_nickel_lim <-
  df %>% filter(
    Contaminant %in% c("Nickel PST", "Nickel PM10") &
      Station == "03006 - Québec - Vieux-Limoilou"
  )

# échelle log
df_nickel_lim %>% ggplot(aes(x = Date, y = Resultat, color = Contaminant)) +
  geom_line() +
  geom_smooth()+
  scale_y_log10()+
  scale_x_date(date_breaks = "2 year")+
  ggpubr::theme_pubclean() +
  labs(title = "Nickel à Limouilou", caption = "Allo Sol", y = "Résultat (log10)")

# échelle linéaire
df_nickel_lim %>% ggplot(aes(x = Date, y = Resultat, color = Contaminant)) +
  geom_line() +
  geom_smooth()+
  # scale_y_log10()+
  scale_x_date(date_breaks = "2 years")+
  ggpubr::theme_pubclean() +
  labs(title = "Nickel à Limouilou", caption = "Allo Sol", y = "Résultat")
