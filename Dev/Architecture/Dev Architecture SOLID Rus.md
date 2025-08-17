# 🧠 Шпаргалка принципов SOLID


## ✅ Общая идея
SOLID — это набор пяти принципов объектно-ориентированного проектирования, направленных на создание гибкого, 
расширяемого и сопровождаемого кода.


## Терминология
🅢 SRP - Single Responsibility Principle
🅞 OCP - Open/Closed Principle
🅛 LSP - Liskov Substitution Principle
🅘 ISP - Interface Segregation Principle
🅓 DIP - Dependency Inversion Principle


## 🅢 SRP - Single Responsibility Principle
Принцип единственной ответственности
Класс должен иметь только одну причину для изменения.
Пример:
```
// ❌ Нарушение SRP: класс делает и сохранение, и логирование
public class ReportManager {
    public void SaveReport(Report report) { /* ... */ }
    public void LogReport(Report report) { /* ... */ }
}

// ✅ Разделение ответственности
public class ReportSaver {
    public void Save(Report report) { /* ... */ }
}

public class ReportLogger {
    public void Log(Report report) { /* ... */ }
}
```
Вопрос на собеседовании:
— Как вы определяете, что класс нарушает SRP?


## 🅞 OCP - Open/Closed Principle
Принцип открытости/закрытости
Классы должны быть открыты для расширения, но закрыты для модификации.
Пример:
```
// ❌ Нарушение OCP: добавление новых типов требует изменения метода
public double CalculateDiscount(Customer customer) {
    if (customer.Type == "Regular") return 0.1;
    if (customer.Type == "VIP") return 0.2;
    return 0;
}

// ✅ Расширяемость через наследование
public interface IDiscountStrategy {
    double GetDiscount(Customer customer);
}

public class RegularDiscount : IDiscountStrategy {
    public double GetDiscount(Customer customer) => 0.1;
}

public class VipDiscount : IDiscountStrategy {
    public double GetDiscount(Customer customer) => 0.2;
}
```
Вопрос на собеседовании:
— Как вы реализуете OCP в реальных проектах?


## 🅛 LSP - Liskov Substitution Principle
Принцип подстановки Барбары Лисков
Объекты подкласса должны заменять объекты суперкласса без нарушения логики.
Пример:
```
public class Bird {
    public virtual void Fly() { /* ... */ }
}

public class Ostrich : Bird {
    public override void Fly() {
        throw new NotImplementedException(); // ❌ Нарушение LSP
    }
}
```
Решение:
— Не наследовать от Bird, если поведение не совпадает. Создать отдельный интерфейс.
Вопрос на собеседовании:
— Как вы определяете, что наследование нарушает LSP?


## 🅘 ISP - Interface Segregation Principle
Принцип разделения интерфейса
Клиенты не должны зависеть от интерфейсов, которые они не используют.
Пример:
```
// ❌ Нарушение ISP: интерфейс слишком общий
public interface IWorker {
    void Work();
    void Eat();
}

// ✅ Разделение интерфейсов
public interface IWorkable {
    void Work();
}

public interface IFeedable {
    void Eat();
}
```
Вопрос на собеседовании:
— Как вы проектируете интерфейсы, чтобы избежать нарушения ISP?


## 🅓 DIP - Dependency Inversion Principle
Принцип инверсии зависимостей
Модули высокого уровня не должны зависеть от модулей низкого уровня. Оба должны зависеть от абстракций.
Пример:
```
// ❌ Нарушение DIP: жёсткая зависимость от конкретного класса
public class ReportService {
    private ReportRepository repo = new ReportRepository();
}

// ✅ Использование абстракции
public interface IReportRepository {
    void Save(Report report);
}

public class ReportService {
    private readonly IReportRepository repo;
    public ReportService(IReportRepository repo) {
        this.repo = repo;
    }
}
```
Вопрос на собеседовании:
— Как вы внедряете зависимости в .NET Core?
