--List the names of the columns in CovidDeaths and CovidVaccinations
PRAGMA table_info(CovidDeaths);
PRAGMA table_info(CovidVaccinations);

--Find the percentages of deaths among the diagnosed patients in Europe sorted by date
SELECT Continent, Location, date, total_cases as TotalCases, cast(total_deaths as int) as TotalDeaths,
 cast( total_deaths as int)*100.0/total_cases
as PercentageDeath FROM CovidDeaths WHERE Continent is 'Europe' ORDER BY 3 asc;


--Percentages of deaths among the diagnosed patients in the  countries in Europe when countries are sorted in descending order by percentage deaths in the population
SELECT Continent, Location, MAX(total_cases) as TotalCases, MAX(cast(total_deaths as int)) as TotalDeaths, MAX(cast( total_deaths as int))*100.0/MAX(total_cases)
as PercentageDeath FROM CovidDeaths  WHERE Continent is 'Europe' GROUP By Location
ORDER BY 5 desc;

--Percentage of infected people over time in Europe sorted by location and date
SELECT location, date, total_cases as TotalCases, population, total_cases*100.0/population as PercentageInfected
FROM CovidDeaths WHERE Continent is 'Europe'
ORDER BY 1,2 asc;
 
--The percentage of infected people in the countries in  Europe where countries are sorted in descending order by the percentage of infected people in the population
SELECT continent, location,MAX(total_cases) as TotalCases, MAX(Population) as Population ,MAX(total_cases)*100.0/MAX(population) as PercentageInfected
FROM CovidDeaths WHERE Continent is 'Europe' Group by Location
ORDER BY 5 desc;
 
--Highest death and infection counts in countries
SELECT continent, location, MAX(cast(total_deaths as int)) as MaxTotalDeaths, Max(total_cases) as MaxTotalCases
FROM CovidDeaths Where Continent is not null Group by Location ;

--Death and infection percentages of continents
SELECT continent, MAX(total_cases) as TotalCases, MAX(cast(total_deaths as int)) as TotalDeaths, population,
 MAX(total_cases)*100.0/MAX(population) as PercentInfection, MAX(cast(total_deaths as int))*100.0/MAX(total_cases) as
PercentDeath
FROM CovidDeaths WHERE Continent is not null  Group by Continent  ;

--Total new cases, deaths, and death percentage of new cases over the time
SELECT date, SUM(new_cases) as total_new_cases, SUM(cast(new_deaths as int)) as  total_new_deaths,  SUM(new_deaths)*100/SUM(new_cases)
as DeathPercentageOfNewCases
FROM CovidDeaths where continent is not null
group by date
order by 1,2;
--Time evolution of vaccinated people in the population
--Join the two datasets via location and date
With PopulationvsVaccination (Continent, Location, Date, Population,  New_Vaccinations, PeopleVaccinated,PercentVaccinated)
 as
 (
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(CAST(vac.new_vaccinations as int)) OVER (PARTITION BY dea.location Order by dea.location, dea.date) as PeopleVaccinated,
(SUM(CAST(vac.new_vaccinations as int)) OVER (PARTITION BY dea.location Order by dea.location, dea.date))*100.0/dea.population as PercentVaccinated
FROM CovidDeaths dea 
JOIN CovidVaccinations vac 
On dea.location = vac.location 
and dea.date = vac.date 
where dea.continent is not null 
)
SELECT * FROM PopulationvsVaccination;

--Creating a view for visualization purposes
Create View PercentPopulationVaccinated as
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(CAST(vac.new_vaccinations as int)) OVER (PARTITION BY dea.location Order by dea.location, dea.date) as PeopleVaccinated,
(SUM(CAST(vac.new_vaccinations as int)) OVER (PARTITION BY dea.location Order by dea.location, dea.date))*100.0/dea.population as PercentVaccinated
FROM CovidDeaths dea 
JOIN CovidVaccinations vac 
On dea.location = vac.location 
and dea.date = vac.date 
where dea.continent is not null ;



