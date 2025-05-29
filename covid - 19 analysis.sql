-- COVID Dashboard SQL Queries
-- File: covid_dashboard_queries.sql
-- Validated basic syntax and structure

-- Query 1: Map - Total deaths by state
SELECT 
    State, 
    TotalDeaths
FROM 
    COVID_Deaths_By_State
ORDER BY 
    TotalDeaths DESC;

-- Validation: Check if table exists
-- SELECT COUNT(*) FROM information_schema.tables WHERE table_name = 'COVID_Deaths_By_State';


-- Query 2: Age group details
SELECT 
    AgeGroup, 
    COUNT(*) AS NumberOfCases, 
    (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM COVID_Cases)) AS Percentage
FROM 
    COVID_Cases
GROUP BY 
    AgeGroup
ORDER BY 
    Percentage DESC;

-- Validation: Check if AgeGroup column exists
-- SELECT column_name FROM information_schema.columns WHERE table_name = 'COVID_Cases' AND column_name = 'AgeGroup';


-- Query 3: COVID cases by State (Confirmed, Cured, Deaths over time)
SELECT 
    Date, 
    State_Union_Territory, 
    SUM(Confirmed) AS TotalConfirmed, 
    SUM(Cured) AS TotalCured, 
    SUM(Deaths) AS TotalDeaths
FROM 
    COVID_Daily_Cases
GROUP BY 
    Date, State_Union_Territory
ORDER BY 
    Date, State_Union_Territory;

-- Validation: Check if required columns exist
-- SELECT column_name FROM information_schema.columns WHERE table_name = 'COVID_Daily_Cases' AND column_name IN ('Date', 'State_Union_Territory', 'Confirmed', 'Cured', 'Deaths');


-- Query 4: Doses administrated (by vaccine type)
SELECT 
    VaccineType, 
    SUM(DosesAdministered) AS TotalDoses
FROM 
    Vaccine_Administration
GROUP BY 
    VaccineType
ORDER BY 
    TotalDoses DESC;

-- Validation: Check if VaccineType values match expected types
-- SELECT DISTINCT VaccineType FROM Vaccine_Administration;


-- Query 5: First v/s Second dose administered
SELECT 
    DoseType, 
    SUM(DosesCount) AS TotalDoses
FROM 
    Vaccine_Dose_Details
GROUP BY 
    DoseType;

-- Validation: Check expected dose types
-- SELECT DISTINCT DoseType FROM Vaccine_Dose_Details;


-- Query 6: ICMR testing lab (Count of labs by State)
SELECT 
    State, 
    COUNT(LabName) AS CountOfLab
FROM 
    ICMR_Testing_Labs
GROUP BY 
    State
ORDER BY 
    CountOfLab DESC;

-- Validation: Check if table exists
-- SELECT COUNT(*) FROM information_schema.tables WHERE table_name = 'ICMR_Testing_Labs';


-- Query 7: State Wise testing details (Negative, Positive, Total Samples)
SELECT 
    State, 
    SUM(NegativeTests) AS TotalNegative, 
    SUM(PositiveTests) AS TotalPositive, 
    SUM(TotalSamples) AS TotalSamples
FROM 
    COVID_Testing_Details
GROUP BY 
    State
ORDER BY 
    TotalSamples DESC;

-- Validation: Check if testing metrics columns exist
-- SELECT column_name FROM information_schema.columns WHERE table_name = 'COVID_Testing_Details' AND column_name IN ('NegativeTests', 'PositiveTests', 'TotalSamples');