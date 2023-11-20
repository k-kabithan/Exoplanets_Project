# Exoplanets_Project
Data Cleaning and Exploration using SQL, Data Visualisation using Tableau
Tableau Visualisation : https://public.tableau.com/app/profile/kabithan/viz/ExoplanetDashboard6_0/ExoplanetsDashboard

The exoplanet dataset contains information on planets outside of our solar system. The data includes, the year of discovery, detection method, mass and radius based on Jupiter and Earth, and other various properties. The dataset was used to explore the distribution of exoplanets by detection method and year of discovery. Visualisations were created to show what type of exoplanets have the potential to support life based on their mass and radius, the type of exoplanets discovered by detection method, and the number of exoplanets discovered every year between 1992-2022. The insights gained from the dataset can be used for further research and discovery in the field of astronomy.

For the sake of expanding my skills and exploring the world of data, I decided to create a custom API using Python. The focus was to seamlessly retrieve data on confirmed exoplanets from the NASA Exoplanet Archive website. While the website provides the option to download tables in common formats like CSV and XLSX, I saw an opportunity to challenge myself by developing a solution for data extraction. The project began with the goal of automating the retrieval process, allowing for a more dynamic and customisable approach to obtaining the data. Leveraging Python's capabilities, I developed an API that interacts with the Exoplanet Archive's Table Access Protocol (TAP) service. This not only facilitated the retrieval of data but also provided the flexibility to filter and structure the data according to my specific analytical needs.

Since the data file requested using Python was quite large, I faced constraints in uploading the entire dataset to GitHub. To address this, I uploaded a portion of the data to demonstrate how the raw data looked like, "pscomppars_data sample.csv", and then proceeded to manually clean it, "new_exoplanets_5347.xlsx". I focused on including only the columns needed for my analysis, aligning them with the default columns available on the official data page of the NASA Exoplanet Archive website at 'https://exoplanetarchive.ipac.caltech.edu/cgi-bin/TblView/nph-tblView?app=ExoTbls&config=PSCompPars'.

SQL was then used for an in-depth analysis and exploration. Additionally, I utilised the extracted dataset in Tableau, to derive meaningful insights and visually represent patterns within the exoplanetary data.
