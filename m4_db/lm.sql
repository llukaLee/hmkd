--DEMOGRAPHIC DATA
select *
from demo
order by "고객번호";

--제휴사별 경쟁사 이용현황
select * from compet;

--멤버십
SELECT * FROM membership;

--상품분류
select * from prodcl;

--구매데이터
select count(*) from purprod;
select * from purprod;

--구매합계
select sum(구매금액)
from purprod;

--PURPROD 복사
create table purprod1 as select * from purprod;

--연도별 구매합계
alter table purprod1 add year date;
alter table purprod1 modify year varchar2(20);
update purprod1 set year=substr(구매일자,1,4);
commit;

select year, sum(구매금액) 구매액
from purprod1
group by year;

--고객별 구매합계
select 고객번호, sum(구매금액) 구매액
from purprod1
group by 고객번호
order by 고객번호;

--고객별 제휴사별 기준 합계
select 고객번호, 제휴사, sum(구매금액) 구매액
from purprod1
group by 고객번호, 제휴사
order by 고객번호;

--고객별 제휴사별 상품대분류 기준 합계
select 고객번호, 제휴사, 대분류코드, sum(구매금액) 구매액
from purprod1
group by 고객번호, 제휴사, 대분류코드
order by 고객번호;

select 성별, sum(구매금액) from demo d
join purprod p on d.고객번호 = p.고객번호
group by 성별;

--과제8_0511. lm 데이터 테이블 6개로 l사의 비즈 현황을 파악할 수 있는 요약 테이블을 5개 이상 생성하고 설명하세요.
