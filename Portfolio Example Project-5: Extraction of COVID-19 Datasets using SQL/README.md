The dataset, which represents the daily new confirmed COVID-19 deaths per million people between January 28, 2020, and April 30, 2021, was retrieved from https://ourworldindata.org/covid-deaths. 

For the preparation of the 'Covid19deaths.csv', the population column was inserted into column E in the obtained dataset. Subsequently, all the columns after Z were deleted.

The columns between E and Z were deleted from the original dataset and saved as 'Covidvac.csv'.

Herein, we set out to investigate the following points by analyzing the 'Covid19deaths.csv' and 'Covid19vac.csv' files in SQL:

*  The percentages of deaths among the diagnosed patients in Europe sorted by the date
* The percentages of deaths among the diagnosed patients in the  countries in Europe when countries are sorted in descending order by percentage deaths in the population
* The percentage of infected people over time in Europe sorted by location and date
* The percentage of infected people in the countries in  Europe where countries are sorted in descending order by the percentage of infected people in the population
* The highest death and infection counts in countries
* The death and infection percentages of continents
* The total new cases, deaths, and death percentage of new cases over the time
* The time evolution of vaccinated people in the population
