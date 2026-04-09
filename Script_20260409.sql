SELECT DEPTNO AS 부서코드, DNAME AS 부서명, LOC AS 지역 
FROM DEPT;

SELECT DEPTNO 부서코드, DNAME 부서명, LOC 지역 
FROM DEPT;


SELECT EMPNO, ENAME || '(' || JOB || ')' EMPLOYEE 
FROM EMP;


SELECT ENAME, ROUND(SAL/12, 1), TRUNC(SAL/12, 1) 	-- ROUND(반올림), TRUNC(버림)
FROM EMP;


SELECT SYSDATE, EXTRACT(MONTH FROM SYSDATE), 
EXTRACT(DAY FROM SYSDATE) 
FROM DUAL;

-----------------------------------------------------------------------
SELECT ENAME, HIREDATE, TO_NUMBER(TO_CHAR(HIREDATE, 'YYYY')) 입사년도, 
TO_NUMBER(TO_CHAR(HIREDATE, 'MM')) 입사월, 
TO_NUMBER(TO_CHAR(HIREDATE, 'DD')) 입사일 
FROM EMP;

SELECT ENAME, HIREDATE, 
TO_CHAR(HIREDATE, 'YYYY') 입사년도, 
TO_CHAR(HIREDATE, 'MM') 월, 
TO_CHAR(HIREDATE, 'DD') 일 
FROM EMP;
-----------------------------------------------------------------------


SELECT SYSDATE FROM DUAL;

SELECT * FROM DUAL;		-- DUMMY TABLE : X값

SELECT SYSDATE FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD') 날짜, 
TO_CHAR(SYSDATE, 'YYYY. MON. DAY') 문자형 
FROM DUAL;

SELECT ENAME, SAL 
FROM EMP;

SELECT ENAME, SAL, 
CASE WHEN SAL > 2000 
THEN SAL 
ELSE 2000 
END REVISED_SALARY 	-- 보정된 급여
FROM EMP;

SELECT * FROM DEPT;


-----------------------------------
SELECT LOC, 
CASE LOC 
WHEN 'NEW YORK' THEN 'EAST' 
WHEN 'BOSTON' THEN 'EAST' 
WHEN 'CHICAGO' THEN 'CENTER' 
WHEN 'DALLAS' THEN 'CENTER' 
ELSE 'ETC' 
END AS AREA 
FROM DEPT;

SELECT LOC, 
DECODE(LOC, 
'NEW YORK', 'EAST', 
'BOSTON', 'EAST', 
'DALLAS', 'CENT1ER', 
'CHICAGO', 'CENTER') AREA 
FROM DEPT;
-----------------------------------


SELECT ENAME, 
CASE 
	WHEN SAL >= 3000 THEN 'HIGH' 
	WHEN SAL >= 1000 THEN 'MID' 
	ELSE 'LOW' 
END AS SALARY_GRADE 
FROM EMP
END;


SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM  
FROM EMP;


---------------------------------------------------------------
SELECT EMPNO, ENAME, SAL, NVL(COMM, 0) FROM EMP;


SELECT EMPNO, ENAME, SAL, 
CASE WHEN COMM IS NULL 
THEN 0 
ELSE COMM 
END AS COMMISSON, 
SAL + (CASE WHEN COMM IS NULL 
		THEN 0 
		ELSE COMM 
		END) RESULT 
FROM EMP;


SELECT EMPNO, ENAME, SAL, 
CASE WHEN COMM IS NULL 
THEN 0 
ELSE COMM 
END AS COMMISSON, 
SAL + COMM  
FROM EMP;
---------------------------------------------------------------


######################################################################
/* 프로그래머스 : SELECT 조회 쿼리문 - "조건에 부합하는 중고거래 댓글 조회하기"

SELECT B.TITLE, B.BOARD_ID, R.REPLY_ID, R.WRITER_ID, R.CONTENTS, 
       TO_CHAR(R.CREATED_DATE, 'YYYY-MM-DD') AS CREATED_DATE
FROM USED_GOODS_BOARD B
INNER JOIN USED_GOODS_REPLY R ON B.BOARD_ID = R.BOARD_ID
WHERE TO_CHAR(B.CREATED_DATE, 'YYYY-MM') = '2022-10'
ORDER BY R.CREATED_DATE ASC, B.TITLE ASC;
-----------------------------------------------------------------------
SELECT B.TITLE, B.BOARD_ID, R.REPLY_ID, R.WRITER_ID, R.CONTENTS, 
       TO_CHAR(R.CREATED_DATE, 'YYYY-MM-DD') AS CREATED_DATE
FROM (
    SELECT BOARD_ID, TITLE 
    FROM USED_GOODS_BOARD 
    WHERE TO_CHAR(CREATED_DATE, 'YYYY-MM') = '2022-10'
) B
JOIN USED_GOODS_REPLY R ON B.BOARD_ID = R.BOARD_ID
ORDER BY R.CREATED_DATE ASC, B.TITLE ASC;
-----------------------------------------------------------------------
SELECT B.TITLE, 
       B.BOARD_ID, 
       R.REPLY_ID, 
       R.WRITER_ID, 
       R.CONTENTS, 
       TO_CHAR(R.CREATED_DATE, 'YYYY-MM-DD') AS CREATED_DATE
FROM USED_GOODS_BOARD B
INNER JOIN USED_GOODS_REPLY R ON B.BOARD_ID = R.BOARD_ID
WHERE B.CREATED_DATE >= TO_DATE('2022-10-01', 'YYYY-MM-DD')
  AND B.CREATED_DATE <  TO_DATE('2022-11-01', 'YYYY-MM-DD')
ORDER BY R.CREATED_DATE ASC, B.TITLE ASC;
-----------------------------------------------------------------------
WITH OCTOBER_BOARDS AS (
    SELECT BOARD_ID, TITLE
    FROM USED_GOODS_BOARD
    WHERE TO_CHAR(CREATED_DATE, 'YYYY-MM') = '2022-10'
)
SELECT OB.TITLE, 
       OB.BOARD_ID, 
       R.REPLY_ID, 
       R.WRITER_ID, 
       R.CONTENTS, 
       TO_CHAR(R.CREATED_DATE, 'YYYY-MM-DD') AS CREATED_DATE
FROM OCTOBER_BOARDS OB
JOIN USED_GOODS_REPLY R ON OB.BOARD_ID = R.BOARD_ID
ORDER BY R.CREATED_DATE ASC, OB.TITLE ASC;
-----------------------------------------------------------------------
SELECT TITLE, B.BOARD_ID, REPLY_ID, R.WRITER_ID, R.CONTENTS, 
		TO_CHAR(R.CREATED_DATE, 'YYYY-MM-DD') 
FROM USED_GOODS_BOARD B, USED_GOODS_REPLY R
WHERE B.BOARD_ID = R.BOARD_ID
AND TO_CHAR(B.CREATED_DATE, 'YYYY') = 2022
AND TO_CHAR(B.CREATED_DATE, 'MM') = 10
ORDER BY 6, 1;
-----------------------------------------------------------------------
SELECT b.TITLE, b.BOARD_ID, r.REPLY_ID, r.WRITER_ID, r.CONTENTS, TRUNC(r.CREATED_DATE) AS CREATED_DATE 
FROM USED_GOODS_BOARD b JOIN USED_GOODS_REPLY r ON b.BOARD_ID = r.BOARD_ID 
WHERE b.CREATED_DATE >= DATE '2022-10-01' 
AND b.CREATED_DATE < DATE '2022-11-01' 
ORDER BY TRUNC(r.CREATED_DATE) ASC, b.TITLE ASC;
-----------------------------------------------------------------------
SELECT  TITLE,
        R.BOARD_ID,
        R.REPLY_ID, 
        R.WRITER_ID, 
        R.CONTENTS, 
        to_char(R.CREATED_DATE, 'YYYY-MM-DD') AS CREATED_DATE
from USED_GOODS_BOARD B, USED_GOODS_REPLY R
WHERE B.BOARD_ID=R.BOARD_ID 
AND TO_CHAR(B.CREATED_DATE, 'YYYY') = '2022'
AND TO_CHAR(B.CREATED_DATE, 'MM') = '10' 
order by R.CREATED_DATE, TITLE;
-----------------------------------------------------------------------
select b.title, b.board_id, r.reply_id, r.writer_id, r.contents, to_char(r.created_date,'YYYY-MM-DD') as created_date
from used_goods_board b, used_goods_reply r
where b.board_id=r.board_id 
and to_char(b.created_date,'YYYY-MM') = '2022-10'
order by r.created_date, b.title asc;

**/
######################################################################


SELECT * FROM EMP 
WHERE COMM IS NULL;

SELECT * FROM EMP 
WHERE COMM IS NOT NULL;



SELECT * FROM EMP 
WHERE ROWNUM <= 5;



SELECT * 
FROM (
	SELECT ENAME, SAL, COMM, SAL+NVL(COMM, 0) SALSUM 
	FROM EMP 
	ORDER BY 4 DESC
)
WHERE ROWNUM <= 5;




-- QUIZ) 급여 하위 4명 추출 --
#############################################################
SELECT * 
FROM (
	SELECT ENAME, SAL, COMM, SAL+NVL(COMM, 0) SALSUM 
	FROM EMP 
	ORDER BY 4
)
WHERE ROWNUM <= 4;
#############################################################


SELECT * FROM EMP 
WHERE SAL BETWEEN 1500 AND 2500;


SELECT DNAME, JOB, COUNT(*) "Total Empl", SUM(sal) "Total Sal" 
FROM EMP, DEPT 
WHERE DEPT.DEPTNO = EMP.DEPTNO 
GROUP BY DNAME, JOB 
ORDER BY 1, 2;


SELECT DNAME, JOB, 
COUNT(*) "Total Empl", 
SUM(SAL) "Total Sal" 
FROM EMP, DEPT 
WHERE DEPT.DEPTNO = EMP.DEPTNO 
GROUP BY ROLLUP (DNAME, JOB) 
ORDER BY DNAME, JOB;


##################################################################
/* 프로그래머스 : JOIN 연결문 - "조건에 맞는 도서와 저자 리스트 출력하기"

SELECT B.BOOK_ID, 
       A.AUTHOR_NAME, 
       TO_CHAR(B.PUBLISHED_DATE, 'YYYY-MM-DD') AS PUBLISHED_DATE
FROM BOOK B
JOIN AUTHOR A ON B.AUTHOR_ID = A.AUTHOR_ID
WHERE B.CATEGORY = '경제'
ORDER BY B.PUBLISHED_DATE ASC;
-----------------------------------------------------------------------------------
SELECT B.BOOK_ID, A.AUTHOR_NAME, TO_CHAR(B.PUBLISHED_DATE, 'YYYY-MM-DD') AS PUBLISHED_DATE
FROM BOOK B, AUTHOR A
WHERE B.AUTHOR_ID = A.AUTHOR_ID 
  AND B.CATEGORY = '경제'
ORDER BY B.PUBLISHED_DATE;
-----------------------------------------------------------------------------------
SELECT B.BOOK_ID, A.AUTHOR_NAME, 
	TO_CHAR(B.PUBLISHED_DATE, 'YYYY-MM-DD') AS PUBLISHED_DATE
FROM (SELECT * FROM BOOK WHERE CATEGORY = '경제') B
JOIN AUTHOR A ON B.AUTHOR_ID = A.AUTHOR_ID 
ORDER BY B.PUBLISHED_DATE;
-----------------------------------------------------------------------------------
SELECT B.BOOK_ID, (
    SELECT A.AUTHOR_NAME 
    FROM AUTHOR A 
    WHERE A.AUTHOR_ID = B.AUTHOR_ID) AS AUTHOR_NAME, 
       TO_CHAR(B.PUBLISHED_DATE, 'YYYY-MM-DD') AS PUBLISHED_DATE
FROM BOOK B
WHERE B.CATEGORY = '경제'
ORDER BY B.PUBLISHED_DATE;
-----------------------------------------------------------------------------------
SELECT B.BOOK_ID, A.AUTHOR_NAME, TO_CHAR(B.PUBLISHED_DATE, 'YYYY-MM-DD') PUBLISHED_DATE 
FROM BOOK B, AUTHOR A 
WHERE B.AUTHOR_ID = A.AUTHOR_ID AND B.CATEGORY = '경제' 
ORDER BY 3; 

*/
##################################################################


-- 직원이름 입력 후 조회 쿼리 실행
SELECT * FROM EMP WHERE ENAME='SMITH'


SELECT * FROM EMP WHERE ENAME='KING'


SELECT * FROM EMP


INSERT INTO EMP(EMPNO, ENAME) VALUES('1234','LEO')











