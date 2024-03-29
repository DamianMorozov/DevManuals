# SVN cheatsheet [Rus]

- [Back to the Home page](../../README.md)
- [Back to the Dev page](../README.md)
- [Back](README.md)

## Справочная информация
```
svn help checkout    -- Check out a working copy from a repository
svn help commit      -- Send changes from your working copy to the repository
svn help mkdir       -- Create a new directory under version control
svnadmin help        -- 
```

## Создание репозитория
svnadmin create <svn-repository> 
Создадим где-нибудь начальный оригинал будущего проекта.
Выполним импорт этого оригинала проекта в репозиторий SVN с помощью команды svn import.
Оригинал проекта теперь стратегического смысла не имеет и его можно удалить.
Создаем рабочую копию проекта из репозитория SVN с помощью команды svn checkout.
Работаем с рабочей копией, вносим в нее изменения. Чтобы зафиксировать изменения необходимо передать их в репозиторий SVN с помощью команды svn commit.
При этом, в репозитории проекта, будет создана очередная по счету ревизия.
Игнорирование файлов SVN
Сделать файл list с именами или масками, разделённые переводом строки
svn propset ‘svn:ignore’ -F list

* trunk — основная линия разработки. Здесь будет актуальный на данный момент код, здесь будут выполняться мелкие задачи и правки багов.
* branches — ветка для разработчиков. гсуто ветвится другими ветками. Именно в ней вы будете создавать свои ветки.
* tags — ветка тэгов. Тут создаются всякие метки, отмечающие значимые вехи развития проектов, проще говоря его стабильные и не очень версии. 
  Нужна она для того, что бы всегда можно было вернуться до какой нибудь версии, например что бы посмотреть «почему эта хрень раньше работала а потом перестала».

## Commands
```
svn update                                 -- обновить
svn status                                 -- проверить статус
svn checkout http://<repository_path>      -- 
svn copy <Source> <Destination>            -- копировать репозиторий в локальный каталог
svn copy trunk/* branches/<branchName>     -- копировать основную линию в локальную ветку
svn copy http://svn.example.com/repos/calc/trunk http://svn.example.com/repos/calc/branches/my-calc-branch -m "Creating a private branch of /calc/trunk."
svn switch                                 -- альтернативный способо создания рабочей копии ветки
svn log --verbose integer.c                -- 
svn merge                                  -- объединить ветки
svn diff                                   -- показать все изменения
svn info                                   -- получить информацию по текущему каталогу
svn log --stop-on-copy                     -- просмотр номера ревизии текущего каталога
svn up                                     -- отобразить последный номер ревизии
```
