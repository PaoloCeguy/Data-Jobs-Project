/*
Question: What skills are required for the top-paying data analyst jobs?
-Use the top 10 highest-paying Data Analyst jobs from first query
-Add the specific skills required for these roles
-Why? It provides a detailed look at which high-paying jobs demand certain skills,
    helping job seekers understand which skills to develop that align with top salaries
*/


WITH top_jobs as (
SELECT
    job_id,
    job_title,
    salary_year_avg,
    name as company_name
FROM
    job_postings_fact
LEFT JOIN company_dim on job_postings_fact.company_id = company_dim.company_id
where 
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10
)
SELECT
top_jobs.*,
skills
from top_jobs
  INNER JOIN skills_job_dim sjd ON top_jobs.job_id = sjd.job_id
  INNER JOIN skills_dim s ON sjd.skill_id = s.skill_id
ORDER BY 
salary_year_avg DESC