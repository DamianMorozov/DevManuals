Невозможно привести Com-объект типа System.__ComObject к интерфейсному типу

Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\Interface\{6D5140C1-7436-11CE-8034-00AA006009FA}]
@="IServiceProvider"

[HKEY_CLASSES_ROOT\Interface\{6D5140C1-7436-11CE-8034-00AA006009FA}\NumMethods]
@="4"

[HKEY_CLASSES_ROOT\Interface\{6D5140C1-7436-11CE-8034-00AA006009FA}\ProxyStubClsid32]
@="{B8DA6310-E19B-11D0-933C-00A0C90DCAA9}"

[HKEY_CURRENT_USER\Software\Classes\Interface\{6D5140C1-7436-11CE-8034-00AA006009FA}]
@="IServiceProvider"

[HKEY_CURRENT_USER\Software\Classes\Interface\{6D5140C1-7436-11CE-8034-00AA006009FA}\NumMethods]
@="4"

[HKEY_CURRENT_USER\Software\Classes\Interface\{6D5140C1-7436-11CE-8034-00AA006009FA}\ProxyStubClsid32]
@="{B8DA6310-E19B-11D0-933C-00A0C90DCAA9}"

[HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{6D5140C1-7436-11CE-8034-00AA006009FA}]
@="IServiceProvider"

[HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{6D5140C1-7436-11CE-8034-00AA006009FA}\NumMethods]
@="4"

[HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{6D5140C1-7436-11CE-8034-00AA006009FA}\ProxyStubClsid32]
@="{B8DA6310-E19B-11D0-933C-00A0C90DCAA9}"

затем перерегистрировал ieproxy.dll (я так понимаю, у всех эта проблема после установки 8IE)
для 64битной ОС: regsvr32 "C:\Program Files\Internet Explorer\ieproxy.dll"

для 64битной ОС: regsvr32 "C:\Program Files (x86)\Internet Explorer\ieproxy.dll"