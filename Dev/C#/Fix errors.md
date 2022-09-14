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
