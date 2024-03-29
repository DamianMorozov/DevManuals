# OOP principles [Rus]

Principles of OOP - Принципы ООП.
Обновление: 2018-07-07.
https://tproger.ru/translations/oop-principles-cheatsheet/
https://habr.com/post/348286/
https://habrahabr.ru/post/208442/

## Главное
Инкапсулируйте все, что может изменяться.
Уделяйте больше внимания интерфейсам, а не их реализациям.
Каждый класс в вашем приложении должен иметь только одно назначение.
Классы — это их поведение и функциональность.

## Базовые принципы ООП
Абстракция — отделение концепции от ее экземпляра.
Полиморфизм — реализация задач одной и той же идеи разными способами.
Наследование — способность объекта или класса базироваться на другом объекте или классе. 
Это главный механизм для повторного использования кода. Наследственное отношение классов четко определяет их иерархию.
Инкапсуляция — размещение одного объекта или класса внутри другого для разграничения доступа к ним.

## Используйте следующее вместе с наследованием
Делегация — перепоручение задачи от внешнего объекта внутреннему.
Композиция — включение объектом-контейнером объекта-содержимого и управление его поведением; последний не может существовать вне первого.
Агрегация — включение объектом-контейнером ссылки на объект-содержимое; при уничтожении первого последний продолжает существование.

## Не повторяйся (Don’t repeat yourself — DRY)
Избегайте повторного написания кода, вынося в абстракции часто используемые задачи и данные. 
Каждая часть вашего кода или информации должна находиться в единственном числе в единственном доступном месте.
