SELECT *
FROM ( -- Subquery starts here
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS january_jobs; -- Subquert ends here

WITH january_jobs AS (-- CTE definition starts here
        SELECT *
        FROM job_postings_fact
        WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) -- CTE definition ends here

SELECT * FROM january_jobs

-- Subqueries

SELECT 
    company_id,
    name AS company_name
FROM company_dim
WHERE company_id IN (
    SELECT company_id
    FROM job_postings_fact
    WHERE job_no_degree_mention = true
    ORDER BY company_id
);

-- CTE's
WITH company_job_count AS (
    SELECT 
        company_id, 
        COUNT(*) AS total_jobs
    FROM job_postings_fact
    GROUP BY company_id
)

SELECT 
    c.name, 
    j.total_jobs
FROM company_dim c 
LEFT JOIN company_job_count j ON c.company_id = j.company_id
ORDER BY total_jobs DESC
;

-- Practice Problem 1
SELECT skill_name
FROM (
    SELECT
        s.skills AS skill_name,
        COUNT(j.job_id) AS frequency
    FROM skills_job_dim j
    LEFT JOIN skills_dim s ON j.skill_id = s.skill_id
    GROUP BY s.skills
    ORDER BY frequency DESC
    LIMIT 5
)
;

-- Practice Problem 2

SELECT 
    company_name, 
    job_postings,
    CASE
        WHEN job_postings < 10 THEN 'Small'
        WHEN job_postings BETWEEN 10 AND 50 THEN 'Medium'
        ELSE 'Large'
    END AS size_category
FROM (
    SELECT 
        c.name AS company_name, 
        COUNT(j.job_id) AS job_postings
    FROM job_postings_fact j
    LEFT JOIN company_dim c ON j.company_id = c.company_id
    GROUP BY c.name
);