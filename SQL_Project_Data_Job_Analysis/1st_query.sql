/*
Question: Which countries have the highest demand for Data Analysts?
- Identify the total number of "Data Analyst" job postings per country.
- Focuses on understanding global demand for the role across all job 
  postings.
- Why? Helps uncover key markets for Data Analysts, highlighting regions 
  with significant opportunities.
*/

SELECT 
    job_country,
    COUNT(job_id) AS job_postings
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY job_country
ORDER BY job_postings DESC
LIMIT 10;

/*
Here's the breakdown of the demand for Data Analyst roles by country:

    - Top Demand in the United States: The United States leads by a significant margin with 67,956 job postings, 
      highlighting its status as the primary market for Data Analyst positions.
    - Strong European Presence: France, the United Kingdom, and Germany have notable demand, with 13,855, 10,509, and 7,141 job postings, respectively, 
      reflecting a diverse and competitive job market for Data Analysts in Europe.
    - Emerging Markets: Countries like Singapore (6,642), India (6,133), and Spain (5,182) are showing growing demand for Data Analysts, 
      indicating emerging job opportunities in both developed and developing regions.
    - Global Expansion: Nations such as the Philippines, Italy, and the Netherlands round out the top 10 with over 4,000 job postings each, 
      emphasizing the global reach and increasing demand for data talent worldwide.
    - Smaller but Growing Markets: Several countries with fewer job postings, such as Malaysia (2,528) and Canada (2,382), also present opportunities, 
      showing growth in data analytics roles outside of the major markets.

RESULTS
=======
[
  {
    "job_country": "United States",
    "job_postings": "67956"
  },
  {
    "job_country": "France",
    "job_postings": "13855"
  },
  {
    "job_country": "United Kingdom",
    "job_postings": "10509"
  },
  {
    "job_country": "Germany",
    "job_postings": "7141"
  },
  {
    "job_country": "Singapore",
    "job_postings": "6642"
  },
  {
    "job_country": "India",
    "job_postings": "6133"
  },
  {
    "job_country": "Spain",
    "job_postings": "5182"
  },
  {
    "job_country": "Philippines",
    "job_postings": "4770"
  },
  {
    "job_country": "Italy",
    "job_postings": "4570"
  },
  {
    "job_country": "Netherlands",
    "job_postings": "4126"
  },
  {
    "job_country": "Portugal",
    "job_postings": "4014"
  },
  {
    "job_country": "Belgium",
    "job_postings": "3840"
  },
  {
    "job_country": "Poland",
    "job_postings": "3179"
  },
  {
    "job_country": "Mexico",
    "job_postings": "2816"
  },
  {
    "job_country": "Ireland",
    "job_postings": "2762"
  },
  {
    "job_country": "United Arab Emirates",
    "job_postings": "2601"
  },
  {
    "job_country": "South Africa",
    "job_postings": "2537"
  },
  {
    "job_country": "Malaysia",
    "job_postings": "2528"
  },
  {
    "job_country": "Canada",
    "job_postings": "2382"
  },
  {
    "job_country": "Switzerland",
    "job_postings": "2348"
  },
  {
    "job_country": "Hong Kong",
    "job_postings": "2279"
  },
  {
    "job_country": "Austria",
    "job_postings": "2196"
  },
  {
    "job_country": "Sudan",
    "job_postings": "1774"
  },
  {
    "job_country": "Australia",
    "job_postings": "1660"
  },
  {
    "job_country": "Costa Rica",
    "job_postings": "1619"
  },
  {
    "job_country": "Colombia",
    "job_postings": "1595"
  },
  {
    "job_country": "Thailand",
    "job_postings": "1480"
  },
  {
    "job_country": "Chile",
    "job_postings": "1434"
  },
  {
    "job_country": "Argentina",
    "job_postings": "1280"
  },
  {
    "job_country": "Denmark",
    "job_postings": "1055"
  },
  {
    "job_country": "Peru",
    "job_postings": "1017"
  },
  {
    "job_country": "Czechia",
    "job_postings": "988"
  },
  {
    "job_country": "Sweden",
    "job_postings": "943"
  },
  {
    "job_country": "Israel",
    "job_postings": "916"
  },
  {
    "job_country": "Romania",
    "job_postings": "910"
  },
  {
    "job_country": "Saudi Arabia",
    "job_postings": "863"
  },
  {
    "job_country": "Hungary",
    "job_postings": "645"
  },
  {
    "job_country": "Brazil",
    "job_postings": "604"
  },
  {
    "job_country": "Luxembourg",
    "job_postings": "562"
  },
  {
    "job_country": "Kenya",
    "job_postings": "551"
  },
  {
    "job_country": "New Zealand",
    "job_postings": "543"
  },
  {
    "job_country": "Egypt",
    "job_postings": "527"
  },
  {
    "job_country": "Greece",
    "job_postings": "495"
  },
  {
    "job_country": "Qatar",
    "job_postings": "476"
  },
  {
    "job_country": "Ukraine",
    "job_postings": "471"
  },
  {
    "job_country": "Indonesia",
    "job_postings": "461"
  },
  {
    "job_country": "Puerto Rico",
    "job_postings": "414"
  },
  {
    "job_country": "Finland",
    "job_postings": "390"
  },
  {
    "job_country": "Japan",
    "job_postings": "382"
  },
  {
    "job_country": "Lithuania",
    "job_postings": "344"
  },
  {
    "job_country": "Vietnam",
    "job_postings": "338"
  },
  {
    "job_country": "South Korea",
    "job_postings": "335"
  },
  {
    "job_country": "Morocco",
    "job_postings": "316"
  },
  {
    "job_country": "Kuwait",
    "job_postings": "315"
  },
  {
    "job_country": "Taiwan",
    "job_postings": "310"
  },
  {
    "job_country": "Nigeria",
    "job_postings": "305"
  },
  {
    "job_country": "Panama",
    "job_postings": "283"
  },
  {
    "job_country": "Bulgaria",
    "job_postings": "274"
  },
  {
    "job_country": "Pakistan",
    "job_postings": "259"
  },
  {
    "job_country": "China",
    "job_postings": "252"
  },
  {
    "job_country": "Norway",
    "job_postings": "228"
  },
  {
    "job_country": "Cyprus",
    "job_postings": "228"
  },
  {
    "job_country": "Uruguay",
    "job_postings": "226"
  },
  {
    "job_country": "Russia",
    "job_postings": "204"
  },
  {
    "job_country": "Slovakia",
    "job_postings": "195"
  },
  {
    "job_country": "Serbia",
    "job_postings": "193"
  },
  {
    "job_country": "Malta",
    "job_postings": "191"
  },
  {
    "job_country": "Turkey",
    "job_postings": "186"
  },
  {
    "job_country": "Jordan",
    "job_postings": "169"
  },
  {
    "job_country": "Ecuador",
    "job_postings": "158"
  },
  {
    "job_country": "Tunisia",
    "job_postings": "152"
  },
  {
    "job_country": "Sri Lanka",
    "job_postings": "140"
  },
  {
    "job_country": "Mauritius",
    "job_postings": "129"
  },
  {
    "job_country": "Estonia",
    "job_postings": "125"
  },
  {
    "job_country": "Belarus",
    "job_postings": "125"
  },
  {
    "job_country": "Dominican Republic",
    "job_postings": "118"
  },
  {
    "job_country": "Lebanon",
    "job_postings": "116"
  },
  {
    "job_country": "Uganda",
    "job_postings": "103"
  },
  {
    "job_country": "Bahrain",
    "job_postings": "84"
  },
  {
    "job_country": "Guatemala",
    "job_postings": "82"
  },
  {
    "job_country": "Latvia",
    "job_postings": "79"
  },
  {
    "job_country": "Kazakhstan",
    "job_postings": "76"
  },
  {
    "job_country": "Croatia",
    "job_postings": "72"
  },
  {
    "job_country": "Ghana",
    "job_postings": "68"
  },
  {
    "job_country": "Moldova",
    "job_postings": "65"
  },
  {
    "job_country": "Bangladesh",
    "job_postings": "64"
  },
  {
    "job_country": "Guam",
    "job_postings": "61"
  },
  {
    "job_country": "Senegal",
    "job_postings": "61"
  },
  {
    "job_country": "U.S. Virgin Islands",
    "job_postings": "59"
  },
  {
    "job_country": "Namibia",
    "job_postings": "57"
  },
  {
    "job_country": "El Salvador",
    "job_postings": "57"
  },
  {
    "job_country": "Jamaica",
    "job_postings": "52"
  },
  {
    "job_country": "Ethiopia",
    "job_postings": "45"
  },
  {
    "job_country": "Réunion",
    "job_postings": "44"
  },
  {
    "job_country": "Nepal",
    "job_postings": "43"
  },
  {
    "job_country": "Iraq",
    "job_postings": "40"
  },
  {
    "job_country": "Uzbekistan",
    "job_postings": "39"
  },
  {
    "job_country": "Zambia",
    "job_postings": "39"
  },
  {
    "job_country": "Albania",
    "job_postings": "38"
  },
  {
    "job_country": "Oman",
    "job_postings": "36"
  },
  {
    "job_country": "Slovenia",
    "job_postings": "35"
  },
  {
    "job_country": "Zimbabwe",
    "job_postings": "33"
  },
  {
    "job_country": "Armenia",
    "job_postings": "32"
  },
  {
    "job_country": "Nicaragua",
    "job_postings": "29"
  },
  {
    "job_country": "Macedonia (FYROM)",
    "job_postings": "28"
  },
  {
    "job_country": "Cambodia",
    "job_postings": "22"
  },
  {
    "job_country": "Azerbaijan",
    "job_postings": "22"
  },
  {
    "job_country": "Rwanda",
    "job_postings": "22"
  },
  {
    "job_country": "Algeria",
    "job_postings": "22"
  },
  {
    "job_country": "Honduras",
    "job_postings": "20"
  },
  {
    "job_country": "Tanzania",
    "job_postings": "19"
  },
  {
    "job_country": "Venezuela",
    "job_postings": "17"
  },
  {
    "job_country": "Myanmar",
    "job_postings": "16"
  },
  {
    "job_country": "Trinidad and Tobago",
    "job_postings": "15"
  },
  {
    "job_country": "Côte d'Ivoire",
    "job_postings": "15"
  },
  {
    "job_country": "Paraguay",
    "job_postings": "15"
  },
  {
    "job_country": "Mongolia",
    "job_postings": "14"
  },
  {
    "job_country": "Malawi",
    "job_postings": "11"
  },
  {
    "job_country": "Haiti",
    "job_postings": "11"
  },
  {
    "job_country": "Bosnia and Herzegovina",
    "job_postings": "11"
  },
  {
    "job_country": "Suriname",
    "job_postings": "10"
  },
  {
    "job_country": null,
    "job_postings": "10"
  },
  {
    "job_country": "Iceland",
    "job_postings": "10"
  },
  {
    "job_country": "Cameroon",
    "job_postings": "9"
  },
  {
    "job_country": "Afghanistan",
    "job_postings": "9"
  },
  {
    "job_country": "Benin",
    "job_postings": "8"
  },
  {
    "job_country": "Kyrgyzstan",
    "job_postings": "8"
  },
  {
    "job_country": "Botswana",
    "job_postings": "8"
  },
  {
    "job_country": "Bahamas",
    "job_postings": "7"
  },
  {
    "job_country": "Liberia",
    "job_postings": "7"
  },
  {
    "job_country": "Cayman Islands",
    "job_postings": "6"
  },
  {
    "job_country": "Tajikistan",
    "job_postings": "6"
  },
  {
    "job_country": "Barbados",
    "job_postings": "5"
  },
  {
    "job_country": "Burkina Faso",
    "job_postings": "5"
  },
  {
    "job_country": "Guadeloupe",
    "job_postings": "5"
  },
  {
    "job_country": "Montenegro",
    "job_postings": "5"
  },
  {
    "job_country": "Bolivia",
    "job_postings": "5"
  },
  {
    "job_country": "Congo, Democratic Republic of the",
    "job_postings": "5"
  },
  {
    "job_country": "Somalia",
    "job_postings": "5"
  },
  {
    "job_country": "Mozambique",
    "job_postings": "5"
  },
  {
    "job_country": "Togo",
    "job_postings": "5"
  },
  {
    "job_country": "Yemen",
    "job_postings": "4"
  },
  {
    "job_country": "Fiji",
    "job_postings": "4"
  },
  {
    "job_country": "Mali",
    "job_postings": "3"
  },
  {
    "job_country": "Libya",
    "job_postings": "3"
  },
  {
    "job_country": "Gambia",
    "job_postings": "3"
  },
  {
    "job_country": "Northern Mariana Islands",
    "job_postings": "3"
  },
  {
    "job_country": "Palestine",
    "job_postings": "3"
  },
  {
    "job_country": "Brunei",
    "job_postings": "3"
  },
  {
    "job_country": "Papua New Guinea",
    "job_postings": "3"
  },
  {
    "job_country": "Djibouti",
    "job_postings": "2"
  },
  {
    "job_country": "Angola",
    "job_postings": "2"
  },
  {
    "job_country": "Laos",
    "job_postings": "2"
  },
  {
    "job_country": "Madagascar",
    "job_postings": "2"
  },
  {
    "job_country": "Guyana",
    "job_postings": "2"
  },
  {
    "job_country": "Guinea",
    "job_postings": "1"
  },
  {
    "job_country": "Maldives",
    "job_postings": "1"
  },
  {
    "job_country": "Bhutan",
    "job_postings": "1"
  }
]
*/