# 🧠 Шпаргалка по архитектуре многослойных приложений

## ✅ Основные слои
- `Presentation`
Назначение: UI, взаимодействие с пользователем
Примеры компонентов: Controllers, Razor Pages, Views
- `Application`
Назначение: Бизнес-логика, сценарии использования
Примеры компонентов: Services, Use Cases
- `Domain`
Назначение: Модель предметной области
Примеры компонентов: Entities, Aggregates, Interfaces
- `Infrastructure`
Назначение: Работа с внешними системами (БД, API)
Примеры компонентов: Repositories, EF Core, File I/O

##🔹 Принципы
- Separation of Concerns - каждый слой отвечает за свою задачу.
- Dependency Inversion - верхние слои зависят от абстракций, а не от реализаций.
- Testability - бизнес-логика отделена от UI и инфраструктуры.

##🔹 Пример зависимости
```
// Domain
public interface IEmailSender {
    void Send(string to, string message);
}

// Infrastructure
public class SmtpEmailSender : IEmailSender {
    public void Send(string to, string message) { /* ... */ }
}

// Application
public class NotificationService {
    private readonly IEmailSender sender;
    public NotificationService(IEmailSender sender) {
        this.sender = sender;
    }
}
```

---

## ASCII‑схема N-tier
```
+----------------------+
|   Presentation/UI    |  <-- Веб, API, мобильные экраны
+----------------------+
          |
          v
+----------------------+
|   Business Logic     |  <-- Сервисы, правила, валидация
+----------------------+
          |
          v
+----------------------+
|   Data Access Layer  |  <-- Репозитории, ORM, SQL-запросы
+----------------------+
          |
          v
+----------------------+
|     Database         |  <-- Таблицы, индексы, данные
+----------------------+
```

## Круговая ASCII‑схема N-tier
```
+-----------------------------------+
|         Presentation/UI           |
|   (Controllers, Views, Pages)     |
|  +-----------------------------+  |
|  |      Business Logic         |  |
|  |  (Services, Validation)     |  |
|  |  +-----------------------+  |  |
|  |  |   Data Access Layer    |  |  |
|  |  | (Repositories, ORM)    |  |  |
|  |  +-----------------------+  |  |
|  +-----------------------------+  |
+-----------------------------------+
```
