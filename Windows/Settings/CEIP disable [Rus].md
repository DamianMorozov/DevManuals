# CEIP disable [Rus]

Как Отключить Программу улучшения качества ПО для Windows 10

gpedit.msc
Конфигурация компьютера →  Административные шаблоны →  Система →  Управление связью через Интернет →  Параметры связи через Интернет
Отключить программу по улучшению качества программного обеспечения Windows - Включено

regedit.exe
HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows​
CEIPEnable | REG_DWORD = 0
