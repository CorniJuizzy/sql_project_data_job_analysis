/*
Objective: Finding the most optimal skills to learn (aka it's in high demand and a high-paying skill)
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on positions that come from Mexico with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefit (high salaries),
    offering strategic insights for career development in data analysis
*/

SELECT 
    s.skill_id,
    s.skills,
    COUNT(d.job_id) AS demand,
    ROUND(AVG(j.salary_year_avg),2) AS avg_salary
FROM job_postings_fact j
INNER JOIN skills_job_dim d ON j.job_id = d.job_id
INNER JOIN skills_dim s ON d.skill_id = s.skill_id
WHERE 
    j.job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL 
    AND j.job_work_from_home = True
GROUP BY s.skill_id
HAVING COUNT(d.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand DESC
LIMIT 25;