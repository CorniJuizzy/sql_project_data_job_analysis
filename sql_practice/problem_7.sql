WITH remote_job_skills AS (
    SELECT 
        skill_id,
        COUNT(*) AS skill_count
    FROM skills_job_dim j
    INNER JOIN job_postings_fact p ON j.job_id = p.job_id
    WHERE p.job_work_from_home = TRUE AND
    p.job_title_short = 'Data Analyst'
    GROUP BY skill_id
)

SELECT 
    s.skill_id,
    skills AS skill_name,
    skill_count
FROM remote_job_skills r 
INNER JOIN skills_dim s ON s.skill_id = r.skill_id
ORDER BY skill_count DESC
LIMIT 5
;