/*1. Display all information in the tables EMP and DEPT ? */
CREATE DATABASE HR;
USE HR;

/* 2. Display the names and salaries of all employees with a salary greater than 2000 ? */
SELECT* FROM EMPLOYEES_1 SALARY WHERE SALARY > "2000";  

/*3. Display only the hire date and employee name for each employee ? */
SELECT* FROM EMPLOYEES_1 ORDER BY HIRE_DATE AND FIRST;

/*4. Display the hire date, name and department number for all clerks.? */
SELECT FIRST_NAME, HIRE_DATE, DEPARTMENT_ID FROM EMPLOYEES_1;

/*5.Create a query to display all the data from the EMP table. Separate each column by a
comma. Name the column THE OUTPUT ?*/	
SELECT * FROM EMPLOYEES_1;
ALTER TABLE EMPLOYEES_1 ADD COLUMN THE_OUTPUT INT AFTER DEPARTMENT_ID;

/*6. Display the names and dates of employees with the column headers "Name" and "Start
Date" ? */
SELECT EMPLOYEE_ID AS "NAME" , HIRE_DATE AS "STRATDATE" FROM EMPLOYEES_1;

/*7. Display the names and hire dates of all employees in the order they were hired.? */ 
SELECT EMPLOYEE_ID ,HIRE_DATE FROM EMPLOYEES_1 WHERE HIRE_DATE;

/*8. Display the names and salaries of all employees in reverse salary order.?*/  
SELECT REVERSE(FIRST_NAME) AND (SALARY) FROM EMPLOYEES_1;

/*9. Display 'ename" and "deptno" who are all earned commission and display salary in
reverse order.? */ 
SELECT EMPLOYEE_ID , DEPARTMENT_ID ,COMMISSION_PCT FROM EMPLOYEES_1 WHERE REVERSE (SALARY);

/*10. Display the last name and job title of all employees who do not have a manager? */ 
SELECT LAST_NAME, JOB_ID FROM EMPLOYEES_1 WHERE NOT MANAGER_ID;

/*11. Display the last name, job, and salary for all employees whose job is sales representative
or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000 ? */
SELECT LAST_NAME, JOB_ID, SALARY FROM EMPLOYEES_1 WHERE JOB_ID NOT IN ("2500","3500","5000");

/*1) Display the maximum, minimum and average salary and commission earned.*/ 
SELECT MIN(SALARY)FROM EMPLOYEES_1;
SELECT MAX(SALARY)FROM EMPLOYEES_1;
SELECT AVG(SALARY) FROM EMPLOYEES_1;
SELECT COUNT(SALARY) FROM EMPLOYEES_1;
SELECT  * FROM EMPLOYEES_1 WHERE  COMMISSION_PCT ;

/*2) Display the department number, total salary payout and total commission payout for
each department.*/
SELECT DEPARTMENT_ID, SUM(SALARY) FROM EMPLOYEES_1 GROUP BY DEPARTMENT_ID;
SELECT COMMISSION_PCT FROM EMPLOYEES_1;

/*3) Display the department number and number of employees in each department. */ 
SELECT  DEPARTMNET_ID ,COUNT(*) FROM EMPLOYEES_1 GROUP BY DEPARTMENT_ID;
ALTER TABLE EMPLOYEES_1 ADD COLUMN DEPARTMENT VARCHAR(20) AFTER DEPARTMENT_ID;


/*4) Display the department number and total salary of employees in each department.*/
SELECT SUM(SALARY) FROM EMPLOYEES_1;
SELECT * FROM EMPLOYEES_1 WHERE DEPARTMENT_ID;

/*5) Display the employee's name who doesn't earn a commission. Order the result set
without using the column name ?*/
SELECT FIRST_NAME , LAST_NAME AS  FIRST_NAME, SALARY FROM EMPLOYEES_1 WHERE COMMISSION_PCT IS NULL;

/*6) Display the employees name, department id and commission. If an Employee doesn't
earn the commission, then display as 'No commission'. Name the columns appropriately? */
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID,
CASE 
  WHEN (COMMISSION_PCT) THEN (SELECT(COMMISSION_PCT)
  FROM EMPLOYEES_1)
ELSE COMMISSION_PCT
END  AS " NO COMMISSION" FROM EMPLOYEES_1; 

/*7) Display the employee's name, salary and commission multiplied by 2. If an Employee
doesn't earn the commission, then display as 'No commission. Name the columns
appropriately?*/
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID,
CASE 
WHEN (COMMISSION_PCT*2)>0 THEN (SELECT(COMMISSION_PCT*2)   
FROM EMPLOYEES_1)
ELSE "NO COMMISSION"
END  FROM EMPLOYEES;

/*8) Display the sum of salaries of the employees working under each Manager?*/
SELECT MANAGER_ID, SUM(SALARY) FROM EMPLOYEES_1
GROUP BY MANAGER_ID;

/*9) Select the Managers name, the count of employees working under and the department
ID of the manager. ?*/
SELECT COUNT(EMPLOYEE_ID), COUNT(DEPARTMENT_ID) FROM EMPLOYEES_1;

/*10) Select the employee name, department id, and the salary. Group the result with the
manager name and the employee last name should have second letter 'a! ? */
 SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES_1 WHERE LAST_NAME  LIKE "_A%" ; 
 
 /*11) Display the average of sum of the salaries and group the result with the department id.
Order the result with the department id. ? */
SELECT DEPARTMENT_ID, AVG(SALARY) AS AVG_SALARY 
FROM EMPLOYEES_1
GROUP BY DEPARTMENT_ID 
ORDER BY DEPARTMENT_ID;


/*12) Display the commission, if not null display 10% of salary, if null display a default value 1*/
SELECT EMPLOYEE_ID, COMMISSION_PCT, 
CASE 
WHEN  COMMISSION_PCT=0.00 THEN '1'
ELSE 0.10*SALARY
END AS SALARY FROM EMPLOYEES_1;

/*1. Write a query that displays the employee's last names only from the string's 2-5th
position with the first letter capitalized and all other letters lowercase, Give each column an
appropriate label. */
SELECT  LAST_NAME,CONCAT(UCASE(SUBSTR(LAST_NAME,2,1)),LCASE(SUBSTR(LAST_NAME,3,3)))
FROM EMPLOYEES_1;

/*2 .Write a query that displays the employee's first name and last name along with a " in
between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the
month on which the employee has joined?*/

SELECT FIRST_NAME , LAST_NAME,  CONCAT_WS("-",FIRST_NAME,LAST_NAME)AS EMPLOYEE_ID , DATE_FORMAT(HIRE_DATE,"%M")
AS HIRE_MONTH FROM EMPLOYEES_1;


/*3. Write a query that displays the employee's last names with the first letter capitalized and
all other letters lowercase, and the length of the names, for all employees whose name
starts with J, A, or M. Give each column an appropriate label. Sort the results by the
employees' last names ?*/
SELECT LAST_NAME "NAME", LENGTH(LAST_NAME) "LENGTH" FROM EMPLOYEES_1
WHERE  LAST_NAME LIKE "J%"
OR LAST_NAME LIKE "A%"
OR LAST_NAME LIKE "M%" ORDER BY LAST_NAME;

/*4. Create a query to display the last name and salary for all employees. Format the salary to
be 15 characters long, left-padded with $. Label the column SALARY ?*/ 
SELECT LAST_NAME, SALARY ,CONCAT(SALARY,  '15 ', '$',(FORMAT(SALARY,15)) ) SALARY FROM EMPLOYEES_1;

/*5. Display First names of all employees with initcaps.*/
SELECT CONCAT(UCASE(SUBSTR(FIRST_NAME,1,1)),LCASE(SUBSTR(FIRST_NAME,2))) AS INITCAP_NAME FROM EMPLOYEES_1;

/*6. Extract first letter from First Name column and append it with the Last Name. Also add
"@systechusa.com" at the end. Name the column as e-mail address. All characters should
be in lower case. Display this along with their First Name.*/  
SELECT FIRST_NAME ,LAST_NAME ,LCASE(CONCAT(SUBSTR(FIRST_NAME,1,1),LAST_NAME,"@systechusa.com")) AS EMAIL_ADDRESS 
FROM EMPLOYEES_1; 
/*7. Display the names and job titles of all employees with the same job as Trenna.*/
SELECT CONCAT_WS(",", FIRST_NAME, LAST_NAME) AS FULL_NAME ,JOB_ID FROM EMPLOYEES_1
WHERE JOB_ID IN
(SELECT JOB_ID FROM EMPLOYEES_1 WHERE FIRST_NAME ='TRENNA');

/*8. Display the name of the employee whose salary is the lowest ?*/
 SELECT * FROM EMPLOYEES_1 WHERE SALARY= (SELECT MIN(SALARY) FROM EMPLOYEES_1);
 
 
/*9. Display the names of all employees except the lowest paid.*/
SELECT CONCAT_WS("",  FIRST_NAME, LAST_NAME )AS FULL_NAME 
FROM EMPLOYEES_1
WHERE SALARY NOT IN (SELECT MIN(SALARY) FROM EMPLOYEES_1);

  
/*10. Display the employee last name and department name of all employees who have an 'a'
in their last name ?*/
SELECT * FROM EMPLOYEES_1 WHERE LAST_NAME   LIKE "%A";

/*11. Create a query that displays employees last name,department number,and all the
employees who work in the same department as a given employee. */
SELECT LAST_NAME , DEPARTMENT_ID FROM EMPLOYEES_1
WHERE EMPLOYEE_ID = DEPARTMENT_ID ;

/*12. Display the employee last name and employee number along with their manager's last
name and manager number. */
SELECT LAST_NAME ,EMPLOYEE_ID, MANAGER_ID,FIRST_NAME FROM EMPLOYEES_1 ;
 
 /*13. Create a query to display the employee numbers and last names of all employees who
earn more than the average salary. Sort the results in ascending order of salary. */
SELECT EMPLOYEE_ID , LAST_NAME 
FROM EMPLOYEES_1
 WHERE  SALARY>(SELECT AVG(SALARY) FROM EMPLOYEES_1)
 ORDER BY SALARY;
 
 /*14. Display the last name and salary of every employee who reports to FILLMORE*/
 SELECT EMPLOYEE_ID , LAST_NAME 
 FROM EMPLOYEES_1
 WHERE  FIRST_NAME = "NEENA";
 
 /*15. Write a query to display the top three earners in the EMPLOYEES table. Display their last
names and salaries.*/ 
SELECT EMPLOYEE_ID ,LAST_NAME , SALARY
FROM EMPLOYEES_1 ORDER  BY SALARY DESC
LIMIT 5;

/*16. Display the names of all employees with their salary and commission earned. Employees
with a null commission should have O in the commission column*/
SELECT FIRST_NAME,LAST_NAME ,SALARY,
CASE
WHEN COMMISSION_PCT IS NULL THEN '0'
ELSE COMMISSION_PCT 
END AS COMMISSION 
FROM EMPLOYEES_1;
