# Dev CSharp Foreach enum ProcessWindowStyle.

- [Back to the Home](../../../README.md)
- [Back to the Dev](../../README.md)
- [Back to the section](README.md)

// ProcessWindowStyle
foreach (var pwStyle in (System.Diagnostics.ProcessWindowStyle[])Enum.GetValues(typeof(System.Diagnostics.ProcessWindowStyle)))
{
    Console.WriteLine($"ProcessWindowStyle: {pwStyle}");
}
