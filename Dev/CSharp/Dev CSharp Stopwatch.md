# Stopwatch

- [Back to the Home](../../../README.md)
- [Back to the Dev](../../README.md)
- [Back to the section](README.md)

## Properties
Elapsed - returns the total elapsed time.
ElapsedMilliseconds - returns the total elapsed time in milliseconds.
ElapsedTicks - returns the total elapsed time in timer cycles.
IsRunning - returns a value indicating whether the Stopwatch timer is running.

## Methods
Reset - stops the time interval measurement and resets the elapsed time to zero.
Restart - stops the time interval measurement, resets the elapsed time and starts the elapsed time measurement.
Start - starts or continues the measurement of the elapsed time for the interval.
StartNew - initializes a new Stopwatch instance, sets the spent time property to zero and starts the spent time measurement.
Stop - stops the measurement of the elapsed time for the interval.

## Fields
Frequency - returns the frequency of the timer as the number of clock cycles per second.
IsHighResolution - indicates whether the timer depends on the high-resolution performance counter.

## Code
```
var sw = Stopwatch.StartNew();
Foo();
sw.Stop();
```
