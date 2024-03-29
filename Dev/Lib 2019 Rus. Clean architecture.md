# Lib 2019 Rus. Clean architecture
2019. Robert Martin. Clean architecture (Чистая архитектура).

## Глава 1. Что такое дизайн и архитектура. стр 25
Это одно и тоже. Низкоуровневые детали и высокоуровневая структура являются одним целым.
Цель архитектуры ПО - уменьшить человеческие трудозатраты на создание и сопровождение.
Ложь № 1 - грязный код поможет быстро написать ПО. Но в действительности, затормозит продвижение в перспективе.
TDD (Test-driven development) - позволяет быстрее писать код. Поспешай не торопясь.

## Глава 2. История о двух ценностях. стр 35
Ценности ПО:
1. Поведение.
Разработка функциональной спецификации или документа с требованиями.
2. Архитектура.
Разница между масштабом и формой часто является причиной роста стоимости разработки.
Архитектура должна быть максимально независима от формы.
Что важнее, функциональность или архитектура?
С точки зрения руководителя - функциональность (правильная работа). Ошибочное мнение.
Стоимость изменений важнее правильной работы.
Матрица Эйзенхауэра. Два вида дел: срочные и важные.
1. Срочные и важные. - Архитектура. Поведение.
2. Не срочные и важные. - Архитектура.
3. Срочные и не важные. - Архитектура. Поведение.
4. Не срочные и не важные.
Поведение = срочное. Архитектура = важное.
Задача разработчика - подчеркнуть приоритет важности архитектуры перед срочностью поведения.

Часть 2. Начальные основы. Парадигмы программирования. стр 41
## Глава 3. Обзор парадигм. стр 43
1. Структурное программирование. стр 47
Накладывает ограничение на прямую передачу управления.
if/then/else и do/while.
Управляющие структуры, делающие доказуемой правильность модуля, совпадают с набором структур, минимально 
необходимым для написания любой программы.
Edsger Wybe Dijkstra (Эдсгер Вайб Дейкстра). 1968. Go To Statement Considered Harmful (О вреде оператора Go To).
http://hosting.vspu.ac.ru/~chul/dijkstra/goto/goto.htm
http://www.u.arizona.edu/~rubinson/copyright_violations/Go_To_Considered_Harmful.html
Тестирование показывает присутствие ошибок, а не их отсутствие.
Функциональная декомпозиция.
2. ООП. стр 55
Накладывает ограничение на косвенную передачу управления (указатель на функции).
Инкапсуляция.
Наследование.
Полиморфизм. Инверсия зависимостей. Плагины.
----------------------------------------------------------------------------------------------------
3. Функциональное программирование.
Накладывает ограничения на присваивание.
Переменные в функциональных языках не изменяются.
В отсутствии изменяемых переменных, программа не может попасть в состояние взаимоблокировки (deadlock).
Условия достижения неизменяемости (ограничения изменяемости):
1. Деление на изменяемые и неизменяемые компоненты.
Транзакционная память интерпретирует переменные в ОЗУ.
----------------------------------------------------------------------------------------------------
Регистрация событий.
Обладая хранилищем достаточного объёма и мощности, можно сделать ПО полностью неизменяемым (функциональным).
Пример: системы управления версиями.
----------------------------------------------------------------------------------------------------
Принципы дизайна.
Принципы SOLID. 2004.
----------------------------------------------------------------------------------------------------
SRP (Single Responsibility Principle) - принцип единственной ответственности.
Программный модуль имеет только одну причину для изменения.
Actor (актор) - группа.
Модуль - связный набор функций и структур данных.
Модуль должен отвечать только за одного актора.
Признаки нарушения:
1. Непреднамеренное дублирование.
Employee.
- calcPay - бухгалтерия   - regularHours
- reportHours - отдел HR  - regularHours
- save - администратор БД
2. Слияния.
Обычное дело для исходных файлов с большим кол-вом методов.
Изменение одного исходного кода разными людьми.
Решения.
Разделение класса Employee на три класса. 
Создание 3х экземпляров классов.
Шаблон проектирования Фасад.
----------------------------------------------------------------------------------------------------
OCP (Open-Closed Principle) - принцип открытости-закрытости.
Bertrand Meyer (Бертран Мейер). Object Oriented Software Construction, Prentice Hall, 1988.
Простая для изменения система должна предусматривать простую возможность изменения поведения, путём
добавления нового, но не изменением существующего кода.
Программные сущности должны быть открыты для расширения, но закрыты для изменения.
Пример. Отчёт в разных видах: XLS, PDF, WEB.
Архитекторы разделают функциональные возможности, организуя их в иерархию компонентов.
Компоненты верхнего уровня защищены от изменений в компонентах нижних уровней.
----------------------------------------------------------------------------------------------------
LSP (Liskov Substitution Principle) - принцип подстановки Барбары Лисков.
Барбара Лисков, 1988.
Для создания ПО из взаимозаменяемых частей, эти части должны соответствовать контракту, 
который позволяет заменять эти части друг другом.
----------------------------------------------------------------------------------------------------
ISP (Interface Segregation Principle) - принцип разделения интерфейсов.
Избегать зависимости от всего, что не используется.
----------------------------------------------------------------------------------------------------
DIP (Dependency Inversion Principle) - принцип инверсии зависимостей.
Код реализации высокоуровневой политики, не должен зависеть от кода реализации низкоуровневых деталей.
Детали должны зависеть от политики.
----------------------------------------------------------------------------------------------------
