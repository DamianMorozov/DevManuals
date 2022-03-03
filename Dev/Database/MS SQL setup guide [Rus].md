# MS SQL setup guide [Rus]
Установка MS SQL Server (под пользователем с правами админа).

## Перед установкой
1. Деинсталировать MS SQL Server
2. Последний SP для Windows
3. Windows Installer 4.5 (KB942288)
\SYSTEM\CurrentControlSet\services\msiserver
4. FrameWork 3.5 SP1
Сам пакет: http://www.microsoft.com/ru-Ru/download/details.aspx?id=25150
Проверка версии: http://support.microsoft.com/kb/318785/ru
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\NET Framework Setup\NDP\v3.5
4.0 не подходит
Для Windows Server 2008/2012:
Панель управления -> Программы и компоненты -> Включение компонентов Windows -> ... -> Включить FrameWork 3.5
Как изменить путь к установочным файлам в Windows: HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Setup\SourcePath

## SQL Server
Настройка брандмауэра Windows для разрешения доступа к SQL Server
https://msdn.microsoft.com/ru-ru/library/cc646023.aspx
1. Настройка экземпляра
Пуск -> Программы -> Microsoft SQL Server 2008 -> Средства настройки -> Диспетчер конфигурации SQL Server (SQL Server Configuration Manager)
Окно настроек протокола TCP/IP. Для этого в левой части окна выберите «Протоколы для MSSQLSERVER», а в правой — «TCP/IP».
Подключить протокол, выбрав «Да» в свойстве «Включено».
На вкладке «IP-адреса» для всех IP установить значения:
•	для «Активен» — значение «Да»;
•	для «Включено» — значение «Да»;
•	для «TCP-порт» — значение «1433». 
Перезапуск службы сервера баз данных.
SQL Server Services -> SQL Server -> Restart
2. Дополнительная настройка русской версии
Microsoft SQL Server Management Studio.
Контекстное меню для сервера БД, соединение с которым установлено -> «Свойства» -> вкладка «Дополнительно» -> «Язык по умолчанию» -> «English» -> «OK».
Безопасность -> Имена входа: sa -> Свойства -> Общие: Язык по умолчанию -> English
Перезапуск службы сервера БД.
3. Настройка Брендмауэра: Входящие на 1433.
4. Дополнительная настройка
В ряде случаев при указании сервера БД в клиентской программе необходимо указать TCP-порт 1433 ("hostname,1433").
