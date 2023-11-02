# Entity Framework Core usage

## Entity Framework NuGet packages for .NET Framework
```
EntityFramework
EntityFramework6.Npgsql
```

## Entity Framework Core NuGet
```
dotnet add package Microsoft.EntityFrameworkCore.SqlServer
dotnet add package Microsoft.EntityFrameworkCore.Sqlite
dotnet add package Microsoft.EntityFrameworkCore.Cosmos
dotnet add package Microsoft.EntityFrameworkCore
dotnet add package Microsoft.EntityFrameworkCore.Tools
```

## Basic usage
```
using var db = new BloggingContext();

// Inserting data into the database
db.Add(new Blog { Url = "http://blogs.msdn.com/adonet" });
db.SaveChanges();

// Querying
var blog = db.Blogs
    .OrderBy(b => b.BlogId)
    .First();

// Updating
blog.Url = "https://devblogs.microsoft.com/dotnet";
blog.Posts.Add(
    new Post
    {
        Title = "Hello World",
        Content = "I wrote an app using EF Core!"
    });
db.SaveChanges();

// Deleting
db.Remove(blog);
db.SaveChanges();
```

## Sqlite NuGet
```
dotnet add package Microsoft.Data.Sqlite
```

## Basic usage
```
using var connection = new SqliteConnection("Data Source=Blogs.db");
connection.Open();

using var command = connection.CreateCommand();
command.CommandText = "SELECT Url FROM Blogs";

using var reader = command.ExecuteReader();
while (reader.Read())
{
    var url = reader.GetString(0);
}
```

## PostgreSQL Npgsql
```
dotnet add package Npgsql
dotnet add package Npgsql.EntityFrameworkCore.PostgreSQL
```
- NpgsqlConnection
- NpgsqlCommand
- NpgsqlTransaction
- NpgsqlDataReader

## Code Conventions
- Schema: dbo, public
- Primary Key: Id, <EntityClassId>
- Foreign Key: as the principal entity primary key
- Null: Nullable types: Classes, string
- Not null: primitives: int, double, float
- Cascade delete: yes

## Data Annotation Attributes
- [Key]
- [Column]
- [Required]
- [MinLength] | [MaxLength] | [StringLength]
- [Table]
- [Index] | [Index(IsUnique = true)]
- [ForeignKey]
- [NotMapped]

## Fluent API
- protected override void OnModelCreating(ModelBuilder modelBuilder)
modelBuilder.Entity<PlSqlTablePerson>().Property(item => item.Name).IsRequired();
modelBuilder.Entity<PlSqlTablePerson>().HasIndex(item => item.Name);
modelBuilder.Entity<PlSqlTableDepartment>().Property(item => item.Name).HasColumnName("Title");
modelBuilder.Entity<PlSqlTablePerson>()
	.HasOne<PlSqlTableDepartment>(item => item.Department)
	.WithMany(d => d.Persons)
	.HasForeignKey(item => item.DepartmentId);

## Optimization query
```
var query = await c.ParentEntities
	.AsNoTracking()
	.Include(e => e.Children1)
	.Include(e => e.Children2)
	.AsSplitQuery()
	.Where(e => e.Id == parentKey)
	.ToListAsync();
```

## Instantiate new object of DbContext from ConnectionString
```
var connectionstring = "Connection string";
var optionsBuilder = new DbContextOptionsBuilder<ApplicationDbContext>();
    optionsBuilder.UseSqlServer(connectionstring);
ApplicationDbContext dbContext = new ApplicationDbContext(optionsBuilder.Options);

// Or you can also instantiate inside using
using(ApplicationDbContext dbContext = new ApplicationDbContext(optionsBuilder.Options))
{
   //...do stuff
}
```

## Global Enable Query Splitting
```
protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
{
    optionsBuilder
        .UseSqlServer(
            @"Server=(localdb)\mssqllocaldb;Database=EFQuerying;Trusted_Connection=True",
            o => o.UseQuerySplittingBehavior(QuerySplittingBehavior.SplitQuery));
}
```

## Update
```
public Book UpdateBook(ChangePubDateDto dto)
{
    var book = _context.Books.SingleOrDefault(x => x.BookId == dto.BookId);
    if (book == null)
        throw new ArgumentException("Book not found");
    book.PublishedOn = dto.PublishedOn;
    _context.SaveChanges();
    return book;
}
```

## Migrations
Install: 			`dotnet tool install --global dotnet-ef`
Update:				`dotnet tool update --global dotnet-ef`
Add NuGet:			`dotnet add package Microsoft.EntityFrameworkCore.Design`
Verify :			`dotnet ef`
Environment:		`dotnet ef database update -- --environment Production`
Drop DB:			`dotnet ef database drop`
Update DB:			`dotnet ef database update <migration_name> <connection_string>`
Info:				`dotnet ef dbcontext info`
List of types:		`dotnet ef dbcontext list`
Compile:			`dotnet ef dbcontext optimize`
Add migration:		`dotnet ef migrations add`
Create exe:			`dotnet ef migrations bundle`
Check changes:		`dotnet ef migrations has-pending-model-changes`
List of migrations:	`dotnet ef migrations list`
Remove migration:	`dotnet ef migrations remove`
Generate script:	`dotnet ef migrations script <migration_name>`
