/*
Question: Which countries have the highest proportion of remote Data Analyst jobs?
- Identify the top 10 countries with the most remote "Data Analyst" job postings.
- Focuses on remote opportunities, catering to the increasing demand for work-from-home roles.
- Why? Provides insights into countries leading in remote job opportunities for Data Analysts.
*/

SELECT 
    job_country,
    COUNT(job_id) AS job_postings
FROM job_postings_fact
WHERE 
    job_title_short = 'Data Analyst'
    AND job_work_from_home = TRUE
GROUP BY job_country
ORDER BY job_postings DESC
LIMIT 10;

/*
Here's the breakdown of the countries with the highest proportion of remote Data Analyst roles:

    - United States Dominates Remote Roles: With 5,106 remote job postings, the United States leads by a large margin, 
      solidifying its position as the top destination for remote Data Analyst opportunities.
    - India's Growing Remote Market: India follows with 1,050 remote Data Analyst jobs, reflecting a strong trend toward remote work in the country, 
      particularly in the tech and data sectors.
    - Established Remote Hubs in Europe: The United Kingdom and France have a significant share of remote positions, with 952 and 537 job postings, 
      respectively, indicating a steady demand for remote roles in Western Europe.
    - Southeast Asia Gaining Traction: The Philippines (606) and Spain (381) show a growing preference for remote Data Analyst roles, 
      with the Philippines emerging as a key player in remote job opportunities.
    - Emerging Remote Markets: Sudan (281), Germany (274), and Poland (268) round out the top 10, 
      demonstrating a diverse global interest in remote Data Analyst positions, even in regions with relatively smaller job markets.

RESULTS
=======
[
  {
    "job_country": "United States",
    "job_postings": "5106"
  },
  {
    "job_country": "India",
    "job_postings": "1050"
  },
  {
    "job_country": "United Kingdom",
    "job_postings": "952"
  },
  {
    "job_country": "Philippines",
    "job_postings": "606"
  },
  {
    "job_country": "France",
    "job_postings": "537"
  },
  {
    "job_country": "Canada",
    "job_postings": "507"
  },
  {
    "job_country": "Spain",
    "job_postings": "381"
  },
  {
    "job_country": "Sudan",
    "job_postings": "281"
  },
  {
    "job_country": "Germany",
    "job_postings": "274"
  },
  {
    "job_country": "Poland",
    "job_postings": "268"
  }
]
*/
