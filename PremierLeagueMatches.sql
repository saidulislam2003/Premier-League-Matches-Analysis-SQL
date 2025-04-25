-- Showing the full dataset
select *
from Portfolio..PremierLeagueMatches

-- Showing the total matches and total scores which is the summation of home score and away score
select
count (*) as total_matches,
sum(homeScore + awayScore) as total_Score
from Portfolio..PremierLeagueMatches;

-- Showing the highest total score among all teams 
SELECT TOP 5 Date, Home_Team, Away_Team, homeScore, awayScore,
(homeScore + awayScore) as TotalScores
FROM Portfolio..PremierLeagueMatches
ORDER BY TotalScores DESC;

-- Showing highest attendance in any specific match
select top 5 * from Portfolio..PremierLeagueMatches
order by Attendance DESC;

-- Which Referee conducted most of the matches
select Referee, count(*) as match_count
from Portfolio..PremierLeagueMatches
group by Referee
order by match_count desc

-- Which home team won highest matches
select top 1 Home_Team,
count(*) as home_matches,
sum(case when Result = 'H' then 1 else 0 end) as home_wins
from Portfolio..PremierLeagueMatches
group by Home_Team
order by home_wins DESC

-- Which away team won highest matches
select top 1 Away_Team,
count(*) as away_matches,
sum(case when Result = 'A' then 1 else 0 end) as away_wins
from Portfolio..PremierLeagueMatches
group by Away_Team
order by away_wins DESC

-- Finding average score
select 
avg (homeScore) as avghome,
avg (awayScore) as avgaway,
avg (homeScore + awayScore) as average_score
from Portfolio..PremierLeagueMatches

-- Date Range
select 
min(Date) as first_match, max(Date) as last_match
from Portfolio..PremierLeagueMatches

-- How many unique teams are there in this dataset
select 
count(distinct [Home_Team]) as number_of_teams
from Portfolio..PremierLeagueMatches

-- Total wins, draws, and losses for each team
select Team,
sum(case when result = 'W' then 1 else 0 end) as Wins,
sum(case when result = 'D' then 1 else 0 end) as Draw,
sum(case when result = 'L' then 1 else 0 end) as Losses

from (select Home_Team as Team,
case result 
	when 'H' then 'W'
	when 'D' then 'D'
	else 'L'
end as result
from Portfolio..PremierLeagueMatches

union all

select Away_Team,
case result
	when 'H' then 'W'
	when 'D' then 'D'
	else 'L'
end as result
from Portfolio..PremierLeagueMatches) as combinedresults
group by Team
order by Wins desc

-- Average goals per match under each referee
select Referee,
count(*) as total_matches,
avg(homeScore + awayScore) as avg_goals_per_match
from Portfolio..PremierLeagueMatches
where Referee is not null
group by Referee
order by avg_goals_per_match desc

-- Common Table Expression for Goals Scored
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
