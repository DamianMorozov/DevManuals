# WPF metanit in Russian
--------

## [metanit.com](https://metanit.com/sharp/wpf/5.18.php "metanit.com")

**DirectX** - основа графического представления WPF.
**XAML** (eXtensible Application Markup Language) - язык разметки.
**WPF** является частью экосистемы .NET, развивается вместе с фреймворком .NET, имеет те же версии.

### Преимущества WPF
1. Использование любых языков .NET-платформы.
2. Определение интерфейса через XAML + C#/VB.NET.
3. Независимость от разрешения экрана.
4. Трёхмерные модели, привязка данных, использование стелей, шаблонов, тем.
5. Взаимодействие с WinForms. Можно использовать эелементы WinForms.
6. Создание приложение мультимедиа, графики, анимации.
7. Аппаратное ускорение графики.
8. Поддержка версий Windows от XP до 10.

### Архитектура
WPF
  - Managed API - управляемый API-интерфейс (под .NET CLR)
    - PresentationCore.dll - базовые типы большинства классов
    - PresentationFramework.dll - реализации компонентов и элементов управления
	- System.Xaml.dll - взаимодействие с документами XAML
    - WindowsBase.dll - вспомогательные классы
  - Unmanaged API - уровень интеграции с DirectX
    - milcore.dll - обеспечивает интеграцию компонентов WPF с DirectX
    - WindowsCodecs.dll -  низкоуровневая поддержка изображений в WPF
Direct X - компонент ОС
User32 - компонент ОС

### Структура проекта

- App.xaml - файл окна программы при запуске
- App.xaml.cs - файл логики
- MainWindow.xaml - главное окно
- MainWindow.xaml.cs - файл логики


### Доступ к GUI из другого потока.
```csharp
using System.Windows;
Application.Current?.Dispatcher?.BeginInvoke(new Action(() => 
{
    ProcessInfo.Add(msg);
}));
```

При компиляции приложения в Visual Studio код в xaml-файлах компилируется в бинарное представление кода xaml, которое называется 
**BAML** - Binary Application Markup Language. И затем код baml встраивается в финальную сборку приложения - exe или dll-файл.
xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"  -- описание и определение большинства элементов управления
xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"  -- некоторые свойства XAML, например свойство Name или Key
xmlns:d="http://schemas.microsoft.com/expression/blend/2008"  -- поддержка атрибутов в режиме дизайнера
xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"  --  режим совместимости разметок XAML
xmlns:local="clr-namespace:XamlApp"  -- пространство имен текущего проекта

```csharp
<	&lt;
>	&gt;
&	&amp;
"	&quot;

<Button Content="&lt;&quot;Hello&quot;&gt;" />
<Button xml:space="preserve">
    Hello         World
</Button>
```

### Контейнеры 
- Grid
- UniformGrid
- StackPanel
- WrapPanel
- DockPanel
- Canvas

При компоновке и расположении элементов внутри окна следующие принципы:
1.Нежелательно указывать явные размеры элементов (за исключеним минимальных и максимальных размеров). 
  Размеры должны определяться контейнерами.
2.Нежелательно указывать явные позицию и координаты элементов внутри окна. 
  Позиционирование элементов всецело должно быть прерогативой контейнеров. 
  Контейнер сам должен определять, как элемент будет располагаться. 
  Если нам надо создать сложную систему компоновки, то мы можем вкладывать один контейнер в другой, 
  чтобы добиться максимально удобного расположения элементов управления.

### Grid
- ColumnDefinitions
- RowDefinitions
<Grid.RowDefinitions>
	<RowDefinition Height="1*"></RowDefinition>
	<RowDefinition Height="0.5*"></RowDefinition>
</Grid.RowDefinitions>
<Grid.ColumnDefinitions>
	<ColumnDefinition Width="0.5*"></ColumnDefinition>
	<ColumnDefinition Width="1.5*"></ColumnDefinition>
</Grid.ColumnDefinitions>
Grid.ColumnSpan="1" Grid.RowSpan="3"
RenderTransformOrigin="0.5,0.5" 

### UniformGrid
Аналогичен Grid, только в этом случае все столбцы и строки одинакового размера и используется упрощенный синтаксис для их определения:
```csharp
<UniformGrid Rows="2" Columns="2">
    <Button Content="Left Top" />
    <Button Content="Right Bottom" />
</UniformGrid>
```

### GridSplitter
Представляет собой некоторый разделитель между столбцами или строками
```csharp
<GridSplitter Grid.Column="1" Grid.Row="0" ShowsPreview="False" Width="3" HorizontalAlignment="Center" VerticalAlignment="Stretch"></GridSplitter>
```

### StackPanel
Располагает все элементы в ряд либо по горизонтали, либо по вертикали в зависимости от ориентации
```csharp
<StackPanel Orientation="Horizontal">
	<Button Background="Blue" MinWidth="30" Content="1" />
	<Button Background="White" MinWidth="30" Content="2" />
	<Button Background="Red" MinWidth="30" Content="3" />
</StackPanel>
```

### DockPanel
Этот контейнер прижимает свое содержимое к определенной стороне внешнего контейнера. 
Для этого у вложенных элементов надо установить сторону, к которой они будут прижиматься с помощью свойства DockPanel.Dock
```csharp
<DockPanel LastChildFill="True">
	<Button DockPanel.Dock="Top" Background="AliceBlue" Content="Top button" FontSize="24"></Button>
	<Button DockPanel.Dock="Bottom" Background="BlanchedAlmond" Content="Bottom button" FontSize="24"></Button>
	<Button DockPanel.Dock="Left" Background="Aquamarine" Content="Left button" FontSize="24"></Button>
	<Button DockPanel.Dock="Right" Background="DarkGoldenrod" Content="Right button" FontSize="24"></Button>
	<Button Background="LightGreen" Content="Center" FontSize="24"></Button>
</DockPanel>
```

### WrapPanel
Располагает все элементы в одной строке или колонке в зависимости от того, какое значение имеет свойство 
Orientation - Horizontal или Vertical. Главное отличие от StackPanel - если элементы не помещаются в строке или столбце, 
создаются новые столбец или строка для не поместившихся элементов.

### Canvas
Для размещения на нем необходимо указать для элементов точные координаты относительно сторон Canvas. 
Для установки координат элементов используются свойства Canvas.Left, Canvas.Right, Canvas.Bottom, Canvas.Top. 

### Свойства компоновки элементов
Width, Height - не рекомендуется использовать.
MinWidth, MaxWidth, MinHeight, MaxHeight - можно использовать.
Единицы измерения: сантиметры (cm), точки (pt), дюймы (in) и пиксели (px).
Единицы измерения по умолчанию: логические пиксели (1/96 дюйма).
HorizontalAlignment, VerticalAlignment.
Margin="левый_отступ верхний_отступ правый_отступ нижний_отступ".
Margin="20", то сразу установим отступ для всех четырех сторон.
Panel.ZIndex.

### Элементы управления
System.Threading.DispatcherObject.
STA (Single-Thread Affinity). За пользовательский интерфейс отвечает один поток.
System.Windows.DependencyObject.
Dependency properties - свойства зависимостей, привязка данных.
System.Windows.Media.Visual.
System.Windows.UIElement.
System.Windows.FrameworkElement.
Добавляет поддержку привязки данных, анимации, стилй. Также добавляет ряд свойств, связанных с компоновкой (выравнивание, отступы) и ряд других.
System.Window.Controls.Control.
Представляет элемент управления, с которым взаимодействует пользователь. Этот класс добавляет ряд 
дополнительных свойств для поддержки элементами шрифтов, цветов фона, шрифта, а также добавляет 
поддержку шаблонов - специального механизма в WPF, который позволяет изменять стандартное представление элемента, кастомизировать его.

**Основные свойства элементов управления**:

- Name.
- FieldModifier.
  - задает модификатор доступа к объекту:
  ```csharp
<Button x:FieldModifier="private" x:Name="button1" Content="Hello World" />
```
- Visibility.
- Свойства настройки шрифтов: FontFamily, FontSize, FontStyle, FontWeight, FontStretch.
- Cursor: Hand, Arrow, Wait.
- FlowDirection - задает направление текста.
- Background и Foreground (цвета фона и шрифта): #rrggbb, #aarrggbb.

**Content controls** - Элементы управления содержимым:

- Window, Button, Label, ToggleButton, ToolTip, RadioButton, CheckBox, GroupBox, TabItem, Expander, ScrollViewer.
Наследуются от класса ContentControl <- System.Window.Controls.Control.
Свойство Content, устанавливает вложенный элемент.
- Объект класса, не наследующего от UIElement. Для такого объекта вызывается метод ToString(), который возвращает строковое преставление объекта. Затем эта строка устанавливается в качестве содержимого.
- Объект класса, наследующего от UIElement. Для такого объекта вызывается метод UIElement.OnRender(), который выполняет отрисовку внутри элемента управления содержимым.
Padding="50 30 0 40". Отстыпы.

**Специальные контейнеры**, которые содержат другие элементы, но в отличие от элементов Grid или Canvas не являются контейнерами компоновки:

- ScrollViewer,GroupBox
Декораторы, чье предназначение создание определенного фона вокруг вложенных элементов:
- Border или Viewbox.
Элементы управления списками:
- ListBox, ComboBox.
Текстовые элементы управления:
- TextBox, RichTextBox.
Элементы, основанные на диапазонах значений:
- ProgressBar, Slider.
Элементы для работ с датами:
- DatePicker и Calendar.
Остальные элементы управления, которые не вошли в предыдущие подгруппы:
- Image.

### Binding (привязка)
XAML:
```csharp
<TextBlock x:Name="myTextBlock" Text="{Binding ElementName=myTextBox,Path=Text}" Height="30" />
	{Binding ElementName=Имя_объекта-источника, Path=Свойство_объекта-источника}
```
C#:
Получить привязку:
```csharp
Binding binding = BindingOperations.GetBinding(myTextBlock, TextBlock.TextProperty);
```
Задать привязку:
```csharp
Binding binding = new Binding();
binding.ElementName = "myTextBox"; // элемент-источник
binding.Path = new PropertyPath("Text"); // свойство элемента-источника
myTextBlock.SetBinding(TextBlock.TextProperty, binding); // установка привязки для элемента-приемника
```

Удалить привязку:
```csharp
BindingOperations.ClearBinding(myTextBlock, TextBlock.TextProperty);
```
Удалить все привязки:
```csharp
BindingOperations.ClearAllBindings(myTextBlock);
```
**Некоторые свойства класса Binding**:

- ElementName: имя элемента, к которому создается привязка
- IsAsync: если установлено в True, то использует асинхронный режим получения данных из объекта. По умолчанию равно False
- Mode: режим привязки
- Path: ссылка на свойство объекта, к которому идет привязка
- TargetNullValue: устанавливает значение по умолчанию, если привязанное свойство источника привязки имеет значение null
- RelativeSource: создает привязку относительно текущего объекта
- Source: указывает на объект-источник, если он не является элементом управления.
- XPath: используется вместо свойства path для указания пути к xml-данным.
Режимы привязки
- OneWay: свойство объекта-приемника изменяется после модификации свойства объекта-источника.
- OneTime: свойство объекта-приемника устанавливается по свойству объекта-источника только один раз. В дальнейшем изменения в источнике никак не влияют на объект-приемник.
- TwoWay: оба объекта - применки и источник могут изменять привязанные свойства друг друга.
- OneWayToSource: объект-приемник, в котором объявлена привязка, меняет объект-источник.
- Default: по умолчанию (если меняется свойство TextBox.Text, то имеет значение TwoWay, в остальных случаях OneWay).
UpdateSourceTrigger (обновление привязки):
- PropertyChanged: источник привязки обновляется сразу после обновления свойства в приемнике
- LostFocus: источник привязки обновляется только после потери фокуса приемником
- Explicit: источник не обновляется до тех пор, пока не будет вызван метод BindingExpression.UpdateSource()
- Default: значение по умолчанию. Для большинства свойств это значение PropertyChanged. А для свойства Text элемента TextBox это значение LostFocus

**ButtonBase (кнопки)**:

- Button
```csharp
<Button Grid.Row="0" Grid.Column="0" Content="Accept (press Enter)" FontSize="20" IsDefault="True" Click="ButtonAccept_Click"></Button>
```
- RepeatButton
```csharp
<RepeatButton Grid.Row="1" Grid.Column="0" Content="RepeatButton" FontSize="20" Click="RepeatButton_Click" Delay="1000" Interval="100"></RepeatButton>
```
- ToogleButton
```csharp
<ToggleButton Grid.Row="2" Grid.Column="0" Grid.ColumnSpan="2" Content="toggleButton.IsChecked = false" FontSize="20" 
		x:Name="toggleButton"
		Click="ToggleButton_Click" IsThreeState="True" IsChecked="False">
	</ToggleButton>
```
```csharp
private void ToggleButton_Click(object sender, RoutedEventArgs e)
{
	toggleButton.Content = "toggleButton.IsChecked = " + 
		(toggleButton.IsChecked == null
		? "<null>" : System.Convert.ToString(toggleButton.IsChecked));
}
```
- CheckBox
- RadioButton
