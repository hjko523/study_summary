-- dept 
create table dept (
deptno number(2),   -- 부서번호
dname varchar(14),  -- 부서이름
loc varchar(14)
);   -- 부서위치

insert into dept values(10, 'accounting', 'new york');
insert into dept values(20, 'research', 'dallas');
insert into dept values(30, 'sales', 'chicago');
insert into dept values(40, 'operation', 'boston1');

-- emp

create table emp (
empno number(4),    -- 사원번호
ename varchar2(10), -- 사원이름
job varchar2(9),    -- 업무
mgr number(4),      -- 매니저
hiredate date,      -- 입사일
sal number(7,2),    -- 급여
comm number(7,2),   -- 추가급여
deptno number(2));  -- 부서번호

Insert into SCOTT.EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7839,'king','president',null,to_date('96/11/17','RR/MM/DD'),5000,null,10);
Insert into SCOTT.EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7698,'blake','manager',7839,to_date('91/01/05','RR/MM/DD'),2850,null,30);
Insert into SCOTT.EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7782,'clark','manager',7839,to_date('99/09/06','RR/MM/DD'),2450,null,10);
Insert into SCOTT.EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7566,'jones','manager',7839,to_date('01/02/04','RR/MM/DD'),2975,null,20);
Insert into SCOTT.EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7788,'scott','analyst',7566,to_date('03/06/17','RR/MM/DD'),3000,null,20);
Insert into SCOTT.EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7902,'ford','analyst',7566,to_date('80/03/12','RR/MM/DD'),3000,null,20);
Insert into SCOTT.EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7369,'smith','salesman',7902,to_date('07/12/01','RR/MM/DD'),800,null,20);
Insert into SCOTT.EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7499,'allen','salesman',7698,to_date('81/02/20','RR/MM/DD'),1600,300,20);
Insert into SCOTT.EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7521,'ward','salesman',7698,to_date('81/02/22','RR/MM/DD'),1250,500,30);
Insert into SCOTT.EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7654,'martin','salesman',7698,to_date('81/09/28','RR/MM/DD'),1250,1400,30);
Insert into SCOTT.EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7844,'turner','salesman',7698,to_date('81/08/09','RR/MM/DD'),1500,0,30);
Insert into SCOTT.EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7876,'adams','clerk',7788,to_date('87/05/23','RR/MM/DD'),1100,null,20);
Insert into SCOTT.EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7900,'james','clerk',7698,to_date('81/03/12','RR/MM/DD'),950,null,30);
Insert into SCOTT.EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7934,'miller','clerk',7782,to_date('03/01/23','RR/MM/DD'),1300,null,10);


-- salgrade
create table salgrade (
grade number,   -- 등급
losal number,   -- 최저급여
hisal number ); -- 최고급여

insert into salgrade values(1, 700, 1200);
insert into salgrade values(2, 1201, 1400);
insert into salgrade values(3, 1401, 2000);
insert into salgrade values(4, 2001, 3000);
insert into salgrade values(5, 3001, 9999);

select * from dept;
select * from emp;
select * from salgrade;


        
--  ==========================================================================================        
--  ==========================================================================================  
--  ==========================================================================================  


-- //                //
-- //   DATE - 날짜   //
-- //                //


-- 1) 날짜
select sysdate from dual;

-- 2) 일단위 증가/감소
select sysdate + 2 from dual;

-- 3) 월단위 증가/감소 : add_month()
select ename, hiredate, add_months(hiredate, 2) from emp;

-- 4) 월단위의 차이 : months_between()  => 소수점으로 반환됨 (-> round 반올림)
select ename, hiredate, sysdate, months_between(sysdate, hiredate) from emp;
select ename, hiredate, sysdate, round(months_between(sysdate, hiredate)) from emp;

-- 5) 마지막 날짜 반환 : last_day()
select last_day(sysdate) from dual;
select ename, last_day(hiredate) from emp where rownum < 5;

-- 6) 날짜 -> 문자 : to_char()
select sysdate from dual;
select to_char(sysdate, 'yyyy') from dual;
select to_char(sysdate, 'yyyy-mm-dd') from dual;

-- 7) 문자 -> 날짜 : to_date()
select to_char(to_date('20201205111701', 'yyyymmddhh24miss'), 'yyyy/mm/dd hh:mm:ss')as one,
to_date('20200505090101', 'yyyymmddhhmiss') as two from dual;



-- 8) like
-- '_' : 문자 / '%' : 문자열 / escape 특수문자 인식
select * from emp where  ename like 's%';               -- s로 시작하는 문자열
select * from emp where  ename like '%ke';              -- ke로 끝나는 문자열
select * from emp where  ename like '%or%';             -- or가 포함된 문자열
select * from emp where  ename like 'k___';             -- k로 시작하는 4글자
select * from emp where  ename like 's\_%' escape '\';  
select * from emp;



--  ==========================================================================================   

CREATE TABLE employees
  (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR( 255 ) NOT NULL,
    last_name  VARCHAR( 255 ) NOT NULL,
    email      VARCHAR( 255 ) NOT NULL,
    phone      VARCHAR( 50 ) NOT NULL ,
    hire_date  DATE NOT NULL          ,
    manager_id NUMBER( 12)        , 
    job_title  VARCHAR( 255 ) NOT NULL
    
  );

Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE,HIRE_DATE,MANAGER_ID,JOB_TITLE) values (1,'Summer','Payne','summer.payne@example.com','515.123.8181',to_date('07-06-16','DD-mm-RR'),106,'Public Accountant');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE,HIRE_DATE,MANAGER_ID,JOB_TITLE) values (2,'Rose','Stephens','rose.stephens@example.com','515.123.8080',to_date('07-06-16','DD-mm-RR'),2,'Accounting Manager');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE,HIRE_DATE,MANAGER_ID,JOB_TITLE) values (3,'Annabelle','Dunn','annabelle.dunn@example.com','515.123.4444',to_date('17-09-16','DD-mm-RR'),2,'Administration Assistant');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE,HIRE_DATE,MANAGER_ID,JOB_TITLE) values (4,'Tommy','Bailey','tommy.bailey@example.com','515.123.4567',to_date('17-06-16','DD-mm-RR'),null,'President');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE,HIRE_DATE,MANAGER_ID,JOB_TITLE) values (5,'Blake','Cooper','blake.cooper@example.com','515.123.4569',to_date('13-01-16','DD-mm-RR'),1,'Administration Vice President');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE,HIRE_DATE,MANAGER_ID,JOB_TITLE) values (6,'Jude','Rivera','jude.rivera@example.com','515.123.4568',to_date('21-10-16','DD-mm-RR'),1,'Administration Vice President');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE,HIRE_DATE,MANAGER_ID,JOB_TITLE) values (7,'Tyler','Ramirez','tyler.ramirez@example.com','515.124.4269',to_date('28-10-16','DD-mm-RR'),9,'Accountant');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE,HIRE_DATE,MANAGER_ID,JOB_TITLE) values (8,'Ryan','Gray','ryan.gray@example.com','515.124.4169',to_date('16-08-16','DD-mm-RR'),9,'Accountant');



-- //                                       //
-- //   정렬 & 집합연산                       //
-- //   order by                            //
-- //   union, union all, intersect, minus  // 
-- //                                       //


-- //  1) ORDER BY 
-- * ASC : 오름차순 (기본)
-- * DESC : 내림차순

SELECT      first_name, last_name 
FROM        employees
ORDER BY    first_name;

SELECT first_name, last_name
FROM employees
ORDER BY first_name DESC;

-- // 2) UNION - 합집합 (중복 제외)
SELECT employee_id, first_name
FROM employees
WHERE employee_id <= 6
    UNION
SELECT employee_id, first_name
FROM employees
WHERE employee_id >= 4;

-- // 3) UNION ALL - 합집합 (중복 포함)
SELECT employee_id, first_name
FROM employees
WHERE employee_id <= 6
    UNION ALL
SELECT employee_id, first_name
FROM employees
WHERE employee_id >= 4;

-- // 4) MINUS - 차집합
SELECT employee_id, first_name
FROM employees
WHERE employee_id <= 6
    MINUS
SELECT employee_id, first_name
FROM employees
WHERE employee_id >= 4;

-- // 5) INTERSECT - 교집합
SELECT employee_id, first_name
FROM employees
WHERE employee_id <= 6
    INTERSECT
SELECT employee_id, first_name
FROM employees
WHERE employee_id >= 4;

--  ==========================================================================================  

-- //         //
-- //   함수   //
-- //         //


-- // 1) 문자함수

-- LOWER() 소문자로 변환 
-- >> LOWER('SUAN') -- suan

-- UPPER() 대문자로 변환 
-- >> UPPER('suan') --SUAN

-- INITCAP() 첫 문자만 대문자로 변환 
-- >> INITCAP('suan') --Suan

-- SUBSTR() 일부 문자열만 추출 
-- >> ('Suan', 1, 2) --Su

-- REPLACE() 특정 문자열을 찾아 바꾸기 
-- >> REPLACE('Suan', 'u', 'e') --Sean

-- CONCAT() 두 문자열 연결 
-- >> CONCAT('Suan', 'Lee') --SuanLee

-- LENGTH() 문자열 길이 
-- >> LENGTH('Suan') --4

-- INSTR() 문자열 위치 
-- >> INSTR('Suan', 'a') --3

-- LPAD() 왼쪽부터 특정 문자로 채움 
-- >> LPAD('Suan', 7, '*') --***Suan

-- RPAD() 오른쪽부터 특정 문자로 채움 
-- >> RPAD('Suan', 7, '*') --Suan***

-- LTRIM() 왼쪽 특정 문자를 지움 
-- >> LTRIM('Suan', 'Su') --an

-- RTRIM() 오른쪽 특정 문자를 지움 
-- >> RTRIM('Suan', 'an') --Su


-- // 2) 숫자함수

-- CEIL() 정수 올림 
-- >> CEIL(12.345) -- 13

-- FLOOR() 정수 내림 
-- >> FLOOR(12.345) -- 12

-- ROUND() 반올림 
-- >> ROUND(12.345, 0) -- 12

-- TRUNC() 절삭 
-- >> TRUNC(12.345, 1) -- 12.3

-- MOD() 나눈 나머지 
-- >> MOD(12, 5) -- 2

-- SIGN() 양수, 음수, 0 구분 
-- >> SIGN(12) -- 1

-- POWER() 거듭제곱 
-- >> POWER(3, 3) -- 27

-- SQRT() 제곱근 
-- >> SQRT(4) -- 2



-- // 3) 집계함수

-- COUNT()      -- 행의 개수 
-- SUM()        -- 합계
-- AVG()        -- 평균
-- MIN()        -- 최솟값
-- MAX()        -- 최댓값 
-- STDDEV()     -- 표준편차 
-- VARIANCE()   -- 분산 



-- // 4) 형변환 함수

-- cast()       -- 단순한 데이터 타입 변환에 사용하기 편함
CASE(형변환할 컬럼 AS 변환할타입);

-- to_number()
select to_number('512') from dual;      -- (결과) 512 (데이터형 : 숫자)

-- 날짜 -> 문자 : to_char()
select sysdate from dual;
select to_char(sysdate, 'yyyy') from dual;
select to_char(sysdate, 'yyyy-mm-dd') from dual;

-- 문자 -> 날짜 : to_date()
select to_char(to_date('20201205111701', 'yyyymmddhh24miss'), 'yyyy/mm/dd hh:mm:ss')as one,
to_date('20200505090101', 'yyyymmddhhmiss') as two from dual;

--  ==========================================================================================   



-- //                    //
-- //   sequence 시퀀스   //
-- //                    //


-- * auto_increment (mySql)


-- // 테이블 데이터 초기화
truncate table nboard;


create table nboard (
unq number not null primary key,
title varchar2(100) not null,
pass varchar2(100) not null,
name varchar2(20),
content varchar2(4000),
hits number default 0,
rdate timestamp);

-- // 시퀀스 생성
create sequence     nboard_seq   -- 시퀀스 이름
increment by            1        -- 증가값
start with              1        -- 시작값
maxvalue              9999;      -- 최대값

-- // 시퀀스 생성 후 데이터 삽입 
-- // 시퀀스.nextval : 시퀀스 다음값
insert into nboard (unq, title, pass, name, rdate)
        values(nboard_seq.nextval, 'aaa', '1111', '홍길동', sysdate);
insert into nboard (unq, title, pass, name, rdate)
        values(nboard_seq.nextval, 'bbb', '2222', '이순신', sysdate);
        
        
-- 시퀀스 확인
select nboard_seq.currval from dual;



--  ==========================================================================================   

-- //               //
-- //   WITH        //
-- //   보조쿼리문    //


WITH
   name_for_summary_data AS (
      SELECT Statement)
   SELECT columns
   FROM name_for_summary_data
   WHERE conditions <=> (
      SELECT column
      FROM name_for_summary_data)
   [ORDER BY columns];
   
   
-- // WITH절 생성 
WITH emp_with AS 
(
    SELECT deptno, SUM(sal) AS sal 
    FROM emp 
    GROUP BY deptno
)

-- // WITH절 사용 example
SELECT a.deptno, b.name, c.sal
FROM emp_with a , dept b 
WHERE a.deptno = b.deptno 






--  ==========================================================================================   
 
-- //              //
-- //    HAVING    //
-- //              //

-- // group by 절에 의해 생성된 그룹에 조건을 지정

-- * GROUP BY와 함께 사용

SELECT NAME FROM COMPANY GROUP BY name HAVING count(name) > 1;





--  ==========================================================================================   
 
-- //                //
-- //    DISTINCT    //
-- //                //
  

SELECT DISTINCT column1, column2, ...
FROM table_name;






--  ==========================================================================================   

-- //          //
-- //   JOIN   //
-- //          //

-- * on       : join 전에 조건을 필터링
-- * where    : join 후에 조건을 필터링



-- //  Equi join (등가조인)   

select  emp.empno,
        emp.ename,
        emp.deptno,
        dept.dname
from
        emp, dept           
where 
        emp.deptno = dept.deptno;
        

        
-- // non-equal join (비 등가조인)  
-- // 사원명, 급여, 등급 조회

select  e.ename,
        e.sal,
        s.grade
from
        emp e, salgrade s
where   
        e.sal between s.losal and s.hisal;
        
        
-- // outer join   

select  e.empno,
        e.ename,
        e.deptno,
        d.dname
from
        emp e, dept d
where
        -- e.deptno = d.deptno;
        e.deptno(+) = d.deptno;
        
-- 부족한 부분에 (+)를 붙이면 일반조인에서 나타나지 않은 부분이 출력됨



-- // self join   
-- // 사원이름, 매니저 이름

select ename, mgr from emp;


select  e.ename,
        e.mgr,
        m.ename
from    
        emp e, emp m
where   
        e.mgr = m.empno;
        
-- ex) 연결연산자 이용
select 
        e.ename || '의 상사는 ' || m.ename || '이다' as 직속상사관계  -- mysql에서는 as다음에 ''를 붙여야함
from
        emp e, emp m
where 
        e.mgr = m.empno;


-- //  연결 연산자  //

select
        ename || ',' || job from emp;
-- * mySql : select concat (ename, ',', job) from emp;


-- //  in 
-- // 여러개의 데이터 값을 지정하여 일치하는 데이터만 출력할 때 사용

select ename, deptno from emp where deptno = 10 or deptno = 20;
select ename, deptno from emp where deptno in (10, 20);



--  ==========================================================================================  


-- //                               //
-- //  트랜잭션                      //
-- //  commit, rollback, savepoint  //
-- //                               //


rollback to sp1;
savepoint sp1;



--  ==========================================================================================   


-- //                        //
-- //   view table 뷰테이블   //
-- //                        //

-- // 사용권한 세팅
-- (뷰테이블 사용을 위해서는 권한이 필요)


-- (1)cmd에서 관리자 모드 접근
-- >> sqlplus 아이디/비밀번호 as sysdba

-- (2) 사용자 계정에 뷰 생성권한 부여
-- >> grant create view to 사용자명     
-- >> exit

-- ----------------------------------------

-- // 뷰 생성
create or replace view v_emp_dept10 as
    select empno, ename, sal from emp where deptno = 10;
    
select * from v_emp_dept10;

-- // (연습)
select * from emp order by sal desc;

select rownum, emp.* from emp order by sal desc;     -- rownum이 뒤죽박죽 됨 -> 이중 셀렉트 사용
select rownum, a.* from (
    select emp.* from emp order by sal desc) a;        -- rownum이 그냥 출력됨    
select b.* from (
    select rownum , a.* from (
            select emp.* from emp order by sal desc) a) b;      -- rownum 컬럼화 (범위 출력을 위함)


--  ==========================================================================================   



-- //                               //
-- //  null 값 함수 - nvl(), nvl2()  //
-- //                               //

select ename, mgr from emp;     -- (결과) king / null

-- 1) nvl() : 실행 컬럼 필드 값이 null 인 경우만 처리
-- nvl(필드값, 세팅값)
-- select ename, nvl(mgr, '없음') from emp;   -- mysql에서는 허용되나, 오라클에서는 오류 발생

select ename, nvl(mgr, 0) from emp;

select ename, sal, comm from emp;

-- 2) nvl2(필드값, 처리1, 처리2)
-- ex) null : 0 / !null : +100 일때,
select ename, (sal + comm) from emp;
select ename, (sal + nvl(comm, 0)) from emp;
select ename, (sal + nvl2(comm, 0, +100)) from emp;





--  ==========================================================================================   


-- //                        //
-- //   decode() - 조건함수   //
-- //                        //

-- decode(컬럼명, 비교값1, 치환값1, 비교값2, 치환값2, ...)

select ename,
        decode ( deptno, 10, '회계', 20, '조사', 30, '영업', 40, '기획') || '팀' as 팀명
    from emp;



--  ==========================================================================================   


-- //                         //
-- //   FOREIGN KEY - 외래키   //
-- //                         //

-- 외래키 설정
-- : constraint 외래키별칭 foreign key(컬럼명) references 외래테이블명(컬럼명)

-- 외래키 제약조건 삭제
alter table jumsu drop constraint jumsu_pk;

-- cascade : 두 테이블을 연결해서 pk를 가지고 있는 쪽의 값을 삭제하면 fk로 연결된 값이 동시에 삭제됨
alter table jumsu add constraint jumsu_pk2 foreign key(userid) references student(userid) on delete cascade;




-- ------------------------------------------------




-- //                         //
-- //    procedure 프로시저    //
-- //                         //
-- * sql과 별도로 독립적으로 실행됨

-- 프로시저 내 테이블 생성
CHK NUMBER := 0;


-- 사원번호를 입력받아 급여를 출력하는 프로시저
create or replace procedure procempsal
    (v_empno in number)     -- 매개변수
is 
    v_sal number;           -- begin에서 사용할 변수
    
begin
    select sal into v_sal from emp where empno  = v_empno;
    dbms_output.put_line(v_sal);
end;
/



-- 사번을 입력받아 사원의 이름과 급여 출력
create or replace procedure procempsal
    (v_empno in number)     -- 매개변수
is 
    v_sal number;           -- begin에서 사용할 변수
    v_ename varchar2(100);
    
begin
    select ename, sal into v_ename, v_sal from emp where empno = v_empno;
    dbms_output.put_line(v_ename || ' : ' || v_sal);
end;
/

-- 사원번호 입력하면 급여 50%인상
create or  replace procedure procSalUpdate 
        (v_empno emp.empno%type)
is
begin 
    update emp set sal = sal + 100 where empno = v_empno;
    dbms_output.put_line('변경완료');   -- 출력
end;

/



-- ------------------------------------------------


-- //                    //
-- //   function - 함수   
-- //                    //


-- 함수 생성
-- 사번을 입력받아 사원의 이름과 급여 출력
/*
create or replace function fnempsal
    (v_empno in number)    
    return number
is 
    v_sal number;           
  
begin
    select sal into v_sal from emp where empno = v_empno;
    return v_sal;
end;
*/
-- // 함수 사용
select fnempsal(7788) from dual;



-- ------------------------------------------------


-- //                //
-- //   index 인덱스  //
-- //                //


-- // 인덱스 조회
select * from user_indexes;
select * from user_indexes where table_name = 'employees';

-- // 인덱스 컬럼 조회
select * from user_ind_columns;

-- // 인덱스 사용여부
select * from emp where employee_id = 100;



-- (연습) youtube '이수안컴퓨터연구소' - 오라클 제대로 끝내기 15. 인덱스 index
-- https://www.youtube.com/watch?v=snrH1RenHXY&list=PL7ZVZgsnLwEEDr612UQtAdbhEXVgRniaU&index=15

create table customers(
customer_id number not null primary key,
first_name varchar2(10) not null,
last_name varchar2(10) not null,
email varchar(10),
phone varchar(20),
regist_date date);

insert into customers values (1, 'suan', 'lee', 'suan', '010-1234-1234', '21/01/01');
insert into customers values (2, 'elon', 'musk', 'elon', '010-1111-2222', '21/05/01');
insert into customers values (3, 'steve', 'jobs', 'steve', '010-3333-4444', '21/10/01');
insert into customers values (4, 'bill', 'gates', 'bill', '010-5555-6666', '21/11/01');
insert into customers values (5, 'mark', 'zuckeberg', 'mark', '010-7777-8888', '21/11/01');

select * from customers;

-- // 인덱스 조회
select * from user_indexes where table_name = 'CUSTOMERS';      -- tabl_name 은 대문자로 해야 조회

select * from customers where regist_date = '21/01/01';

-- // 인덱스 생성
create index regist_date_idx on customers(regist_date);

-- // 다중 속성 인덱스 
create index name_idx on customers (first_name, last_name);

select * from customers where first_name = 'suan';

-- // 고유한 인덱스 - unique
select * from customers where email = 'suan'; 
create unique index email_idx on customers (email);

-- // 인덱스 삭제
drop index regist_date_idx;
drop index email_idx;       -- unique 인덱스도 바로 삭제됨

drop table customers;       -- table을 삭제하면 해당 인덱스도 함께 삭제된다.


-- ------------------------------------------------


-- //           //
-- //   MERGE   //
-- //           //

/*
MERGE
INTO    테이블/뷰
USING   테이블/뷰/서브쿼리
ON      조건절
WHEN MATCHED THEN   -- 일치하는 경우 update/ delete
    UPDATE SET .....
    DELETE ....
WHEN NOT MATCHED THEN   -- 불일치하는 경우 insert
    INSERT 컬럼명 VALUES 데이터

*/




-- ------------------------------------------------


-- //                 //
-- //   SELECT INTO   //
-- //                 //

-- // 한 테이블에서 새로운 테이블로 정보를 복사할 때 사용

select first_name, last_name into emp_backup from employees;

-- 저장 프로시저에서만 사용되기 때문에 일반 쿼리에서 사용하려면 into를 제거하거나 as로 변경하여야함
select first_name, last_name as emp_backup from employees;  
