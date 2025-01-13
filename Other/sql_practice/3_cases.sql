SELECT
    job_title_short,
    job_title,
    job_location,
    salary_year_avg,
    CASE
        WHEN salary_year_avg < 80000 THEN 'Low Salary'
        WHEN salary_year_avg BETWEEN 80000 AND 100000 THEN 'Standard Salary'
        WHEN salary_year_avg > 100000 THEN 'High Salary'
        ELSE 'Salary Not Specified'
    END AS salary_range
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
;