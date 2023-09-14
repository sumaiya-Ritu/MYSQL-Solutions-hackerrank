SELECT Contests.contest_id, Contests.hacker_id, Contests.name, 
       SUM(s.ts), SUM(s.tas),SUM(v.tv),SUM(v.tuv)
FROM Contests
JOIN Colleges
ON Contests.contest_id = Colleges.contest_id
JOIN Challenges
ON Colleges.college_id = Challenges.college_id
LEFT JOIN ( SELECT challenge_id, SUM(total_views) as tv, SUM(total_unique_views) as tuv 
            FROM View_Stats
            GROUP BY challenge_id ) AS v 
ON Challenges.challenge_id = V.challenge_id
LEFT JOIN ( SELECT challenge_id, SUM(total_submissions) as ts, 
                   SUM(total_accepted_submissions) as tas 
            FROM Submission_Stats
            GROUP BY challenge_id ) AS s 
ON Challenges.challenge_id = S.challenge_id 
GROUP BY Contests.contest_id, Contests.hacker_id, Contests.name
ORDER BY Contests.contest_id ASC;
