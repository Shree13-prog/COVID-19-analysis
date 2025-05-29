-- Query 1: Total deaths by state
SELECT State, TotalDeaths
FROM COVID_Deaths_By_State
ORDER BY TotalDeaths DESC;

-- Query 2: Age group details
SELECT AgeGroup, COUNT(*) AS NumberOfCases, 
       (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM COVID_Cases)) AS Percentage
FROM COVID_Cases
GROUP BY AgeGroup
ORDER BY Percentage DESC;

-- Query 3: COVID cases by State (Confirmed, Cured, Deaths over time)
SELECT Date, State_Union_Territory, 
       SUM(Confirmed) AS TotalConfirmed, 
       SUM(Cured) AS TotalCured, 
       SUM(Deaths) AS TotalDeaths
FROM COVID_Daily_Cases
GROUP BY Date, State_Union_Territory
ORDER BY Date, State_Union_Territory;

-- Query 4: Doses administrated (by vaccine type)
SELECT VaccineType, SUM(DosesAdministered) AS TotalDoses
FROM Vaccine_Administration
GROUP BY VaccineType
ORDER BY TotalDoses DESC;

-- Query 5: First v/s Second dose administered
SELECT DoseType, SUM(DosesCount) AS TotalDoses
FROM Vaccine_Dose_Details
GROUP BY DoseType;

-- Query 6: ICMR testing lab (Count of labs by State)
SELECT State, COUNT(LabName) AS CountOfLab
FROM ICMR_Testing_Labs
GROUP BY State
ORDER BY CountOfLab DESC;

-- Query 7: State Wise testing details (Negative, Positive, Total Samples)
SELECT State, 
       SUM(NegativeTests) AS TotalNegative, 
       SUM(PositiveTests) AS TotalPositive, 
       SUM(TotalSamples) AS TotalSamples
FROM COVID_Testing_Details
GROUP BY State
ORDER BY TotalSamples DESC;