# GIT cheatsheet [Rus]

- [Back to the Home page](../../README.md)
- [Back to the Dev page](../README.md)
- [Back](README.md)

## Краткое руководство разработки ПО в Git
1. Права: https://gitlab.com/help/user/permissions
Master        --- ведущий разработчик ПО / владелец репозитория
Developer     --- разработчик проекта
Reporter      --- прочие
2. Ветки:
master        --- защищённая, используется только владельцем репозитория
dev           --- основная, содержит стабильный и актуальный исходный код
NameFamily    --- принадлежит конкретному разработчику
3. Основные понятия:
Commit - зафиксировать изменения
Fetch  – получить изменения из удаленного репозитория для сравнения и возможного последующего слияния
Push   – отправить изменения из локального репозитория в удаленный репозиторий
Merge  – выполнить слияние, применить изменения из другой ветки или другого репозитория
Pull   – fetch, затем merge

## Три состояния файлов
1. Committed / Зафиксированное  - данные сохранены в локальной БД
2. Modified  / Модифицированное - изменены файлы, но не зафиксированы в БД
3. Staged    / Индексированное  - пометили текущую версию модифицированного файла как предназначенную для фиксации

## Рабочая область
1. Каталог Git - метаданные, БД
2. Рабочий каталог
3. Область индексирования - файл

## Справка
git help <команда>
git <команда> -- help
man git <команда>

## Конфиг
```
.gitignore                                        ## файл исключений
git --version --build-options                     ## сведения об установленной версии GIT
git config --list                                 ## проверка глобальных настроек
git config --local --list                         ## проверка локальных настроек
git config --unset user.name                      ## удалить переменную
git config user.email                             ## проверка конкретной настройки
git config user.name                              ## проверка конкретной настройки
git config core.editor                            ## проверка конкретной настройки
git config --global user.name "[name]"            ## установить имя, которое будет прикрепляться к коммиту
git config --global user.email "[email address]"  ## установить email, который будет прикрепляться к коммиту
git config --global color.ui auto                 ## включить полезную подсветку командной строки
git config --global push.default current          ## обновлять удаленную ветку с таким же именем, что и локальная, при пуше изменений (если не указано иного)
git config --global core.editor [editor]          ## установить редактор для редактирования сообщений коммита
git config --global diff.tool [tool]              ## установить программу для разрешения конфликтов при слиянии
git config --global alias.co checkout             ## создать псевдоним команде checkout
git config --global alias.ci commit               ## создать псевдоним команде commit
git config --global alias.br branch               ## создать псевдоним команде branch
git config --global alias.st status               ## создать псевдоним команде status
git config --global alias.branchm "!git branch -m $2 $3 && git push $1 :$2 $3 -u #"
git config --global alias.unstage "reset HEAD --" ## создать псевдоним unstage команде reset HEAD -- (отмена индексирования)
git config --global alias.hist "log --oneline --decorate --graph --all"
git config --global alias.hist2 "log --graph --pretty=format:\"%C(yellow)%h%Creset%C(cyan)%C(bold)%d%Creset %C(cyan)(%cr)%Creset %C(green)%ce%Creset %s\""
git unstage [file]                                ## эквивалент команде git reset HEAD file
git config --global alias.last "log -1 HEAD"      ## создать псевдоним команде вывода последних коммитов
git config --global alias.visual "!gitk"          ## создать псевдоним команде вызова внешнего инструмента
git config --global credential.helper cache       ## задать параметры хранилища на хранение учётных данных в кэше ОЗУ
git config --global credential.helper store       ## задать параметры хранилища на хранение учётных данных в локальном файле
git config --global http.proxy http://user_name:password@server_address:port_number  -- прокси-сервер
git status                                        ## определить состояние
git status -s                                     ## определить состояние в упрощённом виде
git commit -a -m "..."                            ## коммит с автодобавлением файлов для индексирования
git diff                                          ## отобразить разницу файлов, изменённых но не проиндексированных
git diff --staged                                 ## сравнить индексированные изменения с содержимым последней зафиксированной версии
```

## Работа с изменениями
```
git status                                        ## полный список изменений файлов, ожидающих коммита
git status -s                                     ## краткий вид изменений
git diff                                          ## показать изменения в файлах, которые еще не были добавлены в индекс коммита (staged)
git diff --staged                                 ## показать что было добавленно в индекс с помощью git add, но еще не было закоммиченно
git diff HEAD                                     ## показать что изменилось с последнего коммита
git diff HEAD^                                    ## показать что изменилось с предпоследнего коммита
git diff [branch]                                 ## сравнить текущую ветку с заданной
git difftool -d                                   ## то же самое, что и diff, но показывает изменения в заданной difftool
git difftool -d [branch]                          ## показать изменения, сделанные в текущей ветке
git diff --stat                                   ## показать статистику какие файлы были изменены и как
git diff [file-branch] [second-branch]            ## посмотреть различия между двумя заданными ветками
```

## Индексация
```
git add .                                         ## добавить слежение за всеми файлами
git add *.cs                                      ## добавить слежение за файлами *.cs
git add [file]                                    ## добавить слежение за файлом
```

## Коммиты
```
git commit -a -m "text"                           ## автоиндексирование всех отслеживаемых файлов (вместо git add)
git commit -m "Initial commit"                    ## создать коммит
git commit -m "Subject" -m "Message"              ## многострочный коммит
git commit -m "Subject"$'\n'"Message"             ## многострочный коммит
git add forgotten_file                            ## проиндексировать файл
git commit --amend                                ## перезаписать предыдущий коммит, берет область индексирования, и включает в коммит всю обнаруженную информацию
git commit -a --amend                             ## перезаписать предыдущий коммит
git reset                                         ## убрать изменения из индекса коммита, сами изменения останутся
git reset [commit/tag]                            ## отменить все коммиты после указанного коммита, изменения будут сохранены локально
git reset [file]                                  ## убрать файлы из индекса коммита (изменения не теряются)
git reset HEAD [file]                             ## отменить индексирование файла
git reset --soft HEAD^                            ## отменить последний коммит
git reset --hard HEAD^                            ## удалить последний коммит
git reset --hard                                  ## восстановить изменения модифицированных файлов
git reset --hard [commit]                         ## принудительно вернутся к указанному коммиту, не сохраняя историю и изменения
git revert <commit_hash>                          ## отменить какой-то опубликованный коммит на сервере
git checkout -- [file]                            ## отменить изменения в самом файле (восстановить файл из предыдущей зафиксированной версии)
git checkout <commit_hash>                        ## перевести в состояние указанного коммита
```

## Репозитории
```
git init                                          ## создать репозиторий или реинициализировать существующий
git clone [url]                                   ## клонировать репозиторий из URL
git clone [url] "[folder]"                        ## клонировать репозиторий с сервера в новый каталог folder
git fetch [bookmark]                              ## скачать изменения из репозитория (без слияния)
git fetch --all                                   vскачать изменения из всех удалённых репозиториев (без слияния)
git pull                                          ## загрузить историю и изменения удаленной ветки и произвести слияние с текущей веткой
git pull [origin]                                 ## скачать изменения из репозитория и затем выполнить слияние
git pull [origin][branch]                         ## указать конкретную удаленную ветку для слияния
git pull [origin] --rebase                        ## скачать изменения из репозитория и затем выполнить слияние, переместить изменения из ветки
git push --all                                    ## отправить изменения всех веток
git push [origin]                                 ## отправить изменения текущей ветки в репозиторий
git push [origin] [branch]                        ## отправить изменения ветки в репозиторий
git push -u [origin] [branch]                     ## отправить изменения ветки в репозиторий и назначить текущей веткой
git push [origin] :[branch]                       ## удалить старую ветку
git push [origin] :[branch] [branch]              ## удалить старую ветку и отправить новую
git push [origin] [branchLocal]:[branchRemote]    ## отправить изменения текущей ветки в репозиторий в новую ветку
git push [origin] --delete [branch]               ## удалить ветку из удалённого репозитория
git push -u [origin] [master]                     ## если удаленная ветка не установлена как отслеживаемая, то сделать ее такой
git push -u [origin] --all                        ## отправить все ветки
git push -u [origin] --tags                       ## отправить все теги
git push --delete [remote_name] [branch]          ## удалить удалённую ветку
git push --set-upstream [origin] [branch]         ## назначить локальную ветку на удалённую
git remote                                        ## просмотр репозиториев
git remote -v                                     ## просмотр URL репозиториев
git remote add origin [url]                       ## добавить репозиторий
git remote remove origin                          ## удалить репозиторий
git remote rename origin [gitlab]                 ## переименовать репозиторий
git remote rm origin                              ## удалить ссылку на репозиторий
git remote set-url origin [https://...]           ## задать новое имя репозитория
git remote show origin                            ## подробный просмотр репозитория
```

## Удаление файлов
```
git clean -f                                      ## удалить новые добавленные файлы, которое не нужно коммитить
git clean -fd                                     ## удалить новые добавленные файлы и каталоги, которое не нужно коммитить
git mv [file-original] [file-renamed]             ## переместить файл (изменить имя файла и добавить в индекс коммита)
git rm [file]                                     ## удаление файла из списка отслеживаемых
git rm -rf .git*                                  ## удалить .gitignore и .gitmodules
git rm -rf .git                                   ## удалить репозиторий -r -- recursive, -f -- force
git rm log/\*.txt                                 ## удалить файлы *.txt в каталоге log
git rm \*~                                        ## удалить все файлы начинающиеся на символ ~
git rm --cached .                                 ## не следить за всеми файлами и каталогами
git rm --cached -rf .                             ## не следить за всеми файлами и каталогами
git rm --cached [file]                            ## не следить за файлом
git update-index --assume-unchanged [file]        ## удаляет из индекса файл (unstaged)
git update-index --no-assume-unchanged [file]     ## добавляет в индекс файл (unstaged)
```

## Отслеживание файлов
```
.gitignore                                        ## текстовый файл, в котором задаются правила для исключения файлов из репозитория
git ls-files --other --ignored --exclude-standard ## список всех игнорируемых файлов
```

## История версий
```
git log                                           ## история версий
git log --follow [file]                           ## список изменения текущего файла, включая переименования
git log -p -2                                     ## разница в истории версий, ограничить последние 2 записи
git log --oneline --decorate --graph --all        ## история версий, показывая места расположения указателей и точки расхождения
git log --pretty=oneline                          ## история версий в одну строку, формат вывода =short/=full/=fuller
git log --pretty=format:"%h %s" --graph           ## изменение вида отображения истории изменений
git log --author='Name' --after={1.week.ago} --pretty=oneline --abbrev-commit ## посмотреть над чем работал заданный пользователь последнюю неделю
git log --no-merges master                        ## посмотреть историю изменений только для текущей ветки
git log --since=2.weeks                           ## ограничить вывод 2 неделями
git log --stat                                    ## краткая статистика по каждой версии
git shortlog                                      ## группировка коммитов по пользователям
git show [commit]                                 ## показать метадату и изменения в заданном коммите
git show [branch]:[file]                          ## посмотреть на файл в другой ветке, не переключаясь на неё
```

## Теги
```
git push [origin] [tag]                           ## отправить тег в репозиторий
git push [origin] --tags                          ## отправить все теги в репозиторий
git show v1.6.4.047                               ## просмотр содержимого тега
git tag                                           ## просмотр тегов
git tag -l *v1.6*                                 ## поиск тегов по маске
git tag -a v1.6.4.047 -m "26.04.2018"             ## создать тег с версией и комментарием
git tag v1.6.4.047-lw                             ## создать легковесный тег с версией
git tag -a v1.6.1.001 d0704b00b5                  ## создать тег с версией для коммита по части хэша
```

## Ветвление
```
HEAD                                              ## указатель на текущую ветку
git checkout [branch]                             ## сменить ветку (перевести указатель HEAD)
git checkout [file]                               ## вернуть файл в первоначальное состояние если он еще не был добавлен в индекс коммита
git checkout -b [branch]                          ## создать новую ветку из текущей и перевести указатель HEAD
git checkout -b [branch] [origin/branch]          ## создать новую ветку из удалённой ветки и перевести указатель HEAD
git branch                                        ## просмотр всех веток
git branch [branch]                               ## создать новую ветку
git branch -a                                     ## посмотреть полный список локальных и удаленных веток
git branch -d [branch]                            ## удалить ветку
git branch -D [branch]                            ## удалить ветку, имеющую расхождения с удалённой
git branch -m [oldName] [newName]                 ## переименовать ветку
git branch -v                                     ## просмотр последних изменений всех веток
git branch -vv                                    ## просмотр списка наблюдения
git branch --merged                               ## просмотр веток, объединённых с текущей
git branch --no-merged                            ## просмотр веток, не объединённых с текущей
git merge [branchHotfix]                          ## объединить ветку branchHotfix с текущей веткой
git merge [origin/branch]                         ## выполнить слияние удалённой ветки в токующую
git merge --no-ff [branch]                        ## соединить ветки без режима "fast forwarding"
git mergetool                                     ## запустить инструмент разрешения конфликтов слияния
                                                  ## rebase лучше не пользоваться, есть merge
                                                  ## rebase можно пользоваться в локальном репозитории
git rebase [branch]                               ## переместить изменения в текущую ветку из ветки branch
git rebase [master] [server]                      ## переместить изменения в ветку master из ветки server
git rebase --onto master [server] [client]        ## переместить изменения в ветку master из ветки client, не связанные с изменениями ветки sever
-- git checkout [master]                          ## переместить указатель на ветку master
-- git merge [client]                             ## применить изменения ветки client
```

## Слежение за ветками
```
git checkout --track [origin/branch]              ## следить за удалённой веткой
git branch -u [origin/branch]                     ## сопоставить текущую ветку с удалённой
git merge @{u}                                    ## выполнить слияние из удалённой ветки
```

## Заначки / Сохранение фрагментов
```
git stash                                         ## скрыть изменения в специальном разделе stash
git stash list                                    ## список скрытых изменений
git stash apply                                   ## применить последний тайник
git stash apply stash@{2}                         ## применить указанный тайник
git stash apply --index                           ## применить последний тайник и внести изменения в индекс
git stash drop                                    ## удалить последние файлы, помещенные во временный тайник
git stash pop                                     ## применить скрытые изменения и немедленно удалить их из стека
git stash branch                                  ## создать ветви из скрытых изменений
```

## How to revert uncommitted changes including files and folders?
```
git reset --hard                                  ## Revert changes to modified files.
git clean -fd                                     ## Remove all untracked files and directories.
```

## Исключить файлы из коммита
```
Сначала нужен gitignore а потом уже файлы.
git rm -r --cached . || git rm --cached || git rm --cached <file-name> || git rm -r --cached <folder-name>
git add .
git commit -m ".gitignore"
```

## Renaming a branch
```
git branch -m oldname newname                     ## local renaming
git push origin :old_branch                       ## remote deleting old branch
git push origin new_branch                        ## remote creating new branch
git config --global alias.branchm "!git branch -m $2 $3 && git push $1 :$2 $3 -u #"
git branchm origin old_branch new_branch          ## remote branch renaming
```
