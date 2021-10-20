-- 문1. EMPLOYEES 테이블에서 (급여의 평균)보다 작은 사원의
-- 사원번호, 이름, 담당업무, 급여, 부서번호를 출력하라

SELECT 	e.EMPLOYEE_ID , e.FIRST_NAME, e.JOB_ID ,
		e.SALARY , e.DEPARTMENT_ID 
FROM 	EMPLOYEES e 
WHERE 	SALARY  < (SELECT AVG(SALARY) FROM EMPLOYEES e2)
;

-- 문2. EMPLOYEES 테이블에서 (100번 부서의 
-- 최소 급여보다 최소 급여)가 많은 다른 모든 부서를 출력하라
SELECT 	DEPARTMENT_ID, MIN(SALARY) 
FROM 	EMPLOYEES e 
GROUP BY DEPARTMENT_ID
HAVING MIN(SALARY) > (	SELECT 	min(SALARY) 
						FROM 	EMPLOYEES e2
						WHERE 	DEPARTMENT_ID = 100)
;						


-- 문3. EMPLOYEES 테이블에서 (가장 많은 사원)을 갖는 
-- Manager의 사원번호를 출력하라.
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


-- 문4. EMPLOYEES 테이블에서 (가장 많은 사원이 속해있는 부서 번호)와
-- 사원수를 출력하라

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



-- 문5. EMPLOYEES 테이블에서 사원번호가 123인 사원의 직업과 같고,
-- 사원번호가 192인 사원의 급여(sal)보다 많은 사원의 
-- 사원번호, 이름, 직업, 급여를 출력하라

SELECT 	e.EMPLOYEE_ID , e.FIRST_NAME , e.JOB_ID , e.SALARY 
FROM 	EMPLOYEES e 
WHERE 	JOB_ID = (SELECT JOB_ID FROM EMPLOYEES e2 WHERE EMPLOYEE_ID = 123)
AND		SALARY > (SELECT SALARY FROM EMPLOYEES e3 WHERE EMPLOYEE_ID = 192) 
;

------------------------------------------------------------------
-- DDL

-- 테이블 생성
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

-- 기존 테이블과 동일하게 작성 
CREATE TABLE employees3 
AS 
SELECT * FROM EMPLOYEES2 e ;

-- 컬럼추가
ALTER TABLE EMPLOYEES2 ADD(
	manager_id 	varchar2(10)
);

ALTER TABLE EMPLOYEES2 modify(
	manager_id 	varchar2(20)
);

-- 컬럼 삭제
ALTER TABLE EMPLOYEES2 DROP COLUMN manager_id;

SELECT * FROM EMPLOYEES2;

INSERT INTO EMPLOYEES2 
VALUES (4, '테스트', 30000);

INSERT INTO EMPLOYEES3 (employee_id, name)
VALUES (4, '테스트');

-- DELETE FROM EMPLOYEES2 e WHERE EMPLOYEE_ID  = 1;

-- 데이터 비우기
-- TRUNCATE TABLE EMPLOYEES2 ;

-- 테이블 삭제
-- DROP TABLE EMPLOYEES3 ;


















