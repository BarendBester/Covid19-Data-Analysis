-- Total population vs vaccination
-- using cast

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
ORDER BY 1,2,3

-- use convert to do the same

SELECT death.continent, 
	death.location, 
	death.date, 
	death.population, 
	vacs.new_vaccinations,
	SUM(CONVERT(bigint, vacs.new_vaccinations)) OVER (Partition by death.location)

FROM PortfolioProject..CovidDeaths death
Join PortfolioProject..CovidVaccinations vacs
	ON death.location = vacs.location
	and death.date = vacs.date
WHERE death.continent <> ''
ORDER BY 1,2,3


