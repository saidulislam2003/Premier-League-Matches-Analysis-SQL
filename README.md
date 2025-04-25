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
| 📈 Average goals per match | X.XX goals |
| 🏟️ Highest Attendance Match | `Team A vs Team B`, with `XX,XXX` fans |
| 🧑‍⚖️ Referee with highest scoring matches | `Referee X` oversaw matches with an avg of `Y.YY` goals |
| ⚔️ Top scoring team (Year-wise) | `Team X` in `Year YYYY` scored `ZZ` goals |
| 🛡️ Best defensive team (lowest goals conceded) | `Team Y` in `Year YYYY` |
| 📊 Monthly scoring trends | (Add image/chart if available) |

---

## 📌 SQL Highlights

Here’s a breakdown of the main SQL queries used:

### 1. Total Matches and Total Goals
```sql
SELECT COUNT(*) AS TotalMatches, SUM(homeScore + awayScore) AS TotalGoals FROM Portfolio..PremierLeagueMatches;
