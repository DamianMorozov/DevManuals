var input = "January 15, 2017 I will be 18 years old";
Console.WriteLine("Count of gigits: " + input.Count(x => char.IsDigit(x)));
Console.WriteLine("Count of gigits: " + input.Count(char.IsDigit));
Console.WriteLine("Count of numerics: " + Regex.Matches(input, @"\d+").Count);
Console.WriteLine("Count of numerics: " + Regex.Matches(input, @"\p{N}+").Count);
