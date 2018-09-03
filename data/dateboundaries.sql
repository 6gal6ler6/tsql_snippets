/*--GET DATES DYNAMICALLY FOR DATA FILTERING--*/

----Last Day of Previous Month
SELECT CAST(DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,GETDATE()),0))AS DATE)
LastDay_PreviousMonth

----Last Day of Current Month
, CAST(DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,GETDATE())+1,0)) AS DATE)
LastDay_CurrentMonth
----Last Day of Next Month
, CAST(DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,GETDATE())+2,0)) AS DATE)
LastDay_NextMonth

--First Day of Previous Month
,CAST(DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 1, 0) AS DATE)
FirstDay_PreviousMonth

--First Day Current Month
,CAST(DATEADD(mm, DATEDIFF(mm, 0, GETDATE()), 0) AS DATE)
FirstDay_CurrentMonth
