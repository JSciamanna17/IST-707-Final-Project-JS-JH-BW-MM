# IST 707 Final Project
# Predicting Success in the NFL Based on Draft Combine Results
# Initial data loading and exploration

# Install nflreadr if needed
# install.packages("nflreadr")

library(nflreadr)
library(dplyr)

# Load NFL Combine data
combine <- load_combine()

# Load NFL Draft / career data
draft <- load_draft_picks()

# -------------------------
# Basic dataset information
# -------------------------

dim(combine)
dim(draft)

names(combine)
names(draft)

# Preview
head(combine)
head(draft)

# Structure and variable types
str(combine)
str(draft)


# Years included in Combine dataset
range(combine$season, na.rm = TRUE)

# Number of players by position
combine %>%
  count(pos, sort = TRUE)

# Number of Combine participants by year
combine %>%
  count(season) %>%
  arrange(season)

# Missing Combine results

combine %>%
  summarise(
    missing_40 = sum(is.na(forty)),
    missing_bench = sum(is.na(bench)),
    missing_vertical = sum(is.na(vertical)),
    missing_broad_jump = sum(is.na(broad_jump)),
    missing_cone = sum(is.na(cone)),
    missing_shuttle = sum(is.na(shuttle))
  )

# Percentage missing for each drill
combine %>%
  summarise(
    forty_pct = mean(is.na(forty)) * 100,
    bench_pct = mean(is.na(bench)) * 100,
    vertical_pct = mean(is.na(vertical)) * 100,
    broad_jump_pct = mean(is.na(broad_jump)) * 100,
    cone_pct = mean(is.na(cone)) * 100,
    shuttle_pct = mean(is.na(shuttle)) * 100
  )



# Player IDs in each dataset
combine %>%
  select(contains("id")) %>%
  head()

draft %>%
  select(contains("id")) %>%
  head()
