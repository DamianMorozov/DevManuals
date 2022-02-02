====================================================================================================
ECS / Entity Component System
https://medium.com/clean-code-channel/entity-component-system-ace3611c9b30
====================================================================================================
Entity/сущность - логическая совокупность компонентов.
System/система - поведение, оперирующее данными/состоянием.
Система описывает данные, над которыми будет выполнять операции.
----------------------------------------------------------------------------------------------------
Пример расчёта площади из SOLID.
Интерфейс Shape имеет метод ComputeArea.
Каждый класс форм, который реализует интерфейс Shape, предоставляет собственную реализацию ComputeArea.
DATA  | Entities | Tank: Weapon, AI, Transform, Health, Model | Crystal: Transform, Health, Model | Компоненты сущностей
LOGIC | Systems  | Render system, Battle system               | Render system, Resource system    | Системы изменяют сущности
ComputeCircleAreaSystem запрашивает объекты, имеющие компонент Radius.
ComputeRectangleAreaSystem запрашивает объекты, имеющие компоненты Base и Height.
CircleAreaSystem считывает компонент Radius и записывает компонент Area.
ComputeRectangleAreaSystem считывает Width и Height и записывает Area.
ComputeTriangleAreaSystem считывает Base и Height и записывает Area.
----------------------------------------------------------------------------------------------------
