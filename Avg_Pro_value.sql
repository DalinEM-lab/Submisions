
---Create  table.
CREATE TABLE AUS_PostCodeSuburb
(
    postcode int NOT NULL,
    suburb nvarchar(255) NOT NULL,
    city nvarchar(255) NOT NULL,
    state nvarchar(255) NOT NULL,
    state_code nvarchar(5) NOT NULL,
    lat DECIMAL(9,6) NULL,     
    lon DECIMAL(9,6) NULL,    
    District nvarchar(100) NULL
);
select * from AUS_PostCodeSuburb
--Created Table -2
CREATE TABLE AUS_PostCodeSuburb
(
    postcode int NOT NULL,
    suburb nvarchar(255) NOT NULL,
    city nvarchar(255) NOT NULL,
    state nvarchar(255) NOT NULL,
    state_code nvarchar(5) NOT NULL,
    lat DECIMAL(9,6) NULL,     
    lon DECIMAL(9,6) NULL,    
    District nvarchar(100) NULL
);

---Find out the number of cities in each state.
SELECT DISTINCT city AS Cities,
COUNT (DISTINCT postcode) AS PostCodes, COUNT(DISTINCT suburb) AS Suburbs
FROM AUS_PostCodeSuburb
GROUP BY city
ORDER BY Cities;
--Unique postcodes Suburbs
SELECT DISTINCT city AS Cities,
COUNT (DISTINCT postcode) AS PostCodes, COUNT(DISTINCT suburb) AS Suburbs
FROM AUS_PostCodeSuburb
GROUP BY city
ORDER BY Cities;
-- Average Property Median Value by Suburb
SELECT Suburb,
	CAST(ROUND(AVG(Property_Median_Value), 2) AS DECIMAL(15,2)) AS Average_Property_Value
FROM  NSW_PropertyMedainValue#csv
GROUP BY Suburb
ORDER BY Average_Property_Value DESC;

--Average Property Median Value by Postcode
SELECT Postcode,
	CAST(ROUND(AVG(Property_Median_Value), 2) AS DECIMAL(15,2)) AS Average_Property_Value
FROM  NSW_PropertyMedainValue#csv
GROUP BY Postcode
ORDER BY Postcode ASC;
--Together
SELECT Suburb, Postcode ,
	CAST(ROUND(AVG(Property_Median_Value), 2) AS DECIMAL(15,2)) AS Average_Property_Value
FROM  NSW_PropertyMedainValue#csv
WHERE Property_Median_Value IS NOT NULL --Removed Null Values in Property_Median_Value
GROUP BY Suburb, Postcode
ORDER BY Suburb;