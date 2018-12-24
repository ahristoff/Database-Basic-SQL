USE SoftUni

SELECT top(5) e.EmployeeId, e.JobTitle, e.AddressID, a.AddressText FROM Employees AS e
JOIN Addresses AS a
ON a.AddressID = e.AddressID 
ORDER BY a.AddressID

