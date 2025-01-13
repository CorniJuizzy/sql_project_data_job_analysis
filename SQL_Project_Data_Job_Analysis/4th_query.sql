/*
Question: On which platforms do top companies post their remote Data Analyst jobs?
- Identify the most popular job platforms used by the top 100 companies to post their remote "Data Analyst" roles.
- Focuses on job posting platforms to reveal where candidates can find relevant opportunities.
- Why? Assists job seekers in identifying the platforms with the most remote Data Analyst job postings.
*/

SELECT
    job_via,
    COUNT(job_id) AS job_posts
FROM job_postings_fact
WHERE 
    job_work_from_home = TRUE
    AND job_title_short = 'Data Analyst'
    AND company_id IN (
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
GROUP BY job_via
HAVING COUNT(job_id) > 100
ORDER BY job_posts DESC;

/*

Here is the breakdown of the most popular job platforms for remote Data Analyst roles based on the top 100 companies:

    - LinkedIn Dominates: With 2,023 job postings, LinkedIn is by far the most popular platform used by top companies to post remote Data Analyst roles, 
      offering a wide range of opportunities.
    - Get.It Platform: Get.It follows with 219 job postings, demonstrating its strong presence as a job platform for remote positions.
    - ZipRecruiter and Indeed: ZipRecruiter and Indeed also show significant use, with 120 and 101 job postings, respectively, 
      highlighting their relevance in the job market for Data Analyst roles.
      
These platforms are essential resources for job seekers looking for remote Data Analyst opportunities.

RESULTS
=======

[
  {
    "job_via": "via LinkedIn",
    "job_posts": "2023"
  },
  {
    "job_via": "via Get.It",
    "job_posts": "219"
  },
  {
    "job_via": "via ZipRecruiter",
    "job_posts": "120"
  },
  {
    "job_via": "via Indeed",
    "job_posts": "101"
  }
]
*/