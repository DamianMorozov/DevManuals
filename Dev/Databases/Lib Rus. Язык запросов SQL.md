# ���� �������� SQL

## ���� 1. �������� � SQL
1974�. IBM � ����� ����������.
SEQUEL - Structured English Query Language
ANSI - American National Standards Institute
ISO - International Standards Organization
�������� ����� - ����������������� ����� ��� ������������ �������������
����� - ����� �����������, ������� ��������������� �����, ���������� �������� �����
����������� - �����������, ������� ��������������� �������������
�������� (���������) - ���������� ���������, ���������� ���������� ��������������� �����
- �������� ���������� �����: '������'
- �������� �������� �����: X'00FF'
- �������� ��������: 11, 99.85, 11.22E12
- ��������� ��������: date 'YYYY-MM-DD', time 'HH:MI:SS'
- ���������� ��������: true, false, unknown
��������� - ����������� �����, ����������� �������� ��� ����������, � ������������ ���������
- ���������: ������������ || 
- ��������������: +, -, *, /
- ����������: and, or, not
- ��������� ���������: =, <, >, <>, <=, >=
- ����������� ���������: all, some, any, between, distinct from, in, is a set, is normalized, is null, is off, like, match, 
  member, overlaps, similar to, submultiset, unique
- �������� ��� ����������� (���������): union all, union distinct, except all, except distinct, intersect all, intersect distinct
��������� - ����������� �����, ������������ ��������

## ���� 2. ���������� �������
select {* | [distinct | all] ������_���������_������}
[into ������_����������]
from ������_������������_������
[where �������]
[[start with �������_������������_�����]
connect by �������_�����������_�����]
[group by ������_���������_�����������
[having ���������_�������]]
[order by ������_���������_��������������]
����� ���� ��������:
  select * from table
����� �������� ����������� ��������:
  select post1,post2 from table
��������� ���:
  select table1.post1, table2.post1 from table1,table2
���������� ������������� �����:
  select distinct post from table
������������� ����������� ���������:
  select post1,post2*post3 from table
��������������� ��� �������������� ��������:
  select post1 as '������ �������' from table
��������� ������ � ��������� �������:
  select '����� 1 '||post||' ����� 2' from table
�������� ������:
  select t1.post, t2.post from table1 t1, table2 t2
������ � �������� ����� �������:
  from (select post from table1) t1, (select post from table2) t2

## ���� 3. ����� ����� �� �������
��������� ���������
select name as '���������������� ���' from table where post='������������'
select * from table where lower(post)='������������'
select * from table where upper(post)='������������'
select * from table where DT>to_date('01/01/2001'. 'DD/MM/YYYY')
select * from table where upper(name)>'������'
select * from table where 2.5*Rise<Salary
���������� ���������
select name from table where lower(post1)='���������' and post2<10
select name from table where lower(post1)='���������' or lower(post1)='�������'
select name from faculty where not lower(name)='�����������'
select * from department where (building='3' or building='6') and (fund<10000 or fund>20000)
������������� ��������� ��� ���������
select name as '���', salary+rise as '�/�' from teacher where salary+rise>15000
select name from teacher where (salary+rise)/2>3*rise
������������� ����������� ����������
- �������������� ���������: ���_������� [not] in (������ ��������)
  select distinct type as '��� �������' from lecture where week=1 and lower(day) in ('���','��','��')
  select name, building from department where building in ('1','3','8')
- �������������� ���������
- ������������ �������
- ������������ ����������� ���������
- ������������� ��������
������������� ���������
select * from department where building not in ('1','3','8')
select * from group where not (year in (1,2))
������������� ��������� ��� ���������
select name as '���',salary+rise as '�/�' from teacher where salary+rise in (800,900,1000)
select name as '���',salary+rise as '�/�' from teacher where salary+rise in (salary+100,salary+200,salary+300)
������������� �������������� ��������
select * from faculty where building not in ('1','3',null) - �� ���������� �� ����� ������
select * from faculty where building not in (select building from faculty) - �� ���������� �� ����� ������, ���� ������ ���� null
select * from faculty where building in ('1','3',null) - ��� ��� � �������
select * from faculty where building in (select building from faculty) - ��� ��� � �������
�������� �� �������������� ��������� ��������
���_������� [not] between ������� and ��������  -- �������� ������� ��������
select name,salary from teacher where salary between 10000 and 20000
������������� ��������� ��������
select name from teacher where upper(name) between '�' and '�'  -- ����� �� ������� ����� �� �, �.�. ����� ����������� ���������
������������� ���������
not (���_������� between ������� and ��������)
not between  -- ������� �������� ��������� �� ����������
������������� ��������� ��� ���������
select name,salary+rise from teaher where salary+rise between 2*rise and 3*rise
������������� �������������� �������
null ��� between
���� ����������� ��������� ��� ��� ������� ��������� ����� null, �� ��������� ����� unknown
�������� �� ������������ �������
���_������� [not] like ������ [escape ������_��������]
������������� �������
�������������� �������: '%' - ����� ������������������, '_' - ���� ����� ������
select name from teacher where upper(name) like '%��_�%'
select name from department where lower(name) like '%���%������%'
select name,post from teaher where lower(name||post) like '%�%�%�%�%'
������������� ������� �������� - escape - ��� ������ ���� ������� '%' ��� '_'
select * from department where lower(name) like '%������\_������%' escape '\'
select * from faculty where name like '%?_%' escape '?'  -- ������� ������ �����������, � ����� ������� ������� ������ '_'
�������� �� ������������ ����������� ���������
���������_��������� [not] similar to ����������_��������� [escape ������_��������]
�������������_������
- �������_������
- ��������_��������
- ���������_������_��������: [:aplha:], [:lower:], [:upper:], [:digit:], [:alnum:], [:space:], [:whitespace:]
����������_�����_��������
- ������_�������������_�������� (����� ������ ������)
- ^������_�������������_�������� (����� ������, ����� ������� ������)
- ������_�������������_��������^������_�������������_�������� (����� ������ ������, ����� ��������� �� ������ ������)
- '_' (���� ����� ������)
