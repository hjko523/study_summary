-- 1. 절대 값 리턴 함수
    select abs(-100);	 -- (결과) 100	

-- 2. 주어진 인수 값 중 가장 작은 값 리턴 함수				
    select least(70,20,30);	  --  (결과) 20	

-- 3. 주어진 인수 값 중 가장 큰 값 리턴 함수	
    select greatest(70,20,30);   -- (결과) 70

-- 4. 반을림 리던 함수			
    select round(1.58); 		--  (결과) 2	

-- 5. 주어진 값 보다 큰 최소 정수				
    select ceil(3.3);			--  (결과) 4	

-- 6. 주어진 값 보다 작은 최대 정수				
    select floor(3.3);		--   (결과) 3		

-- 7. 나머지 값 리턴 함수 - 나누기 연산 후의 나머지 값				
    select mod(35,10); 		--  (결과) 5

-- 8. 문자를의 길이 리턴 함수 
    select length('academy');	--  (결과) 7

-- 9. 문자열 자르기 함수 (left) - 왼쪽 기준으로 
    select left('academy',3);		--  (결과) aca	

-- 10. 문자열 자르기 함수 (right) - 오른쪽 기준으로 자르기				
    select right('academy',3); 		-- (결과) emy	

-- 11. 문자열 자르기 함수 (substring) - 지정 위치에서 지정 길이만큼 보여 준다. (1번부터) 
    select substring('academy',1,3); 	-- (결과) aca 

-- 12. 문자열 자르기 함수 (substring) - 지정 위치에서 지정 길이만큼 보여 준다.				
     select concat('my' ,'sql');		--  (결과) mysql

-- 13. 문자열 암호화 함수 , 
     select password('1234');  			

-- 14. 지정된 길이의 부족한 공간을 지정된 문자로 완쪽기준으로 채우기				
     select Ipad('mysql',7,'*');		--  (결과) **mysql		

-- 15. 지정된 길이의 부족한 공간을 지정된 문자로 오른쪽 기준으로 채우기				
     select rpad('mysql' ,7,'*');  	--  (결과) mysql**

-- 6. 대문자 영문자를 소문자로 전환 
     select Icase('MYSQL'); 	--  (결과) mysql 

-- 17. 대문자 영문자를 대문자로 전한 
     select ucase('MySQL');	 	--   (결과) MYSQL			
				
				
