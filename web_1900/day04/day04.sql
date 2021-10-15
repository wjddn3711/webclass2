
--  nvl() : �ΰ��� �ٸ� �����ͷ� �����ϴ� �Լ� 
SELECT 	FIRST_NAME
	,	LAST_NAME 
	,	NVL(COMMISSION_PCT, 0) 
FROM	EMPLOYEES e
;


-- decode() : switch���� ������ �ϴ� �Լ�
SELECT 	DEPARTMENT_ID 
	,	DECODE(DEPARTMENT_ID, 20, 'MA', 
		60, 'IT', 90, 'EX', 'ETC') 	
FROM 	DEPARTMENTS d 
;

-- case()
SELECT 	FIRST_NAME 
	, 	DEPARTMENT_ID 
	,	CASE WHEN DEPARTMENT_ID = 20 THEN 'MA'
			 WHEN DEPARTMENT_ID = 60 THEN 'IT'
			 WHEN DEPARTMENT_ID = 90 THEN 'EX'
			 ELSE ''
			 END "department"
FROM 	EMPLOYEES e 
;

-- distinct, group by
/*
 * distinct : ����ũ(�ߺ��� ����)�� ������(�÷��̳� ���ڵ�)��
 * ��ȸ�ϴ� ��� ����Ѵ�.
 * 
 * Group by : �����͸� �׷����ؼ� �� ����� �������� ��� ����Ѵ�.
 * ���� �Լ��� ¦�� �̷�� ��� �� �� �ִ�. *
 */

SELECT 	DISTINCT DEPARTMENT_ID 
FROM 	EMPLOYEES e 
;

SELECT 	DEPARTMENT_ID 
FROM 	EMPLOYEES e 
GROUP BY DEPARTMENT_ID 
;

-- �μ��� �޿� �հ�
SELECT 	SUM(SALARY), DEPARTMENT_ID 
FROM 	EMPLOYEES e 
GROUP BY DEPARTMENT_ID 
;

SELECT 	DISTINCT DEPARTMENT_ID, SUM(SALARY) 
FROM 	EMPLOYEES e 
;

-- �μ��� ������� ��� �޿�, �޿��� ���� ���غ���
SELECT  DEPARTMENT_ID 
	,	SUM(SALARY)
	,	AVG(SALARY)
	,	COUNT(SALARY) 
FROM 	EMPLOYEES e
GROUP BY DEPARTMENT_ID 
;

-- �μ���(DEPARTMENT_ID), ���޺�(job_id)
-- �����, ��ձ޿�, �޿���
SELECT  DEPARTMENT_ID , JOB_ID 
	,	TO_CHAR(SUM(SALARY), '999,999') totalSalary 
	,	SUM(SALARY)
	,	COUNT(SALARY)
	,	AVG(SALARY) 
FROM 	EMPLOYEES e 
GROUP BY DEPARTMENT_ID , JOB_ID 
ORDER BY DEPARTMENT_ID , JOB_ID 
;

-- where �� �߰�
SELECT  DEPARTMENT_ID , JOB_ID 
	,	TO_CHAR(SUM(SALARY), '999,999') totalSalary 
	,	SUM(SALARY)
	,	COUNT(SALARY)
	,	AVG(SALARY) 
FROM 	EMPLOYEES e 
WHERE 	DEPARTMENT_ID = 80
GROUP BY DEPARTMENT_ID , JOB_ID 
ORDER BY DEPARTMENT_ID , JOB_ID 
;

-- having�� 
-- ���� �μ��� �����
/*
 * where �������� �����Լ��� ��� �� �� ����.
 * having ���� �����Լ��� ������ ������ ���� �� ����Ѵ�.
 */
SELECT 	DEPARTMENT_ID
	,	COUNT(*) 
FROM 	EMPLOYEES e
WHERE 	DEPARTMENT_ID IS NOT NULL
-- AND 	count(*) >= 10
GROUP BY DEPARTMENT_ID 
HAVING COUNT(*) >= 10 
;

-- ����1.
-- employees ���̺��� job_id�� 'SA'�� �����ϴ� ����� ���Ͽ�
-- �޿��� ���, �ְ��, ������, �հ踦 ���Ͽ� ����϶�.
SELECT 	AVG(SALARY)
	,	MAX(SALARY)
	,	MIN(SALARY)
	,	SUM(SALARY) 
FROM 	EMPLOYEES e
WHERE 	JOB_ID LIKE 'SA%'
;


-- ����4. employees ���̺��� �� �μ����� �ο���,
-- �޿��� ���, �����޿�, �ְ�޿�, �޿��� ���� ���Ͽ� �޿��� ���� ���� 
-- ������ ����϶�.

SELECT 	DEPARTMENT_ID 
	,	COUNT(*) AS "����"
	,	AVG(SALARY)
	,	MIN(SALARY)
	,	MAX(SALARY)
	, 	SUM(SALARY) 
FROM 	EMPLOYEES e 
GROUP BY DEPARTMENT_ID
ORDER BY "����" DESC
--ORDER BY  3  
;

 



-- ����6. employees ���̺��� �μ���, ������ �׷��Ͽ� ����� �μ���ȣ,
-- ����, �ο���, �޿��� ���, �޿��� ���� ���Ͽ� ����϶�.

SELECT  DEPARTMENT_ID 
	,	JOB_ID 
	,	COUNT(*)
	,	AVG(SALARY)
	,	SUM(SALARY) 
FROM 	EMPLOYEES e
GROUP BY DEPARTMENT_ID , JOB_ID 
;


-- ����7. employees ���̺��� �μ� �ο��� 4���� ���� �μ��� �μ���ȣ,
-- �ο���, �޿��� ���� ���Ͽ� ����϶�.

SELECT  DEPARTMENT_ID 
	,	COUNT(*) 
	,	SUM(SALARY) 
FROM 	EMPLOYEES e
GROUP BY DEPARTMENT_ID 
HAVING 	COUNT(*) > 4 
;

-- ����8. employees���̺��� �޿��� �ִ� 10000�̻��� �μ��� ���ؼ�
-- �μ���ȣ, ��� �޿�, �޿��� �հ� ���Ͽ� ����϶�.

SELECT 	DEPARTMENT_ID 
	,	AVG(SALARY)
	,	SUM(SALARY) 
FROM 	EMPLOYEES e
GROUP BY DEPARTMENT_ID 
HAVING MAX(SALARY) >= 10000 
;


SELECT * FROM EMPLOYEES e ;
SELECT * FROM DEPARTMENTS d ;






















