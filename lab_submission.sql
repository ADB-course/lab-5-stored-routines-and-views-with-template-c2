-- (i) A Procedure called PROC_LAB5
DELIMITER $$

CREATE PROCEDURE PROC_LAB5(IN custNumber INT)
BEGIN
    SELECT 
        c.customerName AS 'Customer Name',
        c.phone AS 'Customer Phone',
        c.city AS 'City',
        SUM(p.amount) AS 'Total Payments'
    FROM 
        customers c
    JOIN 
        payments p ON c.customerNumber = p.customerNumber
    WHERE 
        c.customerNumber = custNumber
    GROUP BY 
        c.customerNumber;
END $$

DELIMITER ;


-- (ii) A Function called FUNC_LAB5
DELIMITER $$

CREATE FUNCTION FUNC_LAB5(officeCode INT) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE totalSalary DECIMAL(10,2);
    
    SELECT 
        SUM(e.salary) 
    INTO 
        totalSalary
    FROM 
        employees e
    WHERE 
        e.officeCode = officeCode;
    
    RETURN totalSalary;
END $$

DELIMITER ;


-- (iii) A View called VIEW_LAB5
CREATE VIEW VIEW_LAB5 AS
SELECT 
    c.customerNumber AS 'Customer ID',
    c.customerName AS 'Customer Name',
    o.city AS 'Office City',
    o.country AS 'Office Country',
    SUM(p.amount) AS 'Total Payments'
FROM 
    customers c
JOIN 
    payments p ON c.customerNumber = p.customerNumber
JOIN 
    offices o ON c.salesRepEmployeeNumber = o.officeCode
GROUP BY 
    c.customerNumber, o.city, o.country;
