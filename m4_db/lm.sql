--DEMOGRAPHIC DATA
select *
from demo
order by "����ȣ";

--���޻纰 ����� �̿���Ȳ
select * from compet;

--�����
SELECT * FROM membership;

--��ǰ�з�
select * from prodcl;

--���ŵ�����
select count(*) from purprod;
select * from purprod;

--�����հ�
select sum(���űݾ�)
from purprod;

--PURPROD ����
create table purprod1 as select * from purprod;

--������ �����հ�
alter table purprod1 add year date;
alter table purprod1 modify year varchar2(20);
update purprod1 set year=substr(��������,1,4);
commit;

select year, sum(���űݾ�) ���ž�
from purprod1
group by year;

--���� �����հ�
select ����ȣ, sum(���űݾ�) ���ž�
from purprod1
group by ����ȣ
order by ����ȣ;

--���� ���޻纰 ���� �հ�
select ����ȣ, ���޻�, sum(���űݾ�) ���ž�
from purprod1
group by ����ȣ, ���޻�
order by ����ȣ;

--���� ���޻纰 ��ǰ��з� ���� �հ�
select ����ȣ, ���޻�, ��з��ڵ�, sum(���űݾ�) ���ž�
from purprod1
group by ����ȣ, ���޻�, ��з��ڵ�
order by ����ȣ;

select ����, sum(���űݾ�) from demo d
join purprod p on d.����ȣ = p.����ȣ
group by ����;

--����8_0511. lm ������ ���̺� 6���� l���� ���� ��Ȳ�� �ľ��� �� �ִ� ��� ���̺��� 5�� �̻� �����ϰ� �����ϼ���.
