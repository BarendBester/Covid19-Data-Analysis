-- Country with highest infection rate compared to population
SET ARITHABORT OFF;
SET ANSI_WARNINGS OFF;

SELECT location, population, MAX(total_cases) AS Highest_Infection_count, MAX((total_cases/population)*100) as PercentagePopInfected
FROM PortfolioProject..CovidDeaths
GROUP BY location, population
ORDER BY PercentagePopInfected DESC

-- Highest death count by country
-- where continent not empty
SELECT location, MAX(cast(total_deaths as int)) as TotalDeathCount
FROM PortfolioProject..CovidDeaths
WHERE continent <> ''
GROUP BY Location
ORDER BY TotalDeathCount DESC

SELECT location, MAX(cast(total_deaths as int)) as TotalDeathCount
FROM PortfolioProject..CovidDeaths
WHERE continent = ''
GROUP BY location
ORDER BY TotalDeathCount DESC

SELECT location, MAX(cast(total_deaths as int)) as TotalDeathCount
FROM PortfolioProject..CovidDeaths
WHERE continent <> ''
GROUP BY Location
ORDER BY TotalDeathCount DESC


-- Highest Death count by continent
SELECT continent, MAX(cast(total_deaths as int)) as TotalDeathCount
FROM PortfolioProject..CovidDeaths
WHERE continent <> ''
GROUP BY continent
ORDER BY TotalDeathCount DESC




