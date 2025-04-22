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

-- Which Refree conducted most of the matches
select top 1 * from Portfolio..PremierLeagueMatches
order by Referee DESC;

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
sum(case when Result = 'H' then 1 else 0 end) as away_wins
from Portfolio..PremierLeagueMatches
group by Away_Team
order by away_wins DESC





