# Entity Framework

- [Back to the Home](../../README.md)
- [Back to the Dev](../README.md)
- [Back to the section](README.md)

https://msdn.microsoft.com/en-us/data/jj574253.aspx

Object Relational Mapping (ORM) - Реляционное сопоставление объектов
Relational Database Management System (RDBMS) - система управления реляционными базами данных
Structured Query Language (SQL) - структурированный язык запросов
American National Standards Institute (ANSI) - Американский национальный институт стандартов
Create Retrieve Update Delete (CRUD)
Language Integrated Query (LINQ) - языковой комплексный запрос

## Entity Framework versions
EF ver 1. Visual Studio 2008 SP1. FrameWork 3.5: Database First - сначала база данных
EF ver 2. 
EF ver 3. 
EF ver 4. Visual Studio 2010. FrameWork 4.0: Model First - сначала модель
EF ver 5. Visual Studio 2012. FrameWork 4.1: Code First - сначала код
EF ver 6. Visual Studio 2012. FrameWork 4.5: Code First - сначала код

Диаграммы ER (entity-relationship) - сущность-отношение
Модель EDM (Entity Data Model) - ядро EF
Слои (layers): 
- Рабочий.   Conceptual Schema Definition Language (CSDL) - Концептуальный язык определения схемы.
- Удаленный. Store Schema Definition Language (SSDL) - Язык определения схемы схемы.
- Связующий. Mapping Details. Mapping Specification Language (MSL) - Язык спецификации сопоставления.

Visual Studio
Сервис - Диспетчер пакетов NuGet - Управление пакетами NuGet для решения
Entity Framework - Установить

using System.Data.Entity;
public class Context : DbContext {...}
