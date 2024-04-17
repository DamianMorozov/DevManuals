# CSharp Localization CodingSeb

- [Back to the Home](../../../README.md)
- [Back to the Dev](../../README.md)
- [Back to the section](README.md)

## Links
- [codingseb/Localization](https://github.com/codingseb/Localization)

## Steps
Create `MyLocalizationCore.csprog` project.
Add `CodingSeb.Localization`, `CodingSeb.Localization.JsonFileLoader` NuGet-packages.
Create `Locales` folder.
Add `MyAppName.loc.json` file.
Add strings
```
{
    "Language": {
        "Name": {
            "en": "English",
            "ru": "Russian"
        }
    },
    "MyAppName": {
        "AppTitle": {
            "en": "App name on English",
            "ru": "App name on Russian"
        }
    }
}
```
Add `MyLocaleModel` class.
Add string
```
public string AppTitle => Locale.Translate($"LabelPrint.{nameof(AppTitle)}");
```
Create `MyAppName.csprog` project.
Add `MyLocalizationCore` reference.
