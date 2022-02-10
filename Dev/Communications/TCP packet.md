## Back to the home page
- [README](../../README.md)

## Back to the Programs developing page
- [Programs developing](../README.md)


Detailed information about the "http://www.google.com" URL:
```
+---------------+-------------------+
|      Part     |      Data         |
+---------------+-------------------+
|  Scheme       | http              |
|  Host         | www.google.com    |
+---------------+-------------------+
```

Detailed information about the ""https://bob:bobby@www.lunatech.com:8080/file;p=1?q=2#third"" URL:
```
+-------------------+---------------------+
|        Part       |       Data          |
+-------------------+---------------------+
|  Scheme           | https               |
|  User             | bob                 |
|  Password         | bobby               |
|  Host             | www.lunatech.com    |
|  Port             | 8080                |
|  Path             | /file;p=1           |
|  Path parameter   | p=1                 |
|  Query            | q=2                 |
|  Fragment         | third               |
+-------------------+---------------------+

https://bob:bobby@www.lunatech.com:8080/file;p=1?q=2#third
\___/   \_/ \___/ \______________/ \__/\_______/ \_/ \___/
  |      |    |          |          |      | \_/  |    |
Scheme User Password    Host       Port  Path |   | Fragment
        \_____________________________/       | Query
                       |               Path parameter
                   Authority
```
