library(tidyverse)
library(nflreadr)
library(nflfastR)

pbp <- load_pbp(seasons = c("2018":"2023")) %>%
  filter(play_type == "field_goal",
         score_differential <= 0,
         score_differential_post >= -3 & score_differential_post <= 3,
         half_seconds_remaining <= 300 | game_half == "Overtime",
         kicker_player_name == "J.Tucker" |
         kicker_player_name == "C.Boswell" |
         kicker_player_name == "E.McPherson")

kicker_summary <- calculate_player_stats_kicking(pbp, weekly = FALSE) %>% 
  select(player_display_name, games, fg_made:fg_made_0_19, fg_missed_0_19, fg_made_20_29, fg_missed_20_29,
         fg_made_30_39, fg_missed_30_39, fg_made_40_49, fg_missed_40_49, fg_made_50_59, fg_missed_50_59,
         fg_made_60_, fg_missed_60_, gwfg_made, gwfg_att, gwfg_missed, gwfg_blocked) %>% 
  mutate(gwfg_pct = round((`gwfg_made` / `gwfg_att`), digits = 3))

kickers <- pbp %>% 
  select(season, week, season_type, defteam, game_stadium, play_type, field_goal_result, score_differential,
         score_differential_post, kick_distance, half_seconds_remaining, game_half, qtr, time, end_clock_time,
         kicker_player_name)