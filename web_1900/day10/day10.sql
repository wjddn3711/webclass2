-- view
CREATE VIEW v_emp(
	emp_id, first_name, job_id, hiredate, dept_id
) AS 
SELECT 	employee_id, first_name, job_id, 
		hire_date, department_id
FROM 	EMPLOYEES
WHERE 	job_id = 'ST_CLERK'
;

SELECT * FROM V_EMP ve ;

SELECT * FROM EMPLOYEES e ;

--DROP view V_EMP;

CREATE OR REPLACE VIEW v_emp2(
	emp_id, first_name, job_id, hiredate, dept_id
) AS 
SELECT 	NVL(EMPLOYEE_ID, NULL), NVL(FIRST_NAME, NULL),
		JOB_ID, HIRE_DATE, DEPARTMENT_ID		
FROM 	EMPLOYEES e 
WHERE 	JOB_ID = 'SH_CLERK'
;

SELECT * FROM v_emp2;

UPDATE 	V_EMP SET FIRST_NAME = 'KIM'
WHERE 	FIRST_NAME  = 'Julia'
;

SELECT * FROM V_EMP;

UPDATE 	V_EMP2 SET FIRST_NAME = 'KIM'
WHERE 	FIRST_NAME  = 'Julia'
;

CREATE VIEW v_emp_salary(
	emp_id, last_name, salary, 
	total_sal
) AS 
SELECT  EMPLOYEE_ID , LAST_NAME , SALARY , 
		(SALARY + NVL(COMMISSION_PCT, 0))*12
FROM 	EMPLOYEES e 
;

SELECT * FROM v_emp_salary;

CREATE VIEW v_emp3 (
	emp_id, name, department_id, hire_date  
) AS
SELECT	EMPLOYEE_ID ,
		first_name || ' ' || last_name,
		department_id, hire_date 
FROM 	EMPLOYEES e 
WHERE 	DEPARTMENT_ID = 50
;

SELECT * FROM v_emp3;

-- sequence : 제품번호 생성하는 시퀀스 만들기
CREATE SEQUENCE seq_serial_no
INCREMENT BY 1
START WITH 100
MAXVALUE 110
MINVALUE 99
CYCLE 
cache  2
;

CREATE TABLE good(
	good_no 	number(3),
	good_name	varchar2(10)	
);

-- nextval : 다음값
INSERT INTO good VALUES ( seq_serial_no.nextval, '제품1' );

SELECT * FROM good;

-- currval : 현재 값
SELECT seq_serial_no.currval FROM dual;

INSERT INTO good VALUES ( seq_serial_no.currval, '제품12' );


CREATE SEQUENCE seq_serial_no2
INCREMENT BY 1
START WITH 100
MAXVALUE 110
MINVALUE 99
CYCLE 
cache  2
;

DROP SEQUENCE seq_serial_no2;

















