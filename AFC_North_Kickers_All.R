library(tidyverse)
library(nflreadr)
library(nflfastR)

kickers <- load_pbp(seasons = TRUE) %>% 
  filter(play_type == "field_goal",
         score_differential_post > 0 & score_differential_post <= 3,
         half_seconds_remaining <= 300,
         kicker_player_name == "J.Tucker" |
         kicker_player_name == "C.Boswell" |
         kicker_player_name == "E.McPherson")

kicker_summary <- calculate_player_stats_kicking(kickers, weekly = TRUE) %>% 
  select(season, week, season_type, player_display_name, fg_made:fg_blocked_distance, gwfg_att:gwfg_blocked)