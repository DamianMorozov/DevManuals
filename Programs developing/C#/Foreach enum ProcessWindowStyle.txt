// ProcessWindowStyle
foreach (var pwStyle in (System.Diagnostics.ProcessWindowStyle[])Enum.GetValues(typeof(System.Diagnostics.ProcessWindowStyle)))
{
    Console.WriteLine($"ProcessWindowStyle: {pwStyle}");
}
