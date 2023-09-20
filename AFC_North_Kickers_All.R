library(tidyverse)
library(nflreadr)

kickers <- load_pbp(seasons = TRUE) %>% 
  select(play_type, field_goal_result, kick_distance, half_seconds_remaining, kicker_player_name) %>% 
  filter(play_type == "field_goal",
         half_seconds_remaining < 3000,
         kicker_player_name == "Justin Tucker")