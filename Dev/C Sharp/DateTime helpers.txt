====================================================================================================
DateTime helpers
====================================================================================================
public string FormatSeconds(double secs, bool showHours, bool showMinutes, bool showSeconds, bool showMilliseconds)
{
    TimeSpan t = TimeSpan.FromSeconds(secs);
    var strHours = string.Empty;
    if (showHours)
        strHours = string.Format("{0:D2} hours. ", t.Hours);
    var strMinutes = string.Empty;
    if (showMinutes)
        strMinutes = string.Format("{0:D2} mins. ", t.Minutes);
    var strSeconds = string.Empty;
    if (showSeconds)
        strSeconds = string.Format("{0:D2} secs. ", t.Seconds);
    var strMilliseconds = string.Empty;
    if (showMilliseconds)
        strMilliseconds = string.Format("{0:D3} msecs.", t.Milliseconds);
    return string.Format("{0}{1}{2}{3}",
                    strHours,
                    strMinutes,
                    strSeconds,
                    strMilliseconds);
}
----------------------------------------------------------------------------------------------------
// Get DateTime from unix long.
public DateTime GetDt(long unixDate)
{
	var dt = new DateTime(1970,1,1,0,0,0,0, DateTimeKind.Utc);
    dt = dt.AddSeconds(unixDate).ToLocalTime();
	return dt;
}
----------------------------------------------------------------------------------------------------
