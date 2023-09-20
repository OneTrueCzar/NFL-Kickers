library(tidyverse)
library(nflreadr)
library(nflfastR)

pbp <- load_pbp(seasons = c("2018":"2022")) %>% 
  filter(play_type == "field_goal",
         score_differential_post >= 0 & score_differential_post <= 3,
         half_seconds_remaining <= 300,
         kicker_player_name == "J.Tucker" |
         kicker_player_name == "C.Boswell" |
         kicker_player_name == "E.McPherson")

kicker_summary <- calculate_player_stats_kicking(pbp, weekly = FALSE) %>% 
  select(player_display_name, games, fg_made:fg_missed_60_, gwfg_att, gwfg_made:gwfg_blocked)

kickers <- pbp %>% 
  select(season, week, season_type, defteam, game_stadium, play_type, field_goal_result, score_differential_post,
         kick_distance, half_seconds_remaining, game_half, time, end_clock_time, kicker_player_name)