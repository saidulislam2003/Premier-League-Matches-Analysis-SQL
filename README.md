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

## 📌 Project Structure

```bash
📁 PremierLeague_SQL_Project/
│
├── PremierLeagueMatches.csv      # Cleaned dataset
├── PremierLeagueMatches.sql      # All SQL queries
├── README.md                     # This file
```

## 🧩 Data Understanding & Cleaning

Before querying, I ensured the dataset was ready:
- Checked for **nulls and inconsistent values**
- Standardized **date format** for time-based analysis
- Verified **team name consistency** to avoid duplicates
- Cleaned rows with missing scores or referees (if any)

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
 ### 2. Average goals per match under each referee
```sql
select Referee,
count(*) as total_matches,
avg(homeScore + awayScore) as avg_goals_per_match
from Portfolio..PremierLeagueMatches
where Referee is not null
group by Referee
order by avg_goals_per_match desc
```
### 3. Highest attendance in any specific match
```sql
select top 5 * from Portfolio..PremierLeagueMatches
order by Attendance DESC;
```

### 4. Date Range
```sql
select 
min(Date) as first_match, max(Date) as last_match
from Portfolio..PremierLeagueMatches
```
## 🛠️ Tools Used

- **SQL Server Management Studio (SSMS)** – query execution
- **Excel** – initial data formatting
- **GitHub** – version control and project showcase

---

## 👋 Contact

**Created by**: *Saidul Islam*  
📧 Email: *23303345@iubat.edu*  
🔗 [LinkedIn](https://www.linkedin.com/in/saidulislam2003)  
🔗 [GitHub](https://github.com/saidulislam2003)
