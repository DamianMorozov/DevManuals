# MS SQL default settings

## Links
[Collation and Unicode support](https://docs.microsoft.com/en-us/sql/relational-databases/collations/collation-and-unicode-support)

Collation:
_CI_AS	Case-insensitive, accent-sensitive, kana-insensitive, width-insensitive
Windows locale	Windows LCID	SQL LCID	Default collation
Russian (Russia)	0x0419	0x0419	Cyrillic_General_CI_AS

Legacy collation: Latin1_General_CP1_CI_AS
Latest collation: Latin1_General_100_CI_AI
  uncheck Binary
  CS/CI: uncheck Case-sensitive: Joel == JOEL
  AS/AI: uncheck Accent-sensitive: Joel == Joel
  uncheck Supplementary characters
  uncheck Binary-code point
  uncheck Kana-sensitive
  uncheck Width-sensitive
