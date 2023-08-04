-- To devide by zero
SET ARITHABORT OFF;
SET ANSI_WARNINGS OFF;



--Temp Table
DROP TABLE if exists #PercentPopulationVaccinated
CREATE TABLE #PercentPopulationVaccinated
(
	Continent nvarchar(255),
	Location nvarchar(255),
	Date datetime,
	Population bigint,
	new_vaccinations bigint,
	RollingVaccinated float
)
INSERT INTO #PercentPopulationVaccinated
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
--ORDER BY 2,3

SELECT *, (RollingVaccinated/population)*100 AS PercentageVaccinated
FROM #PercentPopulationVaccinated 