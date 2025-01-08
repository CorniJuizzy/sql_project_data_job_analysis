SELECT
    c.name
FROM job_postings_fact f
LEFT JOIN company_dim c ON f.company_id = c.company_id
WHERE job_health_insurance IS TRUE AND
      (EXTRACT(QUARTER FROM job_posted_date) = 2 AND
      EXTRACT(YEAR FROM job_posted_date) = 2023)
;