# C# WPF Binding

- [Binding declarations overview (WPF .NET)](https://learn.microsoft.com/en-us/dotnet/desktop/wpf/data/binding-declarations-overview)

## XAML
```
<TextBlock Text="{Binding Source={StaticResource myDataSource}, Path=Name}"/>
```

## Create a binding in code
```
private void Window_Loaded(object sender, RoutedEventArgs e)
{
    // Make a new data source object
    var personDetails = new Person()
    {
        Name = "John",
        Birthdate = DateTime.Parse("2001-02-03")
    };

    // New binding object using the path of 'Name' for whatever source object is used
    var nameBindingObject = new Binding("Name");

    // Configure the binding
    nameBindingObject.Mode = BindingMode.OneWay;
    nameBindingObject.Source = personDetails;
    nameBindingObject.Converter = NameConverter.Instance;
    nameBindingObject.ConverterCulture = new CultureInfo("en-US");

    // Set the binding to a target object. The TextBlock.Name property on the NameBlock UI element
    BindingOperations.SetBinding(NameBlock, TextBlock.TextProperty, nameBindingObject);
}
```
