# Язык запросов SQL

## Урок 1. Введение в SQL
1974г. IBM в штате Калифорния.
SEQUEL - Structured English Query Language
ANSI - American National Standards Institute
ISO - International Standards Organization
Ключевое слово - зарезервированное слово для специального использования
Фраза - часть предложения, имеющая самостоятельный смысл, включающая ключевое слово
Предложение - конструкция, имеющая самостоятельную интерпретацию
Литералы (константы) - простейшие выражения, являющиеся значениями соответствующих типов
- литералы символьных строк: 'пример'
- литералы двоичных строк: X'00FF'
- числовые литералы: 11, 99.85, 11.22E12
- временные литералы: date 'YYYY-MM-DD', time 'HH:MI:SS'
- логические литералы: true, false, unknown
Операторы - конструкции языка, указывающие операции над элементами, и возвращающие результат
- строковые: конкатенация || 
- арифметические: +, -, *, /
- логические: and, or, not
- предикаты сравнения: =, <, >, <>, <=, >=
- специальные предикаты: all, some, any, between, distinct from, in, is a set, is normalized, is null, is off, like, match, 
  member, overlaps, similar to, submultiset, unique
- операции над множествами (таблицами): union all, union distinct, except all, except distinct, intersect all, intersect distinct
Выражение - конструкция языка, возвращающая значение

## Урок 2. Простейшие запросы
select {* | [distinct | all] список_выражения_выбора}
[into список_переменных]
from список_спецификаций_таблиц
[where условие]
[[start with условие_спецификации_корня]
connect by условие_рекурсивной_связи]
[group by список_выражений_группировки
[having групповое_условие]]
[order by список_выражений_упорядочивания]
Вывод всех столбцов:
  select * from table
Вывод значений определённых стоблцов:
  select post1,post2 from table
Уточнение имён:
  select table1.post1, table2.post1 from table1,table2
Исключение повторяющихся строк:
  select distinct post from table
Использование вычисляемых выражений:
  select post1,post2*post3 from table
Переопределение имён результирующих столбцов:
  select post1 as 'Первый столбец' from table
Включение текста в результат запроса:
  select 'Текст 1 '||post||' текст 2' from table
Синонимы таблиц:
  select t1.post, t2.post from table1 t1, table2 t2
Запрос в качестве имени таблицы:
  from (select post from table1) t1, (select post from table2) t2

## Урок 3. Отбор строк по условию
Операторы сравнения
select name as 'Пользовательское имя' from table where post='Наименование'
select * from table where lower(post)='наименование'
select * from table where upper(post)='наименование'
select * from table where DT>to_date('01/01/2001'. 'DD/MM/YYYY')
select * from table where upper(name)>'Иванов'
select * from table where 2.5*Rise<Salary
Логические операторы
select name from table where lower(post1)='профессор' and post2<10
select name from table where lower(post1)='профессор' or lower(post1)='учитель'
select name from faculty where not lower(name)='информатика'
select * from department where (building='3' or building='6') and (fund<10000 or fund>20000)
Использование выражений над столбцами
select name as 'Имя', salary+rise as 'з/п' from teacher where salary+rise>15000
select name from teacher where (salary+rise)/2>3*rise
Использование специальных операторов
- Принадлежность множеству: имя_столбца [not] in (список значений)
  select distinct type as 'Тип занятия' from lecture where week=1 and lower(day) in ('пнд','вт','ср')
  select name, building from department where building in ('1','3','8')
- Принадлежность диапазону
- Соответствие шаблону
- Соответствие регулярному выражению
- Неопределённое значение
Использование отрицания
select * from department where building not in ('1','3','8')
select * from group where not (year in (1,2))
Использование выражений над столбцами
select name as 'ФИО',salary+rise as 'З/п' from teacher where salary+rise in (800,900,1000)
select name as 'ФИО',salary+rise as 'З/п' from teacher where salary+rise in (salary+100,salary+200,salary+300)
Использование неопределённого значения
select * from faculty where building not in ('1','3',null) - не возвращает ни одной строки
select * from faculty where building not in (select building from faculty) - не возвращает ни одной строки, если внутри есть null
select * from faculty where building in ('1','3',null) - тут все в порядке
select * from faculty where building in (select building from faculty) - тут все в порядке
Проверка на принадлежность диапазону значений
имя_столбца [not] between минимум and максимум  -- включает границы значений
select name,salary from teacher where salary between 10000 and 20000
Использование строковых значений
select name from teacher where upper(name) between 'З' and 'Л'  -- может не вывести имена на Л, т.к. имена дополняются пробелами
Использование отрицания
not (имя_столбца between минимум and максимум)
not between  -- крайние значения диапазона не включаются
Использование выражений над столбцами
select name,salary+rise from teaher where salary+rise between 2*rise and 3*rise
Использование неопределённого значеня
null для between
если проверяемое выражение или обе границы диапазона равны null, то результат равен unknown
Проверка на соответствие шаблону
имя_таблицы [not] like шаблон [escape символ_пропуска]
Использование шаблона
подстановочные символы: '%' - любая последовательность, '_' - один любой символ
select name from teacher where upper(name) like '%ИВ_Н%'
select name from department where lower(name) like '%баз%данных%'
select name,post from teaher where lower(name||post) like '%о%о%о%о%'
Использование символа пропуска - escape - для поиска спец символа '%' или '_'
select * from department where lower(name) like '%систем\_управл%' escape '\'
select * from faculty where name like '%?_%' escape '?'  -- вывести данные факультетов, в имени которых имеется символ '_'
Проверка на соответствие регулярному выражению
строковое_выражение [not] similar to регулярное_выражение [escape символ_пропуска]
перечисляемый_символ
- обычный_символ
- диапазон_символов
- указатель_класса_символов: [:aplha:], [:lower:], [:upper:], [:digit:], [:alnum:], [:space:], [:whitespace:]
регулярный_набор_символов
- список_перечисляемых_символов (любой символ списка)
- ^список_перечисляемых_символов (любой символ, кроме символа списка)
- список_перечисляемых_символов^список_перечисляемых_символов (лббой символ списка, кроме указанных во втором списке)
- '_' (один любой символ)
