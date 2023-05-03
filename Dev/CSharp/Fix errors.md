# Fix errors

## The SSL connection could not be established
*.cs
```
public static void RequestHttpStatus(PrinterModel printer, int timeOut)
{
	if (printer.HttpStatusCode == HttpStatusCode.OK)
		return;
	printer.HttpStatusCode = HttpStatusCode.BadRequest;
	printer.HttpStatusException = null;
	RestClientOptions options = new(printer.Link)
	{
		UseDefaultCredentials = true,
		ThrowOnAnyError = true,
		MaxTimeout = timeOut,
		RemoteCertificateValidationCallback = (sender, cert, chain, sslPolicyErrors) => { return true; }  // <--- fix error here
	};
	using RestClient client = new(options);
	RestRequest request = new();
	try
	{
		RestResponse response = client.GetAsync(request).ConfigureAwait(true).GetAwaiter().GetResult();
		printer.HttpStatusCode = response.StatusCode;
	}
	catch (Exception ex)
	{
		printer.HttpStatusException = ex;
	}
}
```

## Invalid value for key 'Encrypt'
*.cs
```
SqlConnectionStringBuilder sqlConnectionStringBuilder = new();
sqlConnectionStringBuilder["Data Source"] = jsonSettings.Sql.DataSource;
sqlConnectionStringBuilder["Initial Catalog"] = jsonSettings.Sql.InitialCatalog;
sqlConnectionStringBuilder["Persist Security Info"] = jsonSettings.Sql.PersistSecurityInfo;
sqlConnectionStringBuilder["User ID"] = jsonSettings.Sql.UserId;
sqlConnectionStringBuilder["Password"] = jsonSettings.Sql.Password;
//sqlConnectionStringBuilder["Encrypt"] = jsonSettings.Sql.Encrypt;  // <--- fix error here
sqlConnectionStringBuilder["Connect Timeout"] = jsonSettings.Sql.ConnectTimeout;
sqlConnectionStringBuilder["TrustServerCertificate"] = jsonSettings.Sql.TrustServerCertificate;
```

## CS8632 - The annotation for nullable reference types should only be used in code within a ‘#nullable’ annotations context
```
#nullable enable
	private DataModel? _data;
#nullable disable
```
