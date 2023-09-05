select * from book;
-- Q. ��� ������ �����̸�, ���ǻ縦 �˻��Ͻÿ�.
SELECT bookname, publisher
FROM book;

-- Q. ��� ������ ������ȣ, �����̸�, ���ǻ�, ������ �˻��Ͻÿ�.
SELECT	bookid, bookname, publisher, price
FROM	Book;

--�ߺ� ����
SELECT DISTINCT publisher
FROM book;

--������ 10,000�� �̻��� ����
select * 
from book
where price >= 10000;

--Q. ������ 10,000�� �̻� 20,000 ������ ������ �˻��Ͻÿ�.
SELECT * 
FROM book
where price >= 10000 and price <= 20000;

SELECT * 
FROM book
where price between 10000 and 20000;

--Q. ���ǻ簡 ���½������� Ȥ�� �����ѹ̵� �� ������ �˻��Ͻÿ�.
select * from book
where publisher='�½�����' or publisher='���ѹ̵��';

select * from book
where publisher in('�½�����','���ѹ̵��');

--Q. ���ǻ簡 ���½������� Ȥ�� �����ѹ̵��� �ƴ� ������ �˻��Ͻÿ�.
SELECT * FROM book
WHERE publisher not in('�½�����','���ѹ̵��');

SELECT bookname, publisher 
FROM book
WHERE bookname LIKE '�౸�� ����';

--å�̸��� '�౸'�� ���ԵǾ� �ִ� ������ �˻��Ͻÿ�.
SELECT * FROM book
WHERE bookname LIKE '%�౸%';

--Q. �����̸��� ���� �� ��° ��ġ�� ��������� ���ڿ��� ���� ������ �˻��Ͻÿ�.
SELECT * FROM book
WHERE bookname LIKE '%_��%';

--Q. �౸�� ���� ���� �� ������ 20,000�� �̻��� ������ �˻��Ͻÿ�.
select * from book
where bookname like'%�౸%' and price>=20000;

--����(default �ø�����)
select * 
from book
order by bookname desc;

--Q. ������ ���ݼ����� �˻��ϰ�, ������ ������ �̸������� �˻��Ͻÿ�
select *
from book
order by price, bookname;

--Q. ������ ������ ������������ �˻��Ͻÿ�. ���� ������ ���ٸ� ���ǻ��� ������������ ����Ͻÿ�.
select * 
from book
order by price desc, publisher;

select * from orders;

select sum(saleprice) as "�� ����"
from orders;

--Q. custid 2�� �迬�� ���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�.
select sum(saleprice)
from orders
where custid = 2;

--����1_0508. orders ���̺��� saleprice�� �հ�, ���, �ּҰ�, �ִ밪�� ���ϼ���.
select sum(saleprice), AVG(saleprice), min(saleprice), max(saleprice)
from orders;

--����2_0508. orders ���̺��� ��������, ���Ǹž��� ���ϼ���.
SELECT count(*) AS "��������", SUM(saleprice) AS "���Ǹž�"
FROM orders;

--����3_0508. ������ 8,000�� �̻��� ������ ������ ���� ���Ͽ� ���� �ֹ� ������ �� ������ ���Ͻÿ�. 
--��, �� �� �̻� ������ ���� ���Ͻÿ�.
--having���� group by���� �Բ� ���Ǿ� �׷�ȭ�� ��� ������ ���͸��ϴµ� ����.
--where ���տ� ���� ������ �����ϴ� �ݸ� having���� �����Լ� ����� ���� ������ ����
select custid as "��id", count(*) as "�ֹ� ���� ����"
from orders
where saleprice>=8000
group by custid
having count(*)>=2;

select * 
from customer, orders
where customer.custid=orders.custid
order by orders.custid;

--Q. ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻��Ͻÿ�.
select c.custid,o.custid, name, saleprice
from customer c, orders o
where c.custid=o.custid;

--����4_0508. ������ �ֹ��� ��� ������ �� �Ǹž��� ���ϰ�, ������ �����Ͻÿ�.
select custid, sum(saleprice) as "�հ�" 
from orders group by custid order by custid;

--����5_0508. ���� �̸��� ���� �ֹ��� ������ �̸��� ���Ͻÿ�.
select c.name, b.bookname
from customer c, orders o, book b
where c.custid=o.custid and b.bookid=o.bookid;

--����6_0508. ������ 20000���� ������ �ֹ��� ���� �̸��� ������ �̸��� ���Ͻÿ�.
select c.name, b.bookname 
from customer c, orders o, book b 
where c.custid =  o.custid and b.bookid = o.bookid and o.saleprice = 20000;

-- JOIN : inner join vs outer join
select c.custid, o.custid, c.name, o.saleprice
from customer c, orders o
where c.custid = o.custid;

select c.custid,o.custid, c.name, o.saleprice
from customer c, orders o
where c.custid=o.custid(+);

select c.custid,o.custid, c.name, o.saleprice
from customer c left outer join orders o on c.custid=o.custid;

--�μ� ����
--���� ��� ������ �̸��� ����ϼ���.
select bookname,price
from book
where price=(select MAX(price) from book);

--Q. ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�.
select * from orders;
select * from customer;
select name 
from customer 
where custid in (select custid from Orders);

--����7_0508. '���ѹ̵��'���� ������ ������ ������ ���� �̸��� �˻��Ͻÿ�.
select name
from customer
where custid in (select custid from orders
where bookid in (select bookid from book
where publisher = '���ѹ̵��'));

--����8_0508. ���ǻ纰�� ���ǻ��� ��� ���� ���ݺ��� ��� ������ �˻��Ͻÿ�.
select b1.bookname , b1.price, b1.publisher
from book b1
where b1.price > (select avg(price) 
from book b2 where b2.publisher=b1.publisher);

--����9_0508. ������ �ֹ����� ���� ���� �̸��� �˻��Ͻÿ�.
select name
from customer
minus
select name
from customer
where custid in (select custid from orders);

--����10_0508. �ֹ��� �ִ� ���� �̸��� �ּҸ� �˻��Ͻÿ�.
select name, address
from customer
where custid in (select custid from orders);

select name, address
from customer cs
where exists ( select * from orders od
where cs.custid = od.custid);

-- ���
select ABS(-78), ABS(+78)from dual;
select Round(4.875, 1) from dual;

-- ���� ��� �ֹ� �ݾ��� ��� ������ �ݿø��� ���� ���Ͻÿ�.
select custid, ROUND(avg(saleprice), -2) as "��� ����"
from orders
group by custid;

select c.name, round(avg(saleprice), -2) as "��� ����"
from orders o, customer c
where o.custid = c.custid
group by name;

select custid, round(avg(saleprice),-2) as "��� ����"
from orders
group by custid;

-- ���� ���� '�߱�'�� ���Ե� ������ '��'�� ������ �� ���� ���, ������ ���Ͻÿ�.
select bookid, replace(bookname, '�߱�','��') as bookname, price
from book;

-- '�½�����' ���� ������ ������ ����� ������ ���� ��, ����Ʈ ���� ���Ͻÿ�.
select bookname, length(bookname) as "���� ����", lengthb(bookname) as "����Ʈ ��", publisher
from book
where publisher = '�½�����';

-- ������ �Է�
select * from customer;
insert into customer values ( 6, '����ȣ', '���ѹα� ����', null);

-- ���缭���� �� �߿��� ���� ����  ���� ����� �� ���̳� �Ǵ��� �� �� �ο����� ���Ͻÿ�.
select substr(name, 1, 1) as ��, count(substr(name,1, 1)) as ��
from customer
group by substr(name, 1, 1);

-- ���缭���� �ֹ��Ϸκ��� 10�� �� ������ Ȯ���Ѵ�. �� �ֹ��� Ȯ�����ڸ� ���Ͻÿ�.
SELECT orderid, custid, bookid, saleprice, to_char(orderdate + 10, 'yyyy-mm-dd day') "Ȯ������"
FROM orders;

-- ���� ��¥
select sysdate from dual;
-- to_char �Լ��� ����Ͽ� sysdate ���� ���ڿ� �������� ��ȯ
select sysdate, to_char(sysdate, 'yyyy/mm/dd dy hh24:mi:ss') sysdate1 from dual;

select * from orders;
--����1_0509.���缭���� 2020�� 7�� 7�Ͽ� �ֹ����� ������ �ֹ���ȣ, �ֹ���, ����ȣ, ������ȣ�� 
--��� ���ϼ���. ��, �ֹ����� ��yyyy-mm-dd ���ϡ� ���·� ǥ���Ѵ�.
select orderid, orderdate, custid, bookid
from orders
where orderdate = '20/07/07';

--����2_0509.Q.DBMS ������ ������ ���� ��¥�� �ð�, ������ Ȯ���Ͻÿ�.
select sysdate from dual;

select * from customer;
--����3_0509. �̸�, ��ȭ��ȣ�� ���Ե� ������� ���̽ÿ�. ��, ��ȭ��ȣ�� ���� ���� ������ó���������� 
--ǥ���ϼ���.(NVL �Լ��� ���� NULL�� ��� �������� ����ϰ�, NULL�� �ƴϸ� ���� ���� �״�� ����Ѵ�.
--�Լ�  :  NVL("��", "������") 
select name as �̸�, nvl(phone, '����ó����') as ����ó
from customer;

--����4_0509. ����Ͽ��� ����ȣ, �̸�, ��ȭ��ȣ�� ���� �� �� ���̼���.
select custid, name, phone
from customer
FETCH FIRST 2 ROWS ONLY;
--FETCH FIRST 2 ROWS ONLY = WHERE ROWNUM <=2

select * from orders;
--����5_0509. ��� �ֹ��ݾ� ������ �ֹ��� ���ؼ� �ֹ���ȣ�� �ݾ��� ���̼���.
select orderid, saleprice
from orders
where saleprice < (select avg(saleprice) from orders);

--����6_0509. �� ���� ��� �ֹ��ݾ׺��� ū �ݾ��� �ֹ� ������ ���ؼ� �ֹ���ȣ, ����ȣ, �ݾ��� ���̽ÿ�.
select orderid, custid, saleprice
from orders
WHERE saleprice > (
  SELECT AVG(saleprice) AS avg_saleprice
  FROM orders o2
  WHERE o2.custid = orders.custid
  GROUP BY custid
);

select * from customer;
select * from orders;

--����7_0509.�����ѹα����� �����ϴ� ������ �Ǹ��� ������ �� �Ǹž��� ���ϼ���.
select sum(saleprice)
from orders
where orders.custid in 
(select custid
from customer
where address like '%���ѹα�%')
group by orders.custid;

--����8_0509. 3�� ���� �ֹ��� ������ �ְ� �ݾ׺��� �� ��� ������ ������ �ֹ��� �ֹ���ȣ�� �ݾ��� ���̽ÿ�.
select orderid �ֹ���ȣ, saleprice �ݾ�
from orders
where salepricd > (select max(saleprice) from orders where custid=3)

--����9_0509. EXISTS �����ڸ� ����Ͽ� �����ѹα����� �����ϴ� ������ �Ǹ��� ������ �� �Ǹž��� ���Ͻÿ�.
select sum(saleprice) as "���Ǹž�"
from customer c, orders o
where exists ( select address from customer where address like '%���ѹα�%' and c.custid=o.custid);

--����10_0509. ���缭���� ���� �Ǹž��� ���̽ÿ�(���̸��� ���� �Ǹž� ���)
select * from order
;
select c.name ���̸�, nvl(sum(o.saleprice),0) "���� �Ǹž�"
from customer c, orders o
where c.custid = o.custid(+)
group by c.name;

SELECT (SELECT name FROM customer C WHERE C.custid=O.custid) name,
SUM(saleprice) total FROM orders O
GROUP BY O.custid;

--update set
update customer
set phone='010-1234-5678'
where custid=1;

--����11_0509. ����ȣ�� 2 ������ ���� �Ǹž��� ���̽ÿ�(���̸��� ���� �Ǹž� ���)
select cs.name, sum(od.saleprice) total
from (select custid, name
from customer
where custid <=2) cs, oredrs od
where cs.custid=od.custid
group by cs.name;

-- View�� ������ ���̺��̶�� �ߴµ�, ���״�� �����ʹ� ����, SQL�� ����Ǿ��ִ� object
--������� ���� �⺻ ���̺��� �⺻Ű(�Ӽ�)�� �����Ͽ� �並 �����ϸ� ����, ����, ����, ������ ���� �մϴ�. 
--���� �ѹ� ���ǰ� �� ���� ��� �ٸ� ���� �⺻ �����Ͱ� �� �� ������, �信 ���ǵǾ� �ִ� �⺻ ���̺��̳� �並 ���� �ϰ� �Ǹ� 
--�ش� �����͸� ���ʷ��� �ٸ� ����� �ڵ����� ������ �˴ϴ�.�信���� ALTER ��ɾ ��� �� �� �����ϴ�.
select * from customer;
--Q.�ּҿ� '���ѹα�'�� �����ϴ� ����� ������ �並 ����� ��ȸ�Ͻÿ�. ���� �̸��� vw_Customer�� �����Ͻÿ�.
create view vw_customer
as select *
from customer
where address like '%���ѹα�%';

select * from vw_customer;

drop view vw_customer;