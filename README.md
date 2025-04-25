# ⚽ Premier League SQL Analytics

This project analyzes a dataset of Premier League matches using SQL to uncover trends, patterns, and insights into team performance, scoring behavior, referee impact, and more.

---

## 📁 Dataset Overview

- **File**: `PremierLeagueMatches.csv`
- **Records**: ~X rows (matches)
- **Columns**: Date, Home Team, Away Team, Scores, Referee, Attendance, Result, etc.
- **Source**: Premier League match data (uploaded manually)

---

## 🎯 Objectives

- Analyze scoring trends over time (monthly and seasonal)
- Evaluate team performance (goals scored, conceded, win/loss/draw)
- Identify referee influence on match dynamics
- Explore attendance and fan engagement
- Build portfolio-ready queries for business or sports analytics roles

---

## 🧠 Key Insights

| Insight | Summary |
|--------|---------|
| 📈 Average goals per match | 3 goals |
| 🏟️ Highest Attendance Match | `Manchester Utd vs Manchester City`, with `75,546` fans |
| 🧑‍⚖️ Referee with highest scoring matches | `Matt Donohue` oversaw matches with an avg of `4` goals |
| ⚔️ Top scoring team (Year-wise) | `Manchester City ` in `Year 2022` scored `44` goals |
| 🛡️ Best defensive team (lowest goals conceded) | `Crystal Palace` in `Year 2025` |

---

## 📌 SQL Highlights

Here’s a breakdown of the main SQL queries used:

### 1. Total Matches and Total Goals
```sql
SELECT COUNT(*) AS TotalMatches, SUM(homeScore + awayScore) AS TotalGoals FROM Portfolio..PremierLeagueMatches;
```
### 2. Team Performance (Goals Scored/Conceded/Goal Diff)
```sql
-- Uses CTEs to calculate goals scored and conceded per team per season.
;with GoalsScored as (
select Team,
year(Date) as MatchYear,
sum(Goals) as TotalGoalsScored

from (
select Home_Team as Team,
Date, 
homeScore as Goals
from Portfolio..PremierLeagueMatches

union all

select Away_Team as Team,
Date, 
awayScore as Goals
from Portfolio..PremierLeagueMatches
) as Scored
group by Team, year(Date)
), 

-- Common Table Expression for Goals Conceded
GoalsConceded as (
select Team,
year(Date) as MatchYear, 
sum(Goals) as TotalGoalsConceded

from (
select Home_Team as Team,
Date,
awayScore as Goals
from Portfolio..PremierLeagueMatches

union all

select Away_Team as Team,
Date,
homeScore as Goals
from Portfolio..PremierLeagueMatches
) as Conceded
group by Team, year(Date)
)

-- Final select: Joining both CTEs
select
gs.Team,
gs.MatchYear,
gs.TotalGoalsScored,
gc.TotalGoalsConceded,
(gs.TotalGoalsScored - gc.TotalGoalsConceded) as GoalDifference
from GoalsScored gs join GoalsConceded gc
on gs.Team = gc.Team and gs.MatchYear = gc.MatchYear
order by gs.MatchYear, GoalDifference desc
```
