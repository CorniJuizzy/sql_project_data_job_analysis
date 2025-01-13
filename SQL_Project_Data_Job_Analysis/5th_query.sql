/*
Question: What are the most demanded skills for remote Data Analyst jobs?
- Identify the top 10 most frequently listed skills in remote "Data Analyst" job postings by the top 100 companies.
- Focuses on skill requirements, using associated skills tables for analysis.
- Why? Provides job seekers with key insights into the most valued skills for remote Data Analyst roles.
*/

SELECT 
    s.skills,
    COUNT(j.job_id) AS demand
FROM job_postings_fact j
INNER JOIN skills_job_dim d ON j.job_id = d.job_id
INNER JOIN skills_dim s ON d.skill_id = s.skill_id
WHERE 
    j.job_work_from_home = TRUE
    AND job_title_short = 'Data Analyst'
    AND j.company_id IN (
    SELECT company_id
    FROM job_postings_fact 
    WHERE 
        job_work_from_home = TRUE
        AND job_title_short = 'Data Analyst'
        AND job_country IN (
            SELECT job_country
            FROM job_postings_fact
            WHERE 
                job_work_from_home = TRUE
                AND job_title_short = 'Data Analyst'
            GROUP BY job_country
            ORDER BY COUNT(job_id) DESC
            LIMIT 10
        )
    GROUP BY company_id
    ORDER BY COUNT(job_id) DESC
    LIMIT 100     
    )
GROUP BY s.skills
ORDER BY demand DESC
LIMIT 10
;

/*
Here is the breakdown of the most demanded skills for remote Data Analyst roles, based on the top 100 companies:

    - SQL: 1,422 job postings mention SQL, making it the most sought-after skill for remote Data Analyst positions.
    - Excel: 1,066 mentions of Excel, highlighting its importance in handling data analysis tasks.
    - Python: With 834 mentions, Python is a highly valued programming language for data manipulation and analysis.
    - Tableau: 762 mentions indicate that Tableau is a popular tool for data visualization in remote Data Analyst jobs.
    - SAS: 464 mentions of SAS show its relevance, particularly in statistical analysis and data management.
    - Power BI: 453 mentions highlight Power BI's role in data visualization and business intelligence.
    - R: With 422 mentions, R is a key language for statistical computing and data analysis.
    - Go: 328 mentions of Go suggest its growing use in data analysis, especially in handling large datasets.
    - PowerPoint: 183 mentions emphasize the importance of presenting data insights in an understandable format.
    - Oracle: 154 mentions reflect Oracle's role in database management and data analysis.

These skills are essential for job seekers aiming for remote Data Analyst roles, providing actionable insights into the most in-demand competencies.

RESULTS
=======
[
  {
    "skills": "sql",
    "demand": "1422"
  },
  {
    "skills": "excel",
    "demand": "1066"
  },
  {
    "skills": "python",
    "demand": "834"
  },
  {
    "skills": "tableau",
    "demand": "762"
  },
  {
    "skills": "sas",
    "demand": "464"
  },
  {
    "skills": "power bi",
    "demand": "453"
  },
  {
    "skills": "r",
    "demand": "422"
  },
  {
    "skills": "go",
    "demand": "328"
  },
  {
    "skills": "powerpoint",
    "demand": "183"
  },
  {
    "skills": "oracle",
    "demand": "154"
  }
]
*/