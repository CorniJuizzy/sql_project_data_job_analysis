/*
Question: Which companies in the top 10 countries have the most remote Data Analyst job postings?
- Identify the top 100 companies offering the highest number of remote "Data Analyst" jobs in the top 10 countries.
- Focuses on companies within the countries identified in the previous query.
- Why? Helps pinpoint leading companies hiring for remote Data Analyst roles, offering actionable insights for job seekers.
*/

SELECT 
    c.name AS company_name,
    j.job_country,
    COUNT(j.job_id) AS job_postings
FROM job_postings_fact j
LEFT JOIN company_dim c 
ON j.company_id = c.company_id
WHERE 
    j.job_work_from_home = TRUE
    AND job_title_short = 'Data Analyst'
    AND job_country IN (
        SELECT 
            job_country
        FROM job_postings_fact
        WHERE 
            job_work_from_home = TRUE
            AND job_title_short = 'Data Analyst'
        GROUP BY job_country
        ORDER BY COUNT(job_id) DESC
        LIMIT 10
    )
GROUP BY c.name, j.job_country
ORDER BY job_postings DESC
LIMIT 100;

/*
Here's the breakdown of the companies in the top 10 countries with the most remote Data Analyst job postings:

    - Leading U.S. Companies: "Get It Recruit - Information Technology" stands out with 483 remote Data Analyst roles, 
      followed by "Dice" with 250 postings. Many U.S.-based companies, including "Robert Half" (82) and "Insight Global" (67), 
        demonstrate the country's dominant role in offering remote job opportunities.
    - India's Strong Presence: In India, "SAZ India" leads with 55 remote Data Analyst postings, followed by "Prometrics Solutions" (45), 
      marking India as a significant player in remote Data Analyst roles, with many companies embracing remote work.
    - Growing Remote Market in the UK and Philippines: The United Kingdom and the Philippines feature companies like 
      "RemoteWorker UK" (32) and "GrowthAssistant" (32) leading the charge for remote job opportunities in data analytics.
    - Diverse Industry Players: A variety of industries are represented, including healthcare, technology, finance, and staffing, 
      with companies like "UnitedHealth Group" (32), "Coders Data" (27), and "Talentify.io" (21) catering to remote Data Analyst roles.

RESULTS
=======
[
  {
    "company_name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "job_postings": "483"
  },
  {
    "company_name": "Dice",
    "job_country": "United States",
    "job_postings": "250"
  },
  {
    "company_name": "Robert Half",
    "job_country": "United States",
    "job_postings": "82"
  },
  {
    "company_name": "Insight Global",
    "job_country": "United States",
    "job_postings": "67"
  },
  {
    "company_name": "Get It Recruit - Finance",
    "job_country": "United States",
    "job_postings": "56"
  },
  {
    "company_name": "SAZ India",
    "job_country": "India",
    "job_postings": "55"
  },
  {
    "company_name": "Prometrics Solutions",
    "job_country": "India",
    "job_postings": "45"
  },
  {
    "company_name": "GrowthAssistant",
    "job_country": "Philippines",
    "job_postings": "32"
  },
  {
    "company_name": "RemoteWorker UK",
    "job_country": "United Kingdom",
    "job_postings": "32"
  },
  {
    "company_name": "Talentify.io",
    "job_country": "United States",
    "job_postings": "32"
  },
  {
    "company_name": "UnitedHealth Group",
    "job_country": "United States",
    "job_postings": "32"
  },
  {
    "company_name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "job_postings": "30"
  },
  {
    "company_name": "The Judge Group",
    "job_country": "United States",
    "job_postings": "30"
  },
  {
    "company_name": "Get It Recruit - Transportation",
    "job_country": "United States",
    "job_postings": "28"
  },
  {
    "company_name": "Patterned Learning AI",
    "job_country": "United States",
    "job_postings": "27"
  },
  {
    "company_name": "Coders Data",
    "job_country": "United States",
    "job_postings": "27"
  },
  {
    "company_name": "Ovidtech Technologies",
    "job_country": "India",
    "job_postings": "23"
  },
  {
    "company_name": "Talentify.io",
    "job_country": "Sudan",
    "job_postings": "23"
  },
  {
    "company_name": "Aston Carter",
    "job_country": "United States",
    "job_postings": "22"
  },
  {
    "company_name": "Talentify.io",
    "job_country": "Canada",
    "job_postings": "21"
  },
  {
    "company_name": "Cyberbacker Careers",
    "job_country": "Philippines",
    "job_postings": "20"
  },
  {
    "company_name": "Crossover",
    "job_country": "Philippines",
    "job_postings": "20"
  },
  {
    "company_name": "Upwork",
    "job_country": "United States",
    "job_postings": "18"
  },
  {
    "company_name": "Genesis10",
    "job_country": "United States",
    "job_postings": "18"
  },
  {
    "company_name": "Catchafire",
    "job_country": "United States",
    "job_postings": "17"
  },
  {
    "company_name": "Crossover",
    "job_country": "United States",
    "job_postings": "17"
  },
  {
    "company_name": "Harnham",
    "job_country": "United States",
    "job_postings": "17"
  },
  {
    "company_name": "Career Shepherd",
    "job_country": "Philippines",
    "job_postings": "16"
  },
  {
    "company_name": "Motion Recruitment",
    "job_country": "United States",
    "job_postings": "16"
  },
  {
    "company_name": "AKS ProTalent",
    "job_country": "India",
    "job_postings": "16"
  },
  {
    "company_name": "Harnham",
    "job_country": "United Kingdom",
    "job_postings": "15"
  },
  {
    "company_name": "Jobot",
    "job_country": "United States",
    "job_postings": "15"
  },
  {
    "company_name": "Insight Global",
    "job_country": "Sudan",
    "job_postings": "15"
  },
  {
    "company_name": "Elevance Health",
    "job_country": "United States",
    "job_postings": "15"
  },
  {
    "company_name": "Randstad Technologies",
    "job_country": "United States",
    "job_postings": "14"
  },
  {
    "company_name": "Insight Global",
    "job_country": "Canada",
    "job_postings": "14"
  },
  {
    "company_name": "INSIDEA",
    "job_country": "India",
    "job_postings": "13"
  },
  {
    "company_name": "Apex Systems",
    "job_country": "United States",
    "job_postings": "13"
  },
  {
    "company_name": "Wipro",
    "job_country": "India",
    "job_postings": "13"
  },
  {
    "company_name": "Pattern Learning AI - Career & Tech Recruitment Reimagined!",
    "job_country": "United States",
    "job_postings": "13"
  },
  {
    "company_name": "KARL STORZ Endoscopy - America",
    "job_country": "United States",
    "job_postings": "13"
  },
  {
    "company_name": "Support Shepherd",
    "job_country": "Philippines",
    "job_postings": "13"
  },
  {
    "company_name": "RIT Solutions, Inc.",
    "job_country": "United States",
    "job_postings": "12"
  },
  {
    "company_name": "Recruin",
    "job_country": "India",
    "job_postings": "12"
  },
  {
    "company_name": "Arsenault",
    "job_country": "United States",
    "job_postings": "12"
  },
  {
    "company_name": "Upwork",
    "job_country": "Sudan",
    "job_postings": "12"
  },
  {
    "company_name": "Stanford University",
    "job_country": "United States",
    "job_postings": "12"
  },
  {
    "company_name": "SAIC",
    "job_country": "United States",
    "job_postings": "12"
  },
  {
    "company_name": "Idealmet Technologies",
    "job_country": "India",
    "job_postings": "12"
  },
  {
    "company_name": "Ascension",
    "job_country": "United States",
    "job_postings": "11"
  },
  {
    "company_name": "Kforce Technology Staffing",
    "job_country": "United States",
    "job_postings": "11"
  },
  {
    "company_name": "Peroptyx",
    "job_country": "Germany",
    "job_postings": "11"
  },
  {
    "company_name": "Carrefour",
    "job_country": "France",
    "job_postings": "11"
  },
  {
    "company_name": "Peroptyx",
    "job_country": "France",
    "job_postings": "11"
  },
  {
    "company_name": "BNP Paribas",
    "job_country": "France",
    "job_postings": "11"
  },
  {
    "company_name": "Synchrony",
    "job_country": "India",
    "job_postings": "11"
  },
  {
    "company_name": "Workoo Technologies",
    "job_country": "United States",
    "job_postings": "11"
  },
  {
    "company_name": "Experian",
    "job_country": "United States",
    "job_postings": "11"
  },
  {
    "company_name": "Shine",
    "job_country": "United States",
    "job_postings": "11"
  },
  {
    "company_name": "Aditi Consulting",
    "job_country": "United States",
    "job_postings": "11"
  },
  {
    "company_name": "MultiplyMii",
    "job_country": "Philippines",
    "job_postings": "10"
  },
  {
    "company_name": "Get It Recruit - Real Estate",
    "job_country": "United States",
    "job_postings": "10"
  },
  {
    "company_name": "MedTourEasy",
    "job_country": "India",
    "job_postings": "10"
  },
  {
    "company_name": "University of Texas at Austin",
    "job_country": "United States",
    "job_postings": "10"
  },
  {
    "company_name": "TELUS International AI Data Solutions",
    "job_country": "Spain",
    "job_postings": "10"
  },
  {
    "company_name": "Dice",
    "job_country": "Sudan",
    "job_postings": "10"
  },
  {
    "company_name": "Ace Technologies",
    "job_country": "United States",
    "job_postings": "10"
  },
  {
    "company_name": "SupportNinja",
    "job_country": "Philippines",
    "job_postings": "10"
  },
  {
    "company_name": "NeenOpal Inc.",
    "job_country": "India",
    "job_postings": "9"
  },
  {
    "company_name": "Get.It Recruit - Administrative",
    "job_country": "United States",
    "job_postings": "9"
  },
  {
    "company_name": "Centene Corporation",
    "job_country": "United States",
    "job_postings": "9"
  },
  {
    "company_name": "Unite Career Solutions",
    "job_country": "India",
    "job_postings": "9"
  },
  {
    "company_name": "Modis",
    "job_country": "United States",
    "job_postings": "9"
  },
  {
    "company_name": "TELUS International",
    "job_country": "Spain",
    "job_postings": "9"
  },
  {
    "company_name": "IDR, Inc.",
    "job_country": "United States",
    "job_postings": "9"
  },
  {
    "company_name": "TEKsystems",
    "job_country": "United States",
    "job_postings": "9"
  },
  {
    "company_name": "Peroptyx",
    "job_country": "Canada",
    "job_postings": "9"
  },
  {
    "company_name": "Capita",
    "job_country": "United Kingdom",
    "job_postings": "9"
  },
  {
    "company_name": "atSistemas",
    "job_country": "Spain",
    "job_postings": "9"
  },
  {
    "company_name": "GP Strategies Corporation",
    "job_country": "Poland",
    "job_postings": "8"
  },
  {
    "company_name": "NLB Services",
    "job_country": "United States",
    "job_postings": "8"
  },
  {
    "company_name": "Veeva Systems",
    "job_country": "Germany",
    "job_postings": "8"
  },
  {
    "company_name": "Get It Recruit - Marketing",
    "job_country": "United States",
    "job_postings": "8"
  },
  {
    "company_name": "Peroptyx",
    "job_country": "Philippines",
    "job_postings": "8"
  },
  {
    "company_name": "Rayden Interactive",
    "job_country": "India",
    "job_postings": "8"
  },
  {
    "company_name": "Veeva Systems Inc.",
    "job_country": "United States",
    "job_postings": "8"
  },
  {
    "company_name": "Actalent",
    "job_country": "United States",
    "job_postings": "8"
  },
  {
    "company_name": "Get It Recruit - Administrative",
    "job_country": "United States",
    "job_postings": "8"
  },
  {
    "company_name": "Thales",
    "job_country": "France",
    "job_postings": "8"
  },
  {
    "company_name": "Bouygues Telecom",
    "job_country": "France",
    "job_postings": "8"
  },
  {
    "company_name": "Braintrust",
    "job_country": "United States",
    "job_postings": "8"
  },
  {
    "company_name": "Team Remotely Inc",
    "job_country": "United States",
    "job_postings": "8"
  },
  {
    "company_name": "CyberCoders",
    "job_country": "United States",
    "job_postings": "8"
  },
  {
    "company_name": "Infosys",
    "job_country": "India",
    "job_postings": "8"
  },
  {
    "company_name": "TechFetch.com - On Demand Tech Workforce hiring platform",
    "job_country": "United States",
    "job_postings": "8"
  },
  {
    "company_name": "The Fountain Group",
    "job_country": "United States",
    "job_postings": "8"
  },
  {
    "company_name": "Beacon Hill Staffing Group",
    "job_country": "United States",
    "job_postings": "8"
  },
  {
    "company_name": "Swoon",
    "job_country": "United States",
    "job_postings": "8"
  },
  {
    "company_name": "Experis",
    "job_country": "United States",
    "job_postings": "8"
  },
  {
    "company_name": "CVS Health",
    "job_country": "United States",
    "job_postings": "8"
  }
]
*/