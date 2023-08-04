

-- To devide by zero
SET ARITHABORT OFF;
SET ANSI_WARNINGS OFF;

-- Global numbers - sum of new cases worldwide
SELECT date, 
	SUM(CAST(new_cases as int)) AS NewInfected,  
	SUM(CAST(new_deaths as int)) AS NewDeaths, 
	SUM(CAST(new_deaths as float))/SUM(CAST(new_cases as float))*100 AS PercentageDeaths 
FROM PortfolioProject..CovidDeaths
WHERE continent <> ''
GROUP BY date
ORDER BY 1,2 


-- World totals
SELECT 
	SUM(CAST(new_cases as int)) AS NewInfected,  
	SUM(CAST(new_deaths as int)) AS NewDeaths, 
	SUM(CAST(new_deaths as float))/SUM(CAST(new_cases as float))*100 AS PercentageDeaths 
FROM PortfolioProject..CovidDeaths
WHERE continent <> ''
ORDER BY 1,2 

