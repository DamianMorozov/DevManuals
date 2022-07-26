# MS SQL setup guide [Rus]
��������� MS SQL Server (��� ������������� � ������� ������).

## ����� ����������
1. ��������������� MS SQL Server
2. ��������� SP ��� Windows
3. Windows Installer 4.5 (KB942288)
\SYSTEM\CurrentControlSet\services\msiserver
4. FrameWork 3.5 SP1
��� �����: http://www.microsoft.com/ru-Ru/download/details.aspx?id=25150
�������� ������: http://support.microsoft.com/kb/318785/ru
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\NET Framework Setup\NDP\v3.5
4.0 �� ��������
��� Windows Server 2008/2012:
������ ���������� -> ��������� � ���������� -> ��������� ����������� Windows -> ... -> �������� FrameWork 3.5
��� �������� ���� � ������������ ������ � Windows: HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Setup\SourcePath

## SQL Server
��������� ����������� Windows ��� ���������� ������� � SQL Server
https://msdn.microsoft.com/ru-ru/library/cc646023.aspx
1. ��������� ����������
���� -> ��������� -> Microsoft SQL Server 2008 -> �������� ��������� -> ��������� ������������ SQL Server (SQL Server Configuration Manager)
���� �������� ��������� TCP/IP. ��� ����� � ����� ����� ���� �������� ���������� ��� MSSQLSERVER�, � � ������ � �TCP/IP�.
���������� ��������, ������ ��� � �������� ���������.
�� ������� �IP-������ ��� ���� IP ���������� ��������:
�	��� �������� � �������� ���;
�	��� ��������� � �������� ���;
�	��� �TCP-���� � �������� �1433�. 
���������� ������ ������� ��� ������.
SQL Server Services -> SQL Server -> Restart
2. �������������� ��������� ������� ������
Microsoft SQL Server Management Studio.
����������� ���� ��� ������� ��, ���������� � ������� ����������� -> ��������� -> ������� �������������� -> ����� �� ���������� -> �English� -> �OK�.
������������ -> ����� �����: sa -> �������� -> �����: ���� �� ��������� -> English
���������� ������ ������� ��.
3. ��������� �����������: �������� �� 1433.
4. �������������� ���������
� ���� ������� ��� �������� ������� �� � ���������� ��������� ���������� ������� TCP-���� 1433 ("hostname,1433").
