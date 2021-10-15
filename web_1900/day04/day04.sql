
--  nvl() : 널값을 다른 데이터로 변경하는 함수 
SELECT 	FIRST_NAME
	,	LAST_NAME 
	,	NVL(COMMISSION_PCT, 0) 
FROM	EMPLOYEES e
;


-- decode() : switch문의 역할을 하는 함수
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
 * distinct : 유니크(중복을 제거)한 데이터(컬럼이나 레코드)를
 * 조회하는 경우 사용한다.
 * 
 * Group by : 데이터를 그룹핑해서 그 결과를 가져오는 경우 사용한다.
 * 집계 함수와 짝을 이루어 사용 할 수 있다. *
 */

SELECT 	DISTINCT DEPARTMENT_ID 
FROM 	EMPLOYEES e 
;

SELECT 	DEPARTMENT_ID 
FROM 	EMPLOYEES e 
GROUP BY DEPARTMENT_ID 
;

-- 부서별 급여 합계
SELECT 	SUM(SALARY), DEPARTMENT_ID 
FROM 	EMPLOYEES e 
GROUP BY DEPARTMENT_ID 
;

SELECT 	DISTINCT DEPARTMENT_ID, SUM(SALARY) 
FROM 	EMPLOYEES e 
;

-- 부서별 사원수와 평균 급여, 급여의 합을 구해보자
SELECT  DEPARTMENT_ID 
	,	SUM(SALARY)
	,	AVG(SALARY)
	,	COUNT(SALARY) 
FROM 	EMPLOYEES e
GROUP BY DEPARTMENT_ID 
;

-- 부서별(DEPARTMENT_ID), 직급별(job_id)
-- 사원수, 평균급여, 급여합
SELECT  DEPARTMENT_ID , JOB_ID 
	,	TO_CHAR(SUM(SALARY), '999,999') totalSalary 
	,	SUM(SALARY)
	,	COUNT(SALARY)
	,	AVG(SALARY) 
FROM 	EMPLOYEES e 
GROUP BY DEPARTMENT_ID , JOB_ID 
ORDER BY DEPARTMENT_ID , JOB_ID 
;

-- where 절 추가
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

-- having절 
-- 현재 부서별 사원수
/*
 * where 절에서는 집계함수를 사용 할 수 없다.
 * having 절은 집계함수를 가지고 조건을 비교할 때 사용한다.
 */
SELECT 	DEPARTMENT_ID
	,	COUNT(*) 
FROM 	EMPLOYEES e
WHERE 	DEPARTMENT_ID IS NOT NULL
-- AND 	count(*) >= 10
GROUP BY DEPARTMENT_ID 
HAVING COUNT(*) >= 10 
;

-- 문제1.
-- employees 테이블에서 job_id가 'SA'로 시작하는 사람에 대하여
-- 급여의 평균, 최고액, 최저액, 합계를 구하여 출력하라.
SELECT 	AVG(SALARY)
	,	MAX(SALARY)
	,	MIN(SALARY)
	,	SUM(SALARY) 
FROM 	EMPLOYEES e
WHERE 	JOB_ID LIKE 'SA%'
;


-- 문제4. employees 테이블에서 각 부서별로 인원수,
-- 급여의 평균, 최저급여, 최고급여, 급여의 합을 구하여 급여의 합이 많은 
-- 순으로 출력하라.

SELECT 	DEPARTMENT_ID 
	,	COUNT(*) AS "총합"
	,	AVG(SALARY)
	,	MIN(SALARY)
	,	MAX(SALARY)
	, 	SUM(SALARY) 
FROM 	EMPLOYEES e 
GROUP BY DEPARTMENT_ID
ORDER BY "총합" DESC
--ORDER BY  3  
;

 



-- 문제6. employees 테이블에서 부서별, 업무별 그룹하여 결과를 부서번호,
-- 업무, 인원수, 급여의 평균, 급여의 합을 구하여 출력하라.

SELECT  DEPARTMENT_ID 
	,	JOB_ID 
	,	COUNT(*)
	,	AVG(SALARY)
	,	SUM(SALARY) 
FROM 	EMPLOYEES e
GROUP BY DEPARTMENT_ID , JOB_ID 
;


-- 문제7. employees 테이블에서 부서 인원이 4보다 많은 부서의 부서번호,
-- 인원수, 급여의 합을 구하여 출력하라.

SELECT  DEPARTMENT_ID 
	,	COUNT(*) 
	,	SUM(SALARY) 
FROM 	EMPLOYEES e
GROUP BY DEPARTMENT_ID 
HAVING 	COUNT(*) > 4 
;

-- 문제8. employees테이블에서 급여가 최대 10000이상인 부서에 대해서
-- 부서번호, 평균 급여, 급여의 합계 구하여 출력하라.

SELECT 	DEPARTMENT_ID 
	,	AVG(SALARY)
	,	SUM(SALARY) 
FROM 	EMPLOYEES e
GROUP BY DEPARTMENT_ID 
HAVING MAX(SALARY) >= 10000 
;


SELECT * FROM EMPLOYEES e ;
SELECT * FROM DEPARTMENTS d ;






















