# Fix errors

## There is no registered service of type 'System.Net.Http.IHttpClientFactory'
Program.cs
```
builder.Services.AddHttpClient();
```
