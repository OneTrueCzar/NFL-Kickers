library(tidyverse)
library(nflreadr)
library(nflfastR)

kickers <- load_pbp(seasons = TRUE) %>% 
  select(season, week, season_type, play_type, field_goal_result, score_differential_post, kick_distance, half_seconds_remaining, game_half, time, end_clock_time, kicker_player_name) %>% 
  filter(play_type == "field_goal",
         score_differential_post >= 0 & score_differential_post <= 3,
         half_seconds_remaining <= 300,
         kicker_player_name == "J.Tucker" |
         kicker_player_name == "C.Boswell" |
         kicker_player_name == "E.McPherson")