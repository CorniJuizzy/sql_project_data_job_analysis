# Introduction

This project uses SQL to analyze remote “Data Analyst” job market data, highlighting top countries, companies, platforms, and in-demand skills to provide valuable insights for job seekers.

SQL queries? Check them out here: [SQL_Project_Data_Job_Analysis](/SQL_Project_Data_Job_Analysis/)

# Background

This project was inspired by my goal to learn SQL and my interest in securing a remote Data Analyst position. I wanted to explore the countries, companies, and platforms with the most job opportunities an identify key skills for success. This information could also be valuable to others with similar career aspirations.

The analysis is based on a 2023 data jobs database from all around the world, from data analyst [Luke Barousse](https://www.youtube.com/@LukeBarousse).

### The questions i wanted to answer through my SQL queries where:

1. Which countries have the highest number of job postings for data analyst jobs?
2. Which countries have the highest proportion of remote data analyst jobs?
3. Which companies from those countries have the most job postings for remote data analyst jobs?
4. What are the most demanded skills for a remote data analyst job?
5. Which platforms are most frequently used for job postings?

# Tools I Used

For my deep dive into the remote data analyst job market, i harnessed the power of several key tools:

- **SQL**: The backbone of the whole analysis, it allowed me to query the database and unearth critical insights.
- **PostgreSQL**: One of the best database management system, it was a great opportunity to learn to use it.
- **Visual Studio Code**: The ideal enviroment to manage the database and executing SQL queries.
- **Git & GitHub**: Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

# The Analysis

Each query for this project aimed at investigating specific aspects of the remote data analyst job market. Here’s the breakdown of each question

### Top Countries for Data Analyst Job Postings of 2023

To assess the global distribution of Data Analyst job opportunities, I aggregated job postings by country. This query gives an overview of the countries with the highest number of Data Analyst job openings, helping identify global demand for the role.

```sql
SELECT 
    job_country,
    COUNT(job_id) AS job_postings
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY job_country
ORDER BY job_postings DESC;
```

Here is the breakdown of data analyst demand by country:

- **Top Demand in the U.S.**: The United States leads with 67,956 job postings, making it the top market for Data Analyst roles.
- **Strong European Presence**: France, the UK, and Germany show solid demand, reflecting Europe's competitive data analytics job market.
- **Emerging Markets**: Countries like Singapore, India, and Spain indicate growing Data Analyst job opportunities, both in developed and developing regions.
- **Global Reach**: Countries like the Philippines, Italy, and the Netherlands also show significant demand, demonstrating the worldwide expansion of the Data Analyst role.
- **Smaller but Growing Markets**: Nations like Malaysia and Canada are showing promising growth in data analytics job opportunities outside major markets.

![Query 1](readme_images\1_first_query.png)

> *Bar graph visualizing the job postings for the top 5 countries for data analyst job postings; Made with PowerBI*
> 

### Countries with Most Remote Data Analyst Jobs in 2023

To focus on remote opportunities, I filtered Data Analyst roles by location and work-from-home status. This query provides insight into the countries where the most remote Data Analyst jobs are availale, highlighting top regions for remote work.

```sql
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
```

Here is the breakdown of remote data analyst job opportunities by country

- **U.S. Leads Remote Roles**: The United States takes the lead with 5,106 remote job postings, securing its place as the top destination for remote Data Analyst positions.
- **India's Growing Remote Market**: India follows with 1,050 remote job postings, reflecting a strong trend toward remote work in the country.
- **Established European Hubs**: The UK and France also show significant numbers of remote positions, marking Western Europe as a key region for remote Data Analyst roles.
- **Southeast Asia's Rising Interest**: The Philippines and Spain are showing increasing preference for remote roles, with the Philippines emerging as a key remote job market.
- **Emerging Remote Markets**: Countries like Sudan, Germany, and Poland round out the top 10, showing diverse global interest in remote Data Analyst roles.

![Query 2](readme_images\2_second_query.png)

> *Bar graph visualizing the top 10 countries with the most remote data analyst job postings; Made with PowerBI*
> 

### Top Companies for Remote Data Analyst Jobs in 2023

To identify top companies offering remote Data Analyst positions, I joined job postings with company data and filtered by location and work-from-home status. This query helps pinpoint which companies are posting the most remote Data Analyst jobs in the top countries.

```sql
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
```

Here is the breakdown of companies offering remote data analyst jobs in top countries:

- **Top U.S. Companies**: Companies like "Get It Recruit - Information Technology" and "Dice" lead the way, reflecting the U.S.'s dominant role in offering remote Data Analyst opportunities.
- **India's Strong Market**: Companies like "SAZ India" and "Prometrics Solutions" are leading in India, highlighting the country's growing remote Data Analyst market.
- **UK and Philippines Presence**: Companies like "RemoteWorker UK" and "GrowthAssistant" in the UK and Philippines show their significant contributions to remote Data Analyst job postings.
- **Diverse Industries**: Various industries, including healthcare, technology, and finance, are represented, with companies such as "UnitedHealth Group" and "Talentify.io" providing remote job opportunities.

![Query 3](readme_images\3_third_query.png)

> Bar graph visualizing the top companies for remote data analyst jobs; Made with PowerBI
> 

### Most In-Demand Skills for Remote Data Analysts in 2023

To determine which platforms are offering the most remote Data Analyst roles, I filtered job postings by company and work-from-home status. This query reveals the job platforms based on job posting volume, providing insights into where to find the most opportunities.

```sql
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
```

![Query 4](readme_images\4_fourth_query.png)

> Table of the platforms companies use to post remote data analyst jobs; Made with PowerBI
> 

Here is the breakdown of job platforms for remote data analyst roles

- **LinkedIn's Dominance**: LinkedIn leads with 2,023 job postings, making it the most popular platform for remote Data Analyst roles.
- **Strong Competition**: Platforms like Get.It (219 job postings), ZipRecruiter (120), and Indeed (101) also show strong usage, reflecting their importance in the job market.
- **Key Job Resources**: These platforms are essential tools for job seekers looking for remote Data Analyst positions, providing a wide array of opportunities.

### Popular Platforms for Job Postings

To explore the most sought-after skills for remote Data Analyst positions, I joined job postings with skill data and filtered by location and remote status. This query highlights the most in-demand skills for remote roles, offering valuable information for Data Analysts looking to stay competitive in the field.

```sql
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
```

![Query 5](readme_images\5_fifth_query.png)

> Table of the most demanded skills for remote data analyst jobs; Made with PowerBI
> 

Here is the breakdown of in-demand skills for remote data analyst roles

- **Top Skills in SQL**: SQL tops the list with 1,422 job postings, making it the most sought-after skill for remote Data Analyst positions.
- **Excel and Python**: Excel (1,066 mentions) and Python (834 mentions) are critical for data analysis and manipulation tasks.
- **Popular Tools**: Tableau (762 mentions) and SAS (464 mentions) are important for data visualization and statistical analysis.
- **Growing Skills**: Skills like Power BI (453 mentions), R (422 mentions), and Go (328 mentions) are increasingly valued in remote roles.
- **Additional Skills**: Skills such as PowerPoint (183 mentions) and Oracle (154 mentions) highlight the importance of presenting and managing data efficiently.

# What I Learned

Through this project, I solidified the foundational skills of my SQL learning journey and gained valuable insights into data analysis and tool integration. Key takeaways include:

- **SQL Querying and Analysis**: I crafted queries to explore global demand for Data Analyst roles, remote work trends, top employers, job platforms, and sought-after skills. This improved my ability to extract, analyze, and interpret actionable insights from complex datasets.
- **Advanced SQL Techniques**: I honed my proficiency in using GROUP BY, ORDER BY, joins, and nested queries to perform in-depth analyses with efficiency and accuracy.
- **Seamless Tools Integration**: Leveraging PostgreSQL in conjunction with Visual Studio Code, I effectively managed the database and executed queries within a streamlined and connected environment, enhancing my workflow.

# Conclusions

### Insights

From the analysis, several key insights emerged:

- **Global Demand for Data Analyst Roles**: The United States leads the demand for data analyst positions, with over 67,000 job postings, while countries like France, the UK, and Germany highlight Europe's strong presence in the field. Emerging markets such as Singapore, India, and Spain are showing notable growth.
- **Remote Work Trends**: The United States dominates remote opportunities, with over 5,000 job postings, followed by India and the UK. Southeast Asia, including the Philippines, is emerging as a remote work hub for data analysts.
- **Top Employers Offering Remote Roles**: U.S.-based companies like "Get It Recruit" and "Dice" are leading providers of remote data analyst jobs. India and the UK also feature prominent employers embracing remote work culture.
- **Job Platforms for Data Analyst Roles**: LinkedIn stands out as the most popular platform for remote job postings, followed by Get.It, ZipRecruiter, and Indeed, making them essential resources for job seekers.
- **In-Demand Skills**: SQL is the most requested skill, appearing in over 1,400 job postings, followed by Excel, Python, and Tableau. Specialized tools like Power BI, R, and SAS are also highly valued, highlighting the diverse skill set required for data analyst roles.

### Closing Thoughts

This project provided a deeper understanding of the data analyst job market and solidified my SQL skills. The analysis underscores the importance of SQL as a foundational skill for aspiring data analysts, as well as the value of gaining proficiency in complementary tools and technologies like Python and Tableau.

By staying attuned to emerging trends and focusing on high-demand skills, data professionals can better align with market needs and unlock career opportunities in both local and remote job markets. Continuous learning and adaptability are crucial for thriving in the ever-evolving field of data analytics.
