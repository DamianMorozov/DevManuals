# MS SQL data types

- [Data types (Transact-SQL)](https://docs.microsoft.com/en-us/sql/t-sql/data-types/data-types-transact-sql)

## Exact numerics
[bigint, int, smallint, tinyint](https://docs.microsoft.com/en-us/sql/t-sql/data-types/int-bigint-smallint-and-tinyint-transact-sql)
  Exact-number data types that use integer data.
  Data type	  	Range	                                                                    Storage
  tinyint	    0 to 255	                                                                1 Byte
  smallint		-2^15 (-32,768) to 2^15-1 (32,767)	                                      	2 Bytes
  int	        -2^31 (-2,147,483,648) to 2^31-1 (2,147,483,647)	                        4 Bytes
  bigint	    -2^63 (-9,223,372,036,854,775,808) to 2^63-1 (9,223,372,036,854,775,807)	8 Bytes
[decimal, numeric](https://docs.microsoft.com/en-us/sql/t-sql/data-types/decimal-and-numeric-transact-sql)
  Numeric data types that have fixed precision and scale. Decimal and numeric are synonyms and can be used interchangeably.
  decimal[ (p[ ,s] )] and numeric[ (p[ ,s] )]
  Precision	  Storage
  1 - 9	      5 Bytes
  10-19	      9 Bytes
  20-28	      13 Bytes
  29-38	      17 Bytes
[bit](https://docs.microsoft.com/en-us/sql/t-sql/data-types/bit-transact-sql)
  An integer data type that can take a value of 1, 0, or NULL.
[smallmoney, money](https://docs.microsoft.com/en-us/sql/t-sql/data-types/money-and-smallmoney-transact-sql)
  Data types that represent monetary or currency values.
  Data type	  	Range																							Storage
  money	      	-922,337,203,685,477.5808 to 922,337,203,685,477.5807 (-922,337,203,685,477.58
				to 922,337,203,685,477.58 for Informatica. Informatica only supports two decimals, not four.)	8 bytes
  smallmoney	- 214,748.3648 to 214,748.3647																	4 bytes

## Approximate numerics
[float, real](https://docs.microsoft.com/en-us/sql/t-sql/data-types/float-and-real-transact-sql)
  Approximate-number data types for use with floating point numeric data.
  n value	  Precision	  Storage
  1-24	    7 digits	  4 bytes
  25-53	    15 digits	  8 bytes
  Data type	Range	                                                        Storage
  float	    - 1.79E+308 to -2.23E-308, 0 and 2.23E-308 to 1.79E+308	      Depends on the value of n
  real	    - 3.40E + 38 to -1.18E - 38, 0 and 1.18E - 38 to 3.40E + 38	  4 Bytes

## Date and time
[date](https://docs.microsoft.com/en-us/sql/t-sql/data-types/date-transact-sql)
  Defines a date in SQL Server.
  Data type	      Default string literal          Down-level ODBC	              Down-level OLEDB          Down-level JDBC	  Down-level SQLCLIENT
                  format passed to                              
                  down-level client
  time	          hh:mm:ss[.nnnnnnn]	            SQL_WVARCHAR or SQL_VARCHAR	  DBTYPE_WSTRor DBTYPE_STR	Java.sql.String	  String or SqString
  date	          YYYY-MM-DD	                    SQL_WVARCHAR or SQL_VARCHAR	  DBTYPE_WSTRor DBTYPE_STR	Java.sql.String	  String or SqString
  datetime2	      YYYY-MM-DD hh:mm:ss[.nnnnnnn]	  SQL_WVARCHAR or SQL_VARCHAR	  DBTYPE_WSTRor DBTYPE_STR	Java.sql.String	  String or SqString
  datetimeoffset	YYYY-MM-DD hh:mm:ss[.nnnnnnn]   SQL_WVARCHAR or SQL_VARCHAR	  DBTYPE_WSTRor DBTYPE_STR	Java.sql.String	  String or SqString
                  [+|-]hh:mm
[smalldatetime](https://docs.microsoft.com/en-us/sql/t-sql/data-types/smalldatetime-transact-sql)
  Defines a date that is combined with a time of day.

## Character strings
[char, varchar](https://docs.microsoft.com/en-us/sql/t-sql/data-types/char-and-varchar-transact-sql)
  Character data types that are either fixed-size, char, or variable-size, varchar.
[text](https://docs.microsoft.com/en-us/sql/t-sql/data-types/ntext-text-and-image-transact-sql)
  Fixed and variable-length data types for storing large non-Unicode and Unicode character and binary data. Unicode data uses the UNICODE UCS-2 character set.
  
## Unicode character strings
[nchar, nvarchar](https://docs.microsoft.com/en-us/sql/t-sql/data-types/nchar-and-nvarchar-transact-sql)
  Character data types that are either fixed-size, nchar, or variable-size, nvarchar.
[ntext](https://docs.microsoft.com/en-us/sql/t-sql/data-types/ntext-text-and-image-transact-sql)
  Fixed and variable-length data types for storing large non-Unicode and Unicode character and binary data. Unicode data uses the UNICODE UCS-2 character set.

## Binary strings
[binary, varbinary](https://docs.microsoft.com/en-us/sql/t-sql/data-types/binary-and-varbinary-transact-sql)
  Binary data types of either fixed length or variable length.
  Data type	      Use when ...
  binary	        the sizes of the column data entries are consistent.
  varbinary	      the sizes of the column data entries vary considerably.
  varbinary(max)	the column data entries exceed 8,000 bytes.
[image](https://docs.microsoft.com/en-us/sql/t-sql/data-types/ntext-text-and-image-transact-sql)
  Fixed and variable-length data types for storing large non-Unicode and Unicode character and binary data. Unicode data uses the UNICODE UCS-2 character set.

## Other data types
[cursor](https://docs.microsoft.com/en-us/sql/t-sql/data-types/cursor-transact-sql)
  A data type for variables or stored procedure OUTPUT parameters that contain a reference to a cursor.
[table](https://docs.microsoft.com/en-us/sql/t-sql/data-types/table-transact-sql)
  Is a special data type used to store a result set for processing at a later time.
[hierarchyid](https://docs.microsoft.com/en-us/sql/t-sql/data-types/hierarchyid-data-type-method-reference)
  The hierarchyid data type is a variable length, system data type. Use hierarchyid to represent position in a hierarchy.
[sql_variant](https://docs.microsoft.com/en-us/sql/t-sql/data-types/sql-variant-transact-sql)
  A data type that stores values of various SQL Server-supported data types.
[rowversion](https://docs.microsoft.com/en-us/sql/t-sql/data-types/rowversion-transact-sql)
  Is a data type that exposes automatically generated, unique binary numbers within a database.
[uniqueidentifier](https://docs.microsoft.com/en-us/sql/t-sql/data-types/uniqueidentifier-transact-sql)
  Is a 16-byte GUID.
[xml](https://docs.microsoft.com/en-us/sql/t-sql/xml/xml-transact-sql)
  It's the data type that stores XML data. You can store xml instances in a column, or a variable of xml type.
[Spatial Types - geometry](https://docs.microsoft.com/en-us/sql/t-sql/spatial-geometry/spatial-types-geometry-transact-sql)
  The planar spatial data type, geometry, is implemented as a common language runtime (CLR) data type in SQL Server. This type represents data in a Euclidean (flat) coordinate system.
[Spatial Types - geography](https://docs.microsoft.com/en-us/sql/t-sql/spatial-geography/spatial-types-geography)
  The geography spatial data type, geography, is implemented as a .NET common language runtime (CLR) data type in SQL Server.
