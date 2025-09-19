# Windows 10 updates blacklist

## Команды для поиска и удаления обновления
```
wmic qfe get HotFixID | find "KB5063878"
dism /online /get-packages | findstr KB5063878
wusa /uninstall /kb:5063878 /quiet /norestart
```

## Команды для проверки дисков
```
chkdsk C: /f /r
```

KB-номер | Версия Windows | Причина удаления (в прошлом) | 
KB5001330 | Win10 20H2/21H1 | Снижение FPS в играх, сбои печати | 
KB5000842 | Win10 20H2 | Проблемы с производительностью, синие экраны | 
KB5025885 | Win10 | Некорректная работа сетевых подключений | 
KB5012643 | Win11 21H2 | Ошибки в работе Safe Mode с Boot | 
KB5013943 | Win11 | BSOD, ошибки загрузки ОС
KB5014019 | Win11 | Неполное исправление багов .NET Framework
KB5027231 | Win11 22H2 | Петли перезагрузки на части устройств | 
KB5063878 | Win11 24H2 | Вывод из строя HDD/SSD

## Создать точку восстановления
```
Enable-ComputerRestore -Drive "C:"
Checkpoint-Computer -Description "Before removing KB" -RestorePointType MODIFY_SETTINGS
```

## 🖥 PowerShell-скрипт для удаления конкретных KB: `.\Remove-and-hide-KBs.ps1`
Разреши выполнение скриптов командой: `Set-ExecutionPolicy RemoteSigned`

## Show or Hide Updates
https://download.microsoft.com/download/f/2/2/f22d5fdb-59cd-4275-8c95-1be17bf70b21/wushowhide.diagcab
Hide updates - KB5063878 - Далее
