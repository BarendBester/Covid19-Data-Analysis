---- Max deaths by location
--SELECT location, MAX(cast(total_deaths as int)) as TotalDeathCount
--FROM PortfolioProject..CovidDeaths
--WHERE continent <> ''
--GROUP BY Location
--ORDER BY TotalDeathCount DESC

---- Max deaths by continent
--SELECT continent, MAX(cast(total_deaths as int)) as TotalDeathCount
--FROM PortfolioProject..CovidDeaths
--WHERE continent <> ''
--GROUP BY continent
--ORDER BY TotalDeathCount DESC

---- Creat Views for later Visualizations
---- To devide by zero
---- SET ARITHABORT OFF;
---- SET ANSI_WARNINGS OFF;
USE PortfolioProject
GO
CREATE VIEW PercentagePopulationVaccinated AS

SELECT death.continent, 
	death.location, 
	death.date, 
	death.population, 
	vacs.new_vaccinations,
	SUM(CAST(vacs.new_vaccinations as bigint)) OVER (Partition by death.location ORDER BY death.location, death.date) AS  RollingVaccinated
FROM PortfolioProject..CovidDeaths death
Join PortfolioProject..CovidVaccinations vacs
	ON death.location = vacs.location
	and death.date = vacs.date
WHERE death.continent <> ''

SELECT *
FROM PercentagePopulationVaccinated
