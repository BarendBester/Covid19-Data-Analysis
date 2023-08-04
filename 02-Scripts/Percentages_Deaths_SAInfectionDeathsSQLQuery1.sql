SELECT *
FROM PortfolioProject..CovidDeaths
ORDER BY 3,4

--SELECT *
--FROM PortfolioProject..CovidVaccinations
--ORDER BY 3,4

-- Select data that we are going to use
SELECT location, date, total_cases, new_cases, total_deaths, population
FROM PortfolioProject..CovidDeaths
ORDER BY 1, 2

 --Look at Total cases vs deaths

SELECT location, date, total_cases, total_deaths, 
	CASE 
	WHEN total_cases > 0 AND total_deaths > 0 THEN (total_deaths/total_cases)*100
	ELSE NULL
	END AS Death_Percentage
FROM PortfolioProject..CovidDeaths
ORDER BY 1, 2



-- Total cases in South Africa
--SELECT location, date, total_cases, total_deaths, 
--	CASE 
--	WHEN total_cases > 0 AND total_deaths > 0 THEN (total_deaths/total_cases)*100
--	ELSE NULL
--	END AS Death_Percentage
--FROM PortfolioProject..CovidDeaths
--WHERE location like '%South Africa%'
--ORDER BY 1, 2

--SELECT location, date, total_cases, total_deaths, 
--	CASE 
--	WHEN total_cases > 0 AND total_deaths > 0 THEN (total_deaths/total_cases)*100
--	ELSE NULL
--	END AS Death_Percentage
--FROM PortfolioProject..CovidDeaths
--WHERE location like '%Germany%'
--ORDER BY 1, 2

--SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
--FROM PortfolioProject..CovidDeaths
--WHERE location like '%Germany%'
--ORDER BY 1, 2


SELECT location, date, total_cases, population, (total_cases/population)*100 as Percentage_Infected
FROM PortfolioProject..CovidDeaths
WHERE location like '%Germany%'
ORDER BY 1, 2

SET ARITHABORT OFF;
SET ANSI_WARNINGS OFF;

SELECT location, population, MAX(total_cases) AS Highest_Infection_count, MAX((total_cases/population)*100) 
	as PercentagePopInfected
FROM PortfolioProject..CovidDeaths
GROUP BY location, population
ORDER BY 1,2

-- Showing continet with highest death count
-- continent column is empty use not empty to get accurate group by
SELECT continent, MAX(cast(total_deaths as int)) AS TotalDeathCount
FROM PortfolioProject..CovidDeaths
WHERE continent <> ''
GROUP BY continent
ORDER BY TotalDeathCount DESC