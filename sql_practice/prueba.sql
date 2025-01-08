SELECT *
FROM job_postings_fact
WHERE job_location LIKE '%Tamaulipas, Mexico%'
; 

SELECT DISTINCT search_location
FROM job_postings_fact
LIMIT 100; 