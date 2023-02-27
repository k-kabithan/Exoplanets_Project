Select *
From exoplanet..exo_planets
Order by name
------------------------- add columns---------------------------
Alter Table exoplanet..exo_planets
ADD mass_kg FLOAT; 

Alter Table exoplanet..exo_planets
ADD radius_km FLOAT; 

Select *
From exoplanet..exo_planets
Order by name
------------------------- populate mass column---------------------------
Select *
From exoplanet..exo_planets
Order by name

Select mass_multiplier, mass_wrt, mass_kg
From exoplanet..exo_planets

UPDATE exoplanet..exo_planets
Set mass_kg = mass_multiplier * (1.898 * POWER(CAST(10 as float), 27))
WHERE mass_wrt = 'Jupiter'

UPDATE exoplanet..exo_planets
Set mass_kg = mass_multiplier * (5.972 * POWER(CAST(10 as float), 24))
WHERE mass_wrt = 'Earth'

Select mass_multiplier, mass_wrt, mass_kg
From exoplanet..exo_planets
------------------------- populate radius column---------------------------
Select *
From exoplanet..exo_planets
Order by name

Select radius_multiplier, radius_wrt, radius_km
From exoplanet..exo_planets

UPDATE exoplanet..exo_planets
Set radius_km = radius_multiplier * (69911)
WHERE radius_wrt = 'Jupiter'

UPDATE exoplanet..exo_planets
Set radius_km = radius_multiplier * (6371)
WHERE radius_wrt = 'Earth'
---------------------------------------------------------------------------
Select *
From exoplanet..exo_planets
Order by name

--------------------Planets by Mass-------------------------

Select COUNT(*) as NumPlanets, AVG(mass_kg) as AvgMass, MIN(mass_kg) as MinMass, MAX(mass_kg) as MaxMass
From exoplanet..exo_planets
Where mass_kg is not null

--------------------Planets by Distance from Sun (lightyears)-------------------------

Select distance
From exoplanet..exo_planets
where distance is null

Select COUNT(*) as NumPlanets, AVG(distance) as AvgDistance, MIN(distance) as MinDistance, MAX(distance) as MaxDistance
From exoplanet..exo_planets
Where distance is not null

--------------------distribution of exoplanet depending on discovery year and method-------------------------
Select name, planet_type, discovery_year, detection_method
From exoplanet..exo_planets
Order by name

--Shows the most common detected planet type between 1992-2023 in desc order
Select COUNT(planet_type) as CommonOccurance, planet_type
From exoplanet..exo_planets
Group by planet_type
Order by CommonOccurance desc;

--show the distribution of planet types for each year and detection method, with the number of exoplanets discovered for each combination
--can analyse how the distribution of planet types has changed over time and how it varies depending on the detection method used
Select COUNT(*) AS detected_planets, planet_type, discovery_year, detection_method
From exoplanet..exo_planets
Group by planet_type, discovery_year, detection_method
Order by discovery_year, planet_type, detected_planets desc;

--------------------distribution of exoplanet masses and radii depending on the type of planet and method-------------------------

Select name, mass_kg, radius_km, planet_type, detection_method
From exoplanet..exo_planets
Order by name

Select Count(*) as count, AVG(mass_kg) AvgMass, AVG(radius_km) as AvgRadius, planet_type, detection_method
From exoplanet..exo_planets
Group by planet_type, detection_method
Order by planet_type, detection_method;

-------------------improvement in detection method from 1992-2023------------------------------------------

Select detection_method, discovery_year, Count(*) as detected
From exoplanet..exo_planets
Group by detection_method, discovery_year
Order by discovery_year asc;

-------------------------------------------------------------VIEWS-----------------------------------------------------

Select detection_method
From exoplanet..exo_planets
where detection_method is null

-------------------------------------------------------------VIEW 1----------------------------------------------------

Create View exoplanet_mass_vs_orbital_radius_redo As
Select mass_kg, orbital_radius, planet_type, detection_method
From exoplanet..exo_planets
Where orbital_radius is not null
And mass_kg is not null
-------------------------------------------------------------VIEW 2----------------------------------------------------

Create View exoplanet_discovery_method_by_year As
Select discovery_year, detection_method, planet_type, COUNT(*) as exo_discovered
From exoplanet..exo_planets
Group by planet_type, detection_method, discovery_year
Order by discovery_year, detection_method

-------------------------------------------------------------VIEW 3----------------------------------------------------

Create View exoplanet_types_by_detection_method As
Select detection_method,
	COUNT(Case When planet_type = 'Neptune-like' Then 1 Else Null End) As neptunelike,
	COUNT(Case When planet_type = 'Gas Giant' Then 1 Else Null End) As gasgiants,
	COUNT(Case When planet_type = 'Super Earth' Then 1 Else Null End) As superearths,
	COUNT(Case When planet_type = 'Terrestrial' Then 1 Else Null End) As terrestrials
From exoplanet..exo_planets
Group by detection_method
ORDER BY detection_method


-------------------------------------------------------------VIEW 4----------------------------------------------------

Create View exoplanet_total_mass_by_type_of_exoplanets As
SELECT planet_type, SUM(mass_kg) AS total_mass
FROM exoplanet..exo_planets
Where mass_kg is not null
GROUP BY planet_type

-------------------------------------------------------------VIEW 5----------------------------------------------------

Create View exoplanet_mass_vs_orbital_radius_redo_multiplier As
Select name, mass_kg, discovery_year, radius_km, planet_type, detection_method
From exoplanet..exo_planets
Where orbital_radius is not null
And mass_kg is not null

SELECT *
FROM exoplanet..exo_planets

