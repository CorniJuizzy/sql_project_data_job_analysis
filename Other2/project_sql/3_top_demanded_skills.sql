/*
Objective: Finding the most in-demand skills for data analysts in Mexico
- Join job postings to inner join table similar to query 2.
- Identify the top 10 in-demand skills for a data analyst.
- Focus on all job postings where Mexico is the location
- Why? Retrieves the top 10 skills with the highest demand in the job market,
    providing insights into the most valuable skills for job seekers.
*/

SELECT 
    s.skills,
    COUNT(d.job_id) AS demand
FROM job_postings_fact j
INNER JOIN skills_job_dim d ON j.job_id = d.job_id
INNER JOIN skills_dim s ON d.skill_id = s.skill_id
WHERE 
    j.job_title_short = 'Data Analyst' 
    AND j.job_location LIKE '%Mexico%'
GROUP BY s.skills
ORDER BY demand DESC
LIMIT 10;