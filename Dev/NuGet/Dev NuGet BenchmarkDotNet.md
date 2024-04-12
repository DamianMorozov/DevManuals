# Dev NuGet BenchmarkDotNet

https://benchmarkdotnet.org/

Title: Pro .NET Benchmarking
Author: Andrey Akinshin
Publisher:: Apress
Date: June, 2019
Number of Pages: 690
Language: English
Softcover ISBN-10: 1484249402
Softcover ISBN-13: 978-1-4842-4940-6
eBook ISBN-13: 978-1-4842-4941-3
https://aakinshin.net/prodotnetbenchmarking/

[SimpleJob(RuntimeMoniker.Net472, baseline: true)]
[SimpleJob(RuntimeMoniker.NetCoreApp30)]
[SimpleJob(RuntimeMoniker.CoreRt30)]
[SimpleJob(RuntimeMoniker.Mono)]
[RPlotExporter]
public class Md5VsSha256
{
    private SHA256 sha256 = SHA256.Create();
    private MD5 md5 = MD5.Create();
    private byte[] data;

    [Params(1000, 10000)]
    public int N;

    [GlobalSetup]
    public void Setup()
    {
        data = new byte[N];
        new Random(42).NextBytes(data);
    }

    [Benchmark]
    public byte[] Sha256() => sha256.ComputeHash(data);

    [Benchmark]
    public byte[] Md5() => md5.ComputeHash(data);
}
