----------------------------------------------------------------------------------------------------
Snap packages.
https://losst.ru/ustanovka-snap-paketov-ubuntu
----------------------------------------------------------------------------------------------------
$ snap find                -- список доступных пакетов
$ sudo snap install пакет  -- установить пакет
$ snap list                -- список установленных пакетов
$ snap changes             -- история изменений
$ sudo snap refresh пакет  -- обновить пакет
$ sudo snap remove пакет   -- удалить пакет
$ snap install notepad-plus-plus
----------------------------------------------------------------------------------------------------
Создание snap-пакетов.
https://losst.ru/kak-sozdat-snap-paket-ubuntu-16-04
----------------------------------------------------------------------------------------------------
$ sudo add-apt-repository ppa:snappy-dev/tools  -- добавить PPA
$ sudo apt-get update                           -- получить новый список пакетов
$ sudo apt-get install snapcraft                -- установить SnapCraft
$ cd /home/.../TestProject/                     -- перейти в каталог с исходниками
----------------------------------------------------------------------------------------------------

