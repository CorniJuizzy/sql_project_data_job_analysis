SELECT 
    j.job_id, 
    j.job_title,
    d.name AS company_name,
    j.job_location, 
    j.job_schedule_type, 
    j.salary_year_avg, 
    j.job_posted_date
FROM job_postings_fact j
LEFT JOIN company_dim d
ON j.company_id = d.company_id
WHERE 
    j.job_title_short = 'Data Analyst' AND
    j.job_location = 'Anywhere' AND
    j.salary_year_avg IS NOT NULL
ORDER BY 
    j.salary_year_avg DESC
LIMIT 10;