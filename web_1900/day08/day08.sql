SELECT 	e.DEPARTMENT_ID , d.DEPARTMENT_NAME, 
		COUNT(*) , sum(SALARY) ,
		l.CITY 
FROM	EMPLOYEES e 
	INNER JOIN DEPARTMENTS d 
	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
	INNER JOIN LOCATIONS l 
	ON d.LOCATION_ID = l.LOCATION_ID 
WHERE d.DEPARTMENT_ID IN (10, 30, 100, 110)	
GROUP BY e.DEPARTMENT_ID, d.DEPARTMENT_NAME, l.CITY 
HAVING d.DEPARTMENT_NAME IN ('Administration', 'Accounting')
;

-- table�� 	: sample
-- deptNo 	: number(20)
-- deptName : varchar2(15)
-- deploc	: varchar2(15)
-- deptManger	: varchar2(10)

CREATE TABLE sample(
	deptNo		number(20),
	deptName	varchar2(15),
	deploc		varchar2(15),
	depManger	varchar2(10)
);

-- deptNo : 10, deptName : ��ȹ��,  deploc : �λ� , deptManger : ȫ�浿
-- deptNo : 20, deptName : �����,  deploc : ���� , deptManger : �踻��
-- deptNo : 30, deptName : �����ν�,  deploc : ���� , deptManger : null
INSERT INTO SAMPLE (deptNo, deptName, deploc, depManger)
VALUES (10, '��ȹ��', '����', 'ȫ�浿');
INSERT INTO SAMPLE 
VALUES (20, '�����', '�λ�', '�踻��');
INSERT INTO SAMPLE 
VALUES (30, '�����ν�', '����', null);

-- TRUNCATE TABLE SAMPLE ;
SELECT * FROM SAMPLE s ;

-- sample ���̺��� deptNo�� 30�� �μ���ȣ�� 50���� ����
UPDATE 	SAMPLE SET DEPTNO = 50
WHERE 	DEPTNO = 30;

-- sample ���̺��� deptName �������� deploc�� ��õ���� ����
UPDATE 	SAMPLE SET DEPLOC = '��õ'
WHERE DEPTNAME = '�����ν�'
;

-- DELETE 
DELETE sample WHERE deptname = '�����';
DELETE sample WHERE deptname = '��ȹ��';
DELETE sample WHERE deptname = '�����ν�';

SELECT * FROM SAMPLE s ;

ROLLBACK;
COMMIT;

-- not null

CREATE TABLE null_test(
	col1	varchar2(20) NOT NULL,
	col2 	varchar2(20)
);

CREATE TABLE null_test2(
	col1	varchar2(20) NOT NULL,
	col2 	varchar2(20) NULL,
	col3 	varchar2(20)
);

INSERT INTO NULL_TEST (col1, COL2)
VALUES ('aa', 'bb');

SELECT * FROM NULL_TEST;


INSERT INTO NULL_TEST (col1, COL2)
VALUES (null, 'bb');

INSERT INTO NULL_TEST (col1, COL2)
VALUES ('aa', null);


-- unique
CREATE TABLE unique_test(
	col1 	varchar2(20) UNIQUE NOT NULL,
	col2	varchar2(20) UNIQUE,
	col3	varchar2(20)
);

INSERT INTO UNIQUE_TEST (col1, col2, COL3)
VALUES ('aa', 'bb', 'cc');
INSERT INTO UNIQUE_TEST (col1, col2, COL3)
VALUES ('aa2', 'bb2', 'cc2');
SELECT * FROM UNIQUE_TEST ut ;

UPDATE 	UNIQUE_TEST 
SET 	COL1 = 'aa'
WHERE 	COL2 = 'bb2'
;

INSERT INTO UNIQUE_TEST (col1, col2, COL3)
VALUES ('aa3', null, 'cc2');
INSERT INTO UNIQUE_TEST (col1, col2, COL3)
VALUES ('aa4', null, 'cc2');
SELECT * FROM UNIQUE_TEST ut ;


-- check
CREATE TABLE check_test2(
	gender 	varchar2(10) NOT NULL
		CONSTRAINTS CHECK_gender2 check(gender IN('M','F','����','����'))
);

INSERT INTO check_test2 VALUES ('M');
SELECT * FROM check_test2 ;












