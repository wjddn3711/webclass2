SELECT *
FROM 	EMPLOYEES e ;

--1
SELECT 	LAST_NAME 
FROM 	EMPLOYEES e 
WHERE 	SALARY >= 12000;
--2
SELECT 	LAST_NAME , DEPARTMENT_ID 
FROM 	EMPLOYEES e 
WHERE 	EMPLOYEE_ID = 176;
--3
SELECT	LAST_NAME ,SALARY 
FROM 	EMPLOYEES e 
WHERE 	NOT SALARY BETWEEN 5000 AND 12000
ORDER BY SALARY ;
--4
SELECT 	LAST_NAME, DEPARTMENT_ID 
FROM 	EMPLOYEES e 
WHERE 	DEPARTMENT_ID IN (20,50)
ORDER BY LAST_NAME ;
--5
SELECT 	LAST_NAME , SALARY 
FROM 	EMPLOYEES e 
WHERE 	SALARY BETWEEN 5000 AND 12000
AND 	DEPARTMENT_ID IN (20,50);
--6
SELECT 	LAST_NAME , JOB_ID 
FROM 	EMPLOYEES e 
WHERE 	MANAGER_ID IS NULL;
--7
SELECT 	LAST_NAME ,SALARY ,COMMISSION_PCT 
FROM 	EMPLOYEES e 
WHERE 	COMMISSION_PCT IS NOT NULL
ORDER BY SALARY DESC ;
--8
SELECT 	LAST_NAME 
FROM 	EMPLOYEES e 
WHERE 	LAST_NAME LIKE 'A%';


-- concat(char1, char2) : 문자열 연결
SELECT CONCAT('Hello','bye'), CONCAT('good','bad')
FROM dual;

SELECT 	CONCAT('good','bad') 	concats,
		'good'||'bad' 			operators
FROM 	dual;

-- initcap(char) : char의 첫 문자를 대문자로 변환
SELECT 	INITCAP('good morning')
FROM 	dual;

--lower(char): 소문자 , upper(char): 대문자 
SELECT lower('GOOD'), UPPER('good')
FROM	dual;

-- lpad("값",총 문자길이, "채움문자")
SELECT 	LPAD('GOOD',6) "LPAD1",
		'good',
		LPAD('good',7,'#') "LPAD2",
		LPAD('good',8,'L') "LPAD3" 
FROM	dual;

-- rpad("값",총 문자길이, "채움문자")
SELECT 	RPAD('GOOD',6) "RPAD1",
		RPAD('good',7,'#') "RPAD2",
		RPAD('good',8,'L') "RPAD3" 
FROM	dual;

-- LTRIM("문자열","옵션") - 문자열을 옵션 만큼 왼쪽으로 늘려서 반환
SELECT 	LTRIM('goodbye','g'),
		LTRIM('goodbye','o'),
		LTRIM('goodbye','go')
FROM	dual;

-- RTRIM("문자열","옵션") - 문자열을 옵션 만큼 오른쪽으로 늘려서 반환
SELECT 	RTRIM('goodbye','e'),
		RTRIM('goodbye','ye'),
		RTRIM('goodbye','b')
FROM	dual;

-- substr("문자열","시작위치","길이")
SELECT 	SUBSTR('good morning',1,4)
FROM	dual;

SELECT 	SUBSTR('good morning',8,4)
FROM	dual;

-- replace(char, str1, str2): 문자열 일부를 대체해서 반환 
SELECT 	REPLACE ('good morning tom', 'morning','evening')
FROM 	dual;

-- translate('문자열', '대상문자','변환문자') - 1대 1대응
SELECT 	REPLACE ('You are not alone', 'You', 'We'),
		TRANSLATE ('You are not alone uuu', 'You','Wei')
FROM 	dual;

--sysdate
SELECT 	SYSDATE 
FROM	dual;

--add_months
SELECT 	ADD_MONTHS(SYSDATE, 2)
FROM	dual;

--last_day()
SELECT 	LAST_DAY(SYSDATE)
FROM	dual;

SELECT 	SYSDATE +1
FROM	dual;

SELECT 	SYSDATE +(INTERVAL '1' year),
		SYSDATE +(INTERVAL '1' month),
		SYSDATE +(INTERVAL '1' day),
		SYSDATE +(INTERVAL '1' hour),
		SYSDATE +(INTERVAL '1' minute),
		SYSDATE +(INTERVAL '1' second)
FROM	dual;
		
-- to_char() : 문자열 변환
SELECT 	to_char(SYSDATE, 'yyyy-mm-dd'),
		to_char(SYSDATE, 'yyyy/mm/dd'),
		to_char(SYSDATE, 'yyyymmdd'),
		to_char(SYSDATE, 'yyyy-mm-dd HH24:MI:SS')
FROM	dual;

-- to_date(): 날짜형으로 변환
SELECT 	to_date('2015/03/04', 'yyyy/mm/dd')
FROM	dual;







