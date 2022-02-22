# Lib 2018 Rus. WPF Development Cookbook

2018. Kunal Chowdhury. WPF Development Cookbook.
https://www.kunal-chowdhury.com/2018/02/wpf-development-cookbook.html
https://static.packt-cdn.com/downloads/WindowsPresentationFoundationDevelopmentCookbook_ColorImages.pdf
https://github.com/PacktPublishing/Windows-Presentation-Foundation-Development-Cookbook

# Chapter 1. WPF Fundamentals. Page 43.
WPF - Windows Presentation Foundation.
The WPF Architecture:
- Presentation Framework (presentationframework.dll)
  - Controls
  - Layouts
  - Graphics
  - Media
  - Styles
  - Templates
  - Animations
- Presentation Core (presentationcore.dll)
- CLR - Common Language Runtime
- MIL - Media Integration Library (milcore.dll)
- OS Core
  - Kernel
  - User32
  - GDI
  - DirectX
  - Device Drivers

Types of WPF applications. Page 51.
- Desktop-based executables (EXE).
- Web-based applications (XBAP).
XAML - Extensible Application Markup Language.
WPF - Windows Platform Foundation.
UWP - Universal Windows Platform.
Xamarin Forms.
BAML - Binary Application Markup Language.
Flow diagram for render/parse the XAML UI:
XAML pages -> Render -> UI
XAML pages -> Compile -> BAML -> Parse -> UI

CH01.HelloWPFDemo. Page 72.
CH01.WindowDemo. Page 77.
CH01.PageDemo. Page 84.
CH01.DialogBoxDemo. Page 91.
- OpenFileDialog. Page 98.
- SaveFileDialog. Page 100.
- PrintDialog. Page 102.
- System.Windows.Forms.FontDialog.
- System.Windows.Forms.ColorDialog. Page 104.
CH01.OwnershipDemo. Page 106.
CH01.SingleInstanceDemo. Page 111.
CH01.CommandLineArgumentDemo. Page 118.
CH01.UnhandledExceptionDemo. Page 125.

# Chapter 2. Using WPF Standard Controls. Page 132.
CH02.TextBlockDemo. Page 134.
CH02.LabelDemo. Page 142.
CH02.LabelAccessKeyDemo. Page 145.
<Label Content="Enter _user name:" Target="{Binding ElementName=txbUsername}" />
CH02.TextBoxDemo. Page 147.
CH02.ImageDemo. Page 155.
Working with ready-to-use 2D shapes. Page 161.
CH02.ShapesDemo. Page 162.
- Rectangle
- Ellipse
- Line
- Polyline
- Polygon
- Path
http://bit.ly/path-markup-syntax
CH02.TooltipDemo. Page 169.
CH02.MenuDemo. Page 175.
<MenuItem Header="_Save" Icon="&#x1F4BE;" InputGestureText="Ctrl + S" Click="OnSaveMenuClicked" />
CH02.ContextMenuDemo. Page 183.
CH02.OptionSelectorsDemo. Page 189.
CH02.ProgressBarDemo. Page 195.
CH02.SliderDemo. Page 199.
CH02.CalendarDemo. Page 205.
CH02.ListBoxDemo. Page 215.
CH02.ComboBoxDemo. Page 224.
CH02.StatusBarDemo. Page 230.

# Chapter 3. Layouts and Panels. Page 240.
CH03.GridDemo. Page 243.
CH03.UniformGridDemo. Page 252.
CH03.WrapPanelDemo. Page 261.
CH03.StackPanelDemo. Page 266.
CH03.CanvasDemo. Page 272.
CH03.BorderDemo. Page 276.
CH03.ScrollViewerDemo. Page 281.
CH03.DockPanelDemo. Page 285.
CH03.ViewBoxDemo. Page 291.
CH03.TabControlDemo. Page 297.
CH03.DynamicPanelDemo. Page 303.
CH03.DragAndDropDemo. Page 310.

# Chapter 4. Working with Data Bindings. Page 316.
CH04.NotificationPropertiesDemo. Page 319.
CH04.DependencyPropertyDemo. Page 328.
- propdp
CH04.AttachedPropertyDemo. Page 336.
- propa
CH04.ObjectBindingDemo. Page 341.
CH04.CollectionBindingDemo. Page 346.
CH04.ElementToElementBindingDemo. Page 353.
CH04.DataGridSortDemo. Page 358.
CH04.DataGridGroupDemo. Page 365.
CH04.DataGridFilterDemo. Page 372.
CH04.StaticBindingDemo. Page 378.

# Chapter 5. Using Custom Controls and User Controls.

# Chapter 6. Using Styles, Templates, and Triggers.

# Chapter 7. Using Resources and MVVM Patterns.

# Chapter 8. Working with Animations.

# Chapter 9. Using WCF Services.

# Chapter 10. Debugging and Threading.

# Chapter 11. Interoperability with Win32 and WinForm.
