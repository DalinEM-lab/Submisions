
---Finding invalid data
SELECT 
    Suburb,
    COUNT(*) as Occurrence_Count
FROM NSW_PropertyMedainValue#csv
WHERE 
    -- Check for numeric-only suburbs
    Suburb LIKE '%[0-9]%' AND Suburb NOT LIKE '%[^0-9]%'
    OR
    -- Check for special characters (only letters, spaces, hyphens, apostrophes allowed)
    Suburb LIKE '%[^a-zA-Z0-9 ''-]%'
    OR
    -- Check for excessive length
    LEN(Suburb) > 50
    OR
    -- Check for very short entries
    LEN(Suburb) < 3
GROUP BY Suburb
ORDER BY Occurrence_Count DESC;

---Finding Null Values ina column
SELECT 
    DISTINCT Suburb,
    CASE 
        WHEN Suburb IS NULL THEN 'NULL_FOUND'
        --ELSE 'NOT_NULL'
    END AS Null_Check
FROM NSW_PropertyMedainValue#csv;

SELECT 
    CASE 
        WHEN EXISTS (SELECT 1 FROM NSW_PropertyMedainValue#csv WHERE Suburb IS NULL) 
        THEN 'YES - NULL VALUES FOUND' 
        ELSE 'NO - NO NULL VALUES' 
    END AS Has_Null_Suburbs;

	SELECT 
    CASE 
        WHEN EXISTS (SELECT 1 FROM NSW_PropertyMedainValue#csv WHERE "City/Town"  IS NULL) 
        THEN 'YES - NULL VALUES FOUND' 
        ELSE 'NO - NO NULL VALUES' 
    END AS Has_Null_Cities;