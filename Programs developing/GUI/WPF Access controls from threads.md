# WPF. Access controls from threads
--------

## Sites
https://what.thedailywtf.com/topic/24432/catch-and-dispatcher-begininvoke

```csharp
private void ProcessInfoAddInOtherThread(string msg)
{
Application.Current?.Dispatcher?.BeginInvoke(new System.Action(() => 
{
    ProcessInfo.Add(msg);
}));
}
```