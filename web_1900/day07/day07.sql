-- ��1. EMPLOYEES ���̺��� (�޿��� ���)���� ���� �����
-- �����ȣ, �̸�, ������, �޿�, �μ���ȣ�� ����϶�

SELECT 	e.EMPLOYEE_ID , e.FIRST_NAME, e.JOB_ID ,
		e.SALARY , e.DEPARTMENT_ID 
FROM 	EMPLOYEES e 
WHERE 	SALARY  < (SELECT AVG(SALARY) FROM EMPLOYEES e2)
;

-- ��2. EMPLOYEES ���̺��� (100�� �μ��� 
-- �ּ� �޿����� �ּ� �޿�)�� ���� �ٸ� ��� �μ��� ����϶�
SELECT 	DEPARTMENT_ID, MIN(SALARY) 
FROM 	EMPLOYEES e 
GROUP BY DEPARTMENT_ID
HAVING MIN(SALARY) > (	SELECT 	min(SALARY) 
						FROM 	EMPLOYEES e2
						WHERE 	DEPARTMENT_ID = 100)
;						


-- ��3. EMPLOYEES ���̺��� (���� ���� ���)�� ���� 
-- Manager�� �����ȣ�� ����϶�.
SELECT 	MANAGER_ID
FROM 	EMPLOYEES e
GROUP BY MANAGER_ID
HAVING COUNT(MANAGER_ID) = (SELECT 	MAX(COUNT(*))  
							FROM 	EMPLOYEES e
							GROUP BY MANAGER_ID)  
;

SELECT 	MANAGER_ID
FROM 	EMPLOYEES e
GROUP BY MANAGER_ID
HAVING COUNT(*) = (SELECT 	MAX(COUNT(*))  
							FROM 	EMPLOYEES e
							GROUP BY MANAGER_ID)  
;


SELECT  MANAGER_ID
FROM 	EMPLOYEES e
GROUP BY MANAGER_ID 
HAVING 	count(EMPLOYEE_ID) = (SELECT max(count(*))
							FROM 	EMPLOYEES e3 
							GROUP BY MANAGER_ID) 
;

SELECT 	MAX(COUNT(EMPLOYEE_ID))  
FROM 	EMPLOYEES e
GROUP BY MANAGER_ID 
;

SELECT 	MAX(COUNT(*))  
FROM 	EMPLOYEES e
GROUP BY MANAGER_ID 
;

SELECT COUNT(*) FROM EMPLOYEES e ;
SELECT COUNT(EMPLOYEE_ID) FROM EMPLOYEES e ;
SELECT COUNT(MANAGER_ID) FROM EMPLOYEES e ;
SELECT * FROM EMPLOYEES e WHERE MANAGER_ID IS NULL;


-- ��4. EMPLOYEES ���̺��� (���� ���� ����� �����ִ� �μ� ��ȣ)��
-- ������� ����϶�

SELECT 	DEPARTMENT_ID , COUNT(*) 
FROM 	EMPLOYEES e2  
GROUP BY DEPARTMENT_ID 
HAVING COUNT(*) = (	SELECT  MAX(COUNT(*))  
					FROM  	EMPLOYEES e 
					GROUP BY DEPARTMENT_ID)
;	


SELECT  MAX(COUNT(*))  
FROM  	EMPLOYEES e 
GROUP BY DEPARTMENT_ID 
;



-- ��5. EMPLOYEES ���̺��� �����ȣ�� 123�� ����� ������ ����,
-- �����ȣ�� 192�� ����� �޿�(sal)���� ���� ����� 
-- �����ȣ, �̸�, ����, �޿��� ����϶�

SELECT 	e.EMPLOYEE_ID , e.FIRST_NAME , e.JOB_ID , e.SALARY 
FROM 	EMPLOYEES e 
WHERE 	JOB_ID = (SELECT JOB_ID FROM EMPLOYEES e2 WHERE EMPLOYEE_ID = 123)
AND		SALARY > (SELECT SALARY FROM EMPLOYEES e3 WHERE EMPLOYEE_ID = 192) 
;

------------------------------------------------------------------
-- DDL

-- ���̺� ����
CREATE TABLE EMPLOYEES2(
	employee_id		number(10),
	name			varchar2(20),
	salary			number(7,2)
);

CREATE TABLE EMPLOYEES3(
	employee_id		number(10),
	name			varchar2(20),
	salary			number(7,2),
	create_date		DATE	DEFAULT sysdate 
);

-- ���� ���̺�� �����ϰ� �ۼ� 
CREATE TABLE employees3 
AS 
SELECT * FROM EMPLOYEES2 e ;

-- �÷��߰�
ALTER TABLE EMPLOYEES2 ADD(
	manager_id 	varchar2(10)
);

ALTER TABLE EMPLOYEES2 modify(
	manager_id 	varchar2(20)
);

-- �÷� ����
ALTER TABLE EMPLOYEES2 DROP COLUMN manager_id;

SELECT * FROM EMPLOYEES2;

INSERT INTO EMPLOYEES2 
VALUES (4, '�׽�Ʈ', 30000);

INSERT INTO EMPLOYEES3 (employee_id, name)
VALUES (4, '�׽�Ʈ');

-- DELETE FROM EMPLOYEES2 e WHERE EMPLOYEE_ID  = 1;

-- ������ ����
-- TRUNCATE TABLE EMPLOYEES2 ;

-- ���̺� ����
-- DROP TABLE EMPLOYEES3 ;


















