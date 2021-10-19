SELECT * FROM EMPLOYEES e ;


SELECT e.FIRST_NAME ,e.LAST_NAME ,e.DEPARTMENT_ID ,
	   d.DEPARTMENT_NAME , d.LOCATION_ID, l.CITY,
	   j.JOB_ID ,j.JOB_TITLE 
FROM EMPLOYEES e 
	INNER JOIN DEPARTMENTS d 
	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
	INNER JOIN LOCATIONS l 
	ON d.LOCATION_ID = l.LOCATION_ID 
--	                   l.city�� �ϸ� �� ������ ������
	INNER JOIN JOBS j 
	ON e.JOB_ID = j.JOB_ID 
--						
	WHERE l.CITY = 'Seattle'
;

SELECT * FROM DEPARTMENTS d ;
SELECT * FROM LOCATIONS l ;

SELECT * FROM JOBS j ;
-- inner join
-----------------------------------------

-- ��1. 30�� �μ��� ������� �̸�, ����(job_id), �μ����� ��� 
-- (employees , departments, jobs )
SELECT 	e.FIRST_NAME , e.JOB_ID , 
		d.DEPARTMENT_NAME , d.DEPARTMENT_ID,
		j.JOB_TITLE 		
FROM 	EMPLOYEES e 
	INNER JOIN DEPARTMENTS d 
	ON e.DEPARTMENT_ID  = d.DEPARTMENT_ID
	INNER JOIN JOBS j 
	ON j.JOB_ID  = e.JOB_ID 
WHERE d.DEPARTMENT_ID  = 30
;


-- ��2. Ŀ�̼��� �޴� ����� �̸�, ����, �μ���ȣ, �μ����� 
-- ����϶�(employees , departments )
SELECT 	e.FIRST_NAME , e.JOB_ID , 
		e.DEPARTMENT_ID , d.DEPARTMENT_NAME 
FROM 	EMPLOYEES e
	INNER JOIN DEPARTMENTS d 
	ON e.DEPARTMENT_ID  = d.DEPARTMENT_ID
WHERE e.COMMISSION_PCT IS NOT null	
;




-- ��3. ������ȣ 2500���� �ٹ��ϴ� ����� �̸�, ����, �μ���ȣ, �μ����� ����϶�
-- (employees , departments )
SELECT 	e.FIRST_NAME , e.JOB_ID , 
		e.DEPARTMENT_ID , d.DEPARTMENT_NAME 
FROM 	EMPLOYEES e
	INNER JOIN DEPARTMENTS d 
	ON e.DEPARTMENT_ID  = d.DEPARTMENT_ID
WHERE d.LOCATION_ID = 2500	
;



-- ��4. �̸��� A�� ���� ������� �̸��� �μ��̸��� ����϶�
-- %A%
-- (employees , departments )
SELECT 	e.FIRST_NAME , e.JOB_ID , 
		e.DEPARTMENT_ID , d.DEPARTMENT_NAME 
FROM 	EMPLOYEES e
	INNER JOIN DEPARTMENTS d 
	ON e.DEPARTMENT_ID  = d.DEPARTMENT_ID
WHERE e.FIRST_NAME LIKE '%A%'	
;


-- ��5. ����̸��� �� ����� ������ �̸��� ����϶�
-- (employees )
SELECT 	e.FIRST_NAME AS manager , e.EMPLOYEE_ID  AS manager_id, 
		e2.FIRST_NAME AS emp ,
		e2.EMPLOYEE_ID AS emp_id , e2.MANAGER_ID 
FROM 	EMPLOYEES e 
	INNER JOIN EMPLOYEES e2 
	ON e.EMPLOYEE_ID = e2.MANAGER_ID 
;


-- ��6. �޿��� 3000���� 5000������ ����� �̸��� �ҼӺμ��� ����϶�
-- (employees , departments )
SELECT 	e.FIRST_NAME , e.JOB_ID , 
		e.DEPARTMENT_ID , d.DEPARTMENT_NAME 
FROM 	EMPLOYEES e
	INNER JOIN DEPARTMENTS d 
	ON e.DEPARTMENT_ID  = d.DEPARTMENT_ID
WHERE e.SALARY BETWEEN 3000 AND 5000
;


-- ��7. �޿��� 3000 ������ ����� �̸��� �޿�, �ٹ����� ����϶�
-- (employees , departments, locations )
SELECT 	e.FIRST_NAME , e.SALARY , l.CITY 
FROM 	EMPLOYEES e
	INNER JOIN DEPARTMENTS d 
	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
	INNER JOIN LOCATIONS l 
	ON d.LOCATION_ID = l.LOCATION_ID 
WHERE e.SALARY <= 3000
;

-----------------------------------------------------------
------------ ��������

SELECT 	ROUND(AVG(SALARY))  
FROM 	EMPLOYEES e 
;

SELECT 	EMPLOYEE_ID , FIRST_NAME ,LAST_NAME 
FROM 	EMPLOYEES e
WHERE 	SALARY < 6462
;

-- where�� ������ �����Լ� ��� �Ұ�
SELECT 	EMPLOYEE_ID , FIRST_NAME ,LAST_NAME 
FROM 	EMPLOYEES e
WHERE 	SALARY < ROUND(AVG(SALARY))  
;

SELECT 	EMPLOYEE_ID , FIRST_NAME ,LAST_NAME 
FROM 	EMPLOYEES e
WHERE 	SALARY < (SELECT ROUND(AVG(SALARY))	FROM EMPLOYEES e2)
;

SELECT * FROM EMPLOYEES;


SELECT 	LOCATION_ID 
FROM 	LOCATIONS l
WHERE 	COUNTRY_ID = 'US'
;

SELECT * FROM LOCATIONS;

SELECT 	*
FROM 	DEPARTMENTS d
WHERE 	LOCATION_ID IN (1400, 1500, 1600, 1700)
;

SELECT 	*
FROM 	DEPARTMENTS d
WHERE 	LOCATION_ID IN (SELECT 	LOCATION_ID 
						FROM 	LOCATIONS l
						WHERE 	COUNTRY_ID = 'US')
;

-- EMPLOYEES ���̺��� Kochhar�� (last_name)�� 
-- �޿����� ���� ����� ������ �����ȣ, �̸�, ������, �޿��� ����϶�.

SELECT 	EMPLOYEE_ID , FIRST_NAME , JOB_ID , SALARY 
FROM 	EMPLOYEES e 
WHERE 	SALARY > (	SELECT	e2.SALARY 
					FROM 	EMPLOYEES e2
					WHERE 	LAST_NAME = 'Kochhar')
;

-- EMPLOYEES���̺��� ������ ���� ���� ����� first_name, last_name
SELECT  e.FIRST_NAME , e.LAST_NAME 
FROM 	EMPLOYEES e 
WHERE 	e.SALARY = ( SELECT min(SALARY) FROM EMPLOYEES e2 )
;

-- EMPLOYEES���̺��� ������ ���� ���� ����� 
-- first_name, last_name, job_title(jobs table)
SELECT  e.FIRST_NAME , e.LAST_NAME, j.JOB_TITLE 
FROM 	EMPLOYEES e 
	INNER JOIN JOBS j 
	ON e.JOB_ID  = j.JOB_ID 
WHERE 	e.SALARY = ( SELECT max(SALARY) FROM EMPLOYEES e2 )
;

-- ��� �޿����� ���� �޴� ������� first_name, last_name, job_title(jobs table)
SELECT  e.FIRST_NAME , e.LAST_NAME, j.JOB_TITLE 
FROM 	EMPLOYEES e 
	INNER JOIN JOBS j 
	ON e.JOB_ID  = j.JOB_ID 
WHERE 	e.SALARY > ( SELECT AVG(SALARY) FROM EMPLOYEES e2 )
;










