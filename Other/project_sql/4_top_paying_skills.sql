/*
Objective: Finding the top skills based on salary
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, that come from Mexico
- Why? It reveals how different skills impact salary levels for Data Analysts and
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
    s.skills,
    ROUND(AVG(j.salary_year_avg),2) AS avg_salary
FROM job_postings_fact j
INNER JOIN skills_job_dim d ON j.job_id = d.job_id
INNER JOIN skills_dim s ON d.skill_id = s.skill_id
WHERE 
    j.job_title_short = 'Data Analyst' 
    AND j.salary_year_avg IS NOT NULL 
    AND j.job_location LIKE '%Mexico%'
GROUP BY s.skills
ORDER BY avg_salary DESC
LIMIT 25;