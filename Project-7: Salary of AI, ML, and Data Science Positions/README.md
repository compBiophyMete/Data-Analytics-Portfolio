The dataset contains salary information for AI, ML, and Data Science positions. The utilized dataset was obtained from https://www.kaggle.com/datasets/lorenzovzquez/data-jobs-salaries on Oct 27, 2023. 

The original source is available at https://ai-jobs.net/salaries/download/ with the public domain under CC0. 

This dataset anonymously shows salary information from professionals all over the world in the AI, ML, and Data Science space. 

The dataset consists of the following columns:
* work_year: the year the salary was paid
* experience_level: the experience level in the job during the year with the following possible values: EN (Entry-level/Junior), MI (Mid-level/Intermediate), SE (Senior-level/Expert), EX (Executive-level/Director)
* employment_type: the type of employment for the role: PT (part-time), FT (full-time), CT (contract), FL (freelance)
* job_title: the role worked in during the year
* salary: the total gross salary amount paid
* salary_currency: the currency of the salary paid as an ISO 4217 currency code
* salary_in_usd: the salary in USD (FX rate divided by avg. USD rate of the respective year) via statistical data from the BIS and central banks
* employee_residence: employee's primary country of residence in during the work year as an ISO 3166 country code.
* remote_ratio: the overall amount of work done remotely, possible values are as follows: 0 (on-site), 50 (hybird), 100 (fully-remote)
* company_location: the country of the employer's main office or contracting branch as an ISO 3166 country code.
* company_size: the average number of people that worked for the company during the year: S (less than 50 employees), M (50-250 employees), L (more than 250 employees)


Herein, we set out to extract following information from the dataset via SQL.

1. Number of full-time, part-time, contract-based, and freelancer positions in AI, ML, and Data Science according to the employment type by countries
2. Number of on-site, hybrid, and fully-remote jobs
3. Number of companies based on large-, medium-, and small-sized companies
4. Average salaries  ($) of jobs
5. Average salaries ($) among the countries
6. Average salaries ($) of companies depending on their sizes
7. Average salaries of entry-, mid-, senior, and executive-level positions when only the full-time contracts are considered.

Based on the extracted information, in Dashboard#1, a glimpse into positions in AI, ML, and Data Science was provided.  The number of positions in the world, the number of jobs by employment type, the top 10 countries with the highest number of job positions by company size, and the number of job positions by remote ratio were instructively visualized.

On the other hand, Dashboard#2 provides an insight into average reported salaries in the world, time-evolution of the average reported salaries for full-time contracts by experience, average reported salaries by employment type and company size, and the top 10 best paid job positions.
