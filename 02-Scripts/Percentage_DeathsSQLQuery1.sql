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