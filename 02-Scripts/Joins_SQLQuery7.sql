-- World totals
SELECT *
FROM PortfolioProject..CovidDeaths death
Join PortfolioProject..CovidVaccinations vacs
	ON death.location = vacs.location
	and death.date = vacs.date

