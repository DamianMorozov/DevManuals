# Lib 2014 Rus. The Art of Unit Testing (with examples in C#)
2014. Roy Osherove. The Art of Unit Testing (with examples in C#)
2014. Рой Ошероув. Искусство автономного тестирования

Автономные тесты.
Интеграционные тесты.
TDD (Test-Driven Development) - Разработка через тестирование

Традиционный способ написания тестов:
-------------------------------------
1. Написать метод
2. Написать автономные тесты
3. Прогнать автономные тесты
4. Исправить ошибки

Разработка через тестирование:
------------------------------
1. Написать тест
2. Прогнать все тесты
3. Написать код, чтобы прошёл тест
4. Прогнать все тесты
   Если тесты не проходят, то исправить ошибки.
5. Рефакторинг не нужен.
   - Вернуться к пункту 1.
6. Подвергнуть продуктовый код рефакторингу.
   - Вернуться к пункту 4.
Рефакторинг - изменение части кода, без изменения его функционала.
1. Переименование методов, свойств.
2. Разбиение метода на короткие.
----------------------------------------------------------------------------------------------------
Плюсы каркаса NUnit, по сравнению с MSTest:
1. Имеет атрибуты.
2. Встроенный исполнитель тестов умеет прогонять тесты сторонних каркасов. Через адаптер NuGet.
Как каркас автономного тестирования помогает:
1. Простота и упорядоченность.
2. Выполнение всех тестов.
3. Анализ результатов прогона тестов.
Список каркасов: http://en.wikipedia.org/wiki/List_of_unit_testing_frameworks
----------------------------------------------------------------------------------------------------
Основные правила размещения и именования тестов:
1. Проект. [ProjectUnderTest].UnitTests
2. Класс.  [ClassName]Tests
3. Метод.  [UnitOfWorkName]_[ScenarioUnderTest]_[ExpectedBehavior] / Подготовка_Действие_Утверждение
----------------------------------------------------------------------------------------------------
Создание тестового метода:
1. Arrange - подготовка объектов.
2. Act     - действие на объект.
3. Assert  - утверждение о значении / об ожидаемом результате.
проверка на bool       - Assert.True(getResult);
проверка на значение   - Assert.AreEqual(expectedObject, actualObject, message);
проверка на ссылки     - Assert.AreSame(expectedObject, actualObject, message);
проверка на исключение - Assert.Catch<T>(delegate);
проверка на вхождение  - StringAssert.Contains(@"Exception message", result.Message);
проверка на вхождение  - Assert.That(result.Message, Does.Contain(@"Exception message"));
----------------------------------------------------------------------------------------------------
Атрибуты:
[TestFixture]          - класс содержит автономные тесты
[TestFixtureSetUp]     - однократно инициализировать состояние для всего класса
[TestFixtureTearDown]  - однократно очистить состояние для всего класса
[SetUp]                - подготовка. метод вызывается перед запуском любого теста
[TearDown]             - очистка состояния. метод вызывается после выполнения любого теста
                       - настройка состояния по умолчанию для шаблона проектирования Singleton
[Test]                 - тестовый метод / public void
[TestCase]             - параметризованный тестовый метод. [TestCase(param1,param2,...)]
[ExpectedException]    - проверка исключений
[Ignore("Пропустить")] - пропустить тест
[Category("Быстрые")]  - категория тестов
----------------------------------------------------------------------------------------------------
If you substituted for a class rather than an interface, check that the call to your substitute was on a virtual/abstract member.
Return values cannot be configured for non-virtual/non-abstract members.
Correct use:
	mySub.SomeMethod().Returns(returnValue);
Potentially problematic use:
	mySub.SomeMethod().Returns(ConfigOtherSub());
Instead try:
	var returnValue = ConfigOtherSub();
	mySub.SomeMethod().Returns(returnValue);
----------------------------------------------------------------------------------------------------
Is.StringStarting   -> Does.StartWith
Is.StringEnding     -> Does.EndWith
Is.StringContaining -> Does.Contain
Is.StringMatching   -> Does.Match
