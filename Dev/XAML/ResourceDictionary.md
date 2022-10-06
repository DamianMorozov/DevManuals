# ResourceDictionary

## Links
- [Adding a static object to a resource dictionary](https://stackoverflow.com/questions/5834626/adding-a-static-object-to-a-resource-dictionary)

## Adding a static object to a resource dictionary

**UserSessionHelper.cs**
```
public class UserSessionHelper : BaseViewModel
{
	#region Design pattern "Lazy Singleton"

#pragma warning disable CS8618
	private static UserSessionHelper _instance;
#pragma warning restore CS8618
	public static UserSessionHelper Instance => LazyInitializer.EnsureInitialized(ref _instance);

	#endregion

	#region Public and private fields and properties

	private EntityModel _entity;
	[XmlElement]
	public EntityModel Entity
	{
		get => _entity;
		set
		{
			_entity = value;
			OnPropertyChanged();
		}
	}
	
	#endregion
}

```

**XamlResourceDictionary.xaml**
```
<ResourceDictionary
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" 
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    xmlns:locale="clr-namespace:DataCore.Localizations;assembly=DataCore"
    xmlns:helpers="clr-namespace:WeightCore.Helpers">
    
	<SolidColorBrush x:Key="brush" Color="Red"/>
    <locale:LocaleLabels x:Key="LocaleLabels" />
	<x:Static Member="helpers:UserSessionHelper.Instance" x:Key="UserSession" />
</ResourceDictionary>
```

**XamlPage.xaml**
```
<xamlPages:XamlPageBase
	x:Class="WeightCore.XamlPages.PagePackage"
	xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
	xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
	xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" 
	xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
	xmlns:xamlPages="clr-namespace:WeightCore.XamlPages"
	mc:Ignorable="d" 
    d:DesignWidth="600" d:DesignHeight="300" FontSize="20"
    DataContext="{DynamicResource UserSession}" >

	<xamlPages:XamlPageBase.Resources>
		<ResourceDictionary>
			<ResourceDictionary.MergedDictionaries>
				<ResourceDictionary Source="XamlResourceDictionary.xaml" />
			</ResourceDictionary.MergedDictionaries>
		</ResourceDictionary>
	</xamlPages:XamlPageBase.Resources>

	<Grid >
		<Grid.ColumnDefinitions>
			<ColumnDefinition Width="1*"></ColumnDefinition>
			<ColumnDefinition Width="1*"></ColumnDefinition>
		</Grid.ColumnDefinitions>
		<Grid.RowDefinitions>
			<RowDefinition Height="1*"></RowDefinition>
		</Grid.RowDefinitions>
		<Label 
			Margin="2"
			Content="{Binding Source={StaticResource LocaleLabels}, Path=LabelText, Mode=OneTime}"
			HorizontalContentAlignment="Center" VerticalContentAlignment="Center" ></Label>
		<ComboBox 
			Margin="2" Grid.Column="1" Grid.Row="0" x:Name="comboBoxEntity"
			HorizontalContentAlignment="Left" VerticalContentAlignment="Center" 
			ItemsSource="{Binding Path=Items, Mode=OneWay}" 
			DisplayMemberPath="Name"
			SelectedValuePath="Name"
			SelectedValue="{Binding Path=Item.Name, Mode=OneWay}" 
			SelectedItem="{Binding Path=Item, Mode=TwoWay}" 
			/>
	</Grid>
           
</xamlPages:XamlPageBase>
```

**XamlPage.xaml.cs**
```
public partial class XamlPage
{
	#region Public and private fields, properties, constructor

	public UserSessionHelper UserSession { get; private set; }

	/// <summary>
	/// Constructor.
	/// </summary>
	public XamlPage()
	{
		InitializeComponent();

		if (!Resources.Contains(nameof(UserSession)))
			Resources.Add(nameof(UserSession), UserSessionHelper.Instance);

		object context = FindResource(nameof(UserSession));
		if (context is UserSessionHelper userSession)
			UserSession = userSession;
		else
			UserSession = UserSessionHelper.Instance;
	}

	#endregion
}
```
