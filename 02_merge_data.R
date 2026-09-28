# IST 707 Final Project
# Combine + NFL career data

library(nflreadr)
library(dplyr)

# Load data
combine <- load_combine()
draft <- load_draft_picks()

# Remove missing player IDs
combine_ids <- combine %>%
  filter(!is.na(pfr_id))

draft_ids <- draft %>%
  filter(!is.na(pfr_player_id))

# Merge datasets
nfl_data <- combine_ids %>%
  left_join(
    draft_ids,
    by = c("pfr_id" = "pfr_player_id")
  )

# Check merged data
dim(nfl_data)

# See how many players matched
nfl_data %>%
  summarise(
    total_players = n(),
    matched_players = sum(!is.na(pfr_player_name)),
    unmatched_players = sum(is.na(pfr_player_name)),
    match_rate = mean(!is.na(pfr_player_name)) * 100
  )

# Look at matched players
nfl_data %>%
  select(
    player_name,
    pos,
    season.x,
    forty,
    bench,
    vertical,
    broad_jump,
    pfr_player_name,
    games,
    w_av,
    seasons_started
  ) %>%
  filter(!is.na(pfr_player_name)) %>%
  head(20)

# Matches by position
nfl_data %>%
  filter(!is.na(pfr_player_name)) %>%
  count(pos, sort = TRUE)
