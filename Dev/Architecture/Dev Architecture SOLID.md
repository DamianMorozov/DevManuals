# 🧠 SOLID Principles Cheat Sheet


## ✅ General idea
SOLID is a set of five object-oriented design principles aimed at creating flexible, 
extensible, and maintainable code.


## Terminology
🅢 SRP - Single Responsibility Principle
🅞 OCP - Open/Closed Principle
🅛 LSP - Liskov Substitution Principle
🅘 ISP - Interface Segregation Principle
🅓 DIP - Dependency Inversion Principle


## 🅢 SRP - Single Responsibility Principle
Single Responsibility Principle
A class should have only one reason to change.
Example:
```
// ❌ SRP violation: the class performs both saving and logging
public class ReportManager {
    public void SaveReport(Report report) { /* ... */ }
    public void LogReport(Report report) { /* ... */ }
}

// ✅ Separation of responsibilities
public class ReportSaver {
    public void Save(Report report) { /* ... */ }
}

public class ReportLogger {
    public void Log(Report report) { /* ... */ }
}
```
Interview question:
— How do you determine that a class violates SRP?


## 🅞 OCP - Open/Closed Principle
The principle of openness/closedness
Classes should be open for extension but closed for modification.
Example:
```
// ❌ Violation of OCP: adding new types requires changing the method
public double CalculateDiscount(Customer customer) {
    if (customer.Type == “Regular”) return 0.1;
    if (customer.Type == “VIP”) return 0.2;
    return 0;
}

// ✅ Extensibility through inheritance
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
Interview question:
— How do you implement OCP in real projects?


## 🅛 LSP - Liskov Substitution Principle
Barbara Liskov's substitution principle
Subclass objects must replace superclass objects without violating the logic.
Example:
```
public class Bird {
    public virtual void Fly() { /* ... */ }
}

public class Ostrich : Bird {
    public override void Fly() {
        throw new NotImplementedException(); // ❌ Violation of LSP
    }
}
```
Solution:
— Do not inherit from Bird if the behavior does not match. Create a separate interface.
Interview question:
— How do you determine that inheritance violates LSP?


## 🅘 ISP - Interface Segregation Principle
The principle of interface segregation
Clients should not depend on interfaces they do not use.
Example:
```
// ❌ ISP violation: interface is too general
public interface IWorker {
    void Work();
    void Eat();
}

// ✅ Interface segregation
public interface IWorkable {
    void Work();
}

public interface IFeedable {
    void Eat();
}
```
Interview question:
— How do you design interfaces to avoid violating ISP?


## 🅓 DIP - Dependency Inversion Principle
Dependency inversion principle
High-level modules should not depend on low-level modules. Both should depend on abstractions.
Example:
```
// ❌ Violation of DIP: hard dependency on a specific class
public class ReportService {
    private ReportRepository repo = new ReportRepository();
}

// ✅ Use of abstraction
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
Interview question:
— How do you implement dependencies in .NET Core?
