library(tidyverse)
library(nflreadr)
library(nflfastR)

kickers <- load_pbp(seasons = TRUE) %>% 
  select(play_type, field_goal_result, score_differential, score_differential_post, kick_distance, half_seconds_remaining, game_half, time, kicker_player_name) %>% 
  filter(play_type == "field_goal",
         half_seconds_remaining < 300,
         kicker_player_name == "J.Tucker" |
         kicker_player_name == "C.Boswell" |
         kicker_player_name == "E.McPherson")