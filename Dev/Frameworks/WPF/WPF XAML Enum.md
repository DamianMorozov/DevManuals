# WPF. XAML. ENUM
--------

**VaD** - View as DataTemplate

**VaW** - View as Window

## Variant 1.
[stackoverflow.com](https://stackoverflow.com/questions/6145888/how-to-bind-an-enum-to-a-combobox-control-in-wpf "stackoverflow.com")
```csharp
xmlns:CoreEnums="clr-namespace:Platform.ControlCenter.Core.DataModels.Enums"
ControlType="{Binding 
	Source=CoreEnums:EnumToItemsSource {x:Type CoreEnums:AvalonTextEditControlType}, 
	Path=SourcePlatform}"
```

## Variant 2.
```csharp
ControlType="{Binding EchangeControlTypeTableSegmentation, Mode=TwoWay}"
```
