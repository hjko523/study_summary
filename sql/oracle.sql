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



-- //       //
-- // JOIN  //
-- //       //

-- * on       : join 전에 조건을 필터링
-- * where    : join 후에 조건을 필터링



-- //  Equi join (등가조인)   //

select  emp.empno,
        emp.ename,
        emp.deptno,
        dept.dname
from
        emp, dept           
where 
        emp.deptno = dept.deptno;
        

        
-- // non-equal join (비 등가조인)  //
-- // 사원명, 급여, 등급 조회

select  e.ename,
        e.sal,
        s.grade
from
        emp e, salgrade s
where   
        e.sal between s.losal and s.hisal;
        
        
-- // outer join   //

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



-- // self join   //
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


-- //  in  //

select ename, deptno from emp where deptno = 10 or deptno = 20;
select ename, deptno from emp where deptno in (10, 20);


--  ==========================================================================================   

-- //        //
-- //  date  //
-- //        //

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

-- //                               //
-- //  트랜잭션                      //
-- //  commit, rollback, savepoint  //
-- //                               //


rollback to sp1;
savepoint sp1;

--  ==========================================================================================   

-- //                 //
-- //  sequence 시퀀스 //
-- //                 //
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


-- //                      //
-- //  view table 뷰테이블  //
-- //                      //

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
-- null : 0 / !null : +100
select ename, (sal + comm) from emp;
select ename, (sal + nvl(comm, 0)) from emp;
select ename, (sal + nvl2(comm, 0,+100)) from emp;





--  ==========================================================================================   


-- //                      //
-- //  decode() - 조건함수  //
-- //                      //

-- decode(컬럼명, 비교값1, 치환값1, 비교값2, 치환값2, ...)

select ename,
        decode ( deptno, 10, '회계', 20, '조사', 30, '영업', 40, '기획') || '팀' as 팀명
    from emp;



--  ==========================================================================================   


-- //                       //
-- //  foreign key - 외래키  //
-- //                       //

-- 외래키 설정
-- : constraint 외래키별칭 foreign key(컬럼명) references 외래테이블명(컬럼명)

-- 외래키 제약조건 삭제
alter table jumsu drop constraint jumsu_pk;

-- cascade : 두 테이블을 연결해서 pk를 가지고 있는 쪽의 값을 삭제하면 fk로 연결된 값이 동시에 삭제됨
alter table jumsu add constraint jumsu_pk2 foreign key(userid) references student(userid) on delete cascade;



--  ==========================================================================================   


-- //                      //
-- //   procedure 프로시저  //
-- //                      //
-- * sql과 별도로 독립적으로 실행됨


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


-- //                  //
-- //   function 함수  //
-- //                  //


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