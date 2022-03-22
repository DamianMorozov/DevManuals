# Mklink
https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/mklink

Creating a symbolic link.
mklink [[/d] | [/h] | [/j]] <Link> <Target>
	/d	Creates a directory symbolic link. By default, mklink creates a file symbolic link.
	/h	Creates a hard link instead of a symbolic link.
	/j	Creates a Directory Junction.
	<Link>	Specifies the name of the symbolic link that is being created.
	<Target>	Specifies the path (relative or absolute) that the new symbolic link refers to.

mklink /j "Link" "Target"
mklink /j "c:\Users\Damian\Downloads\Telegram Desktop" "a:\Library. Telegram"

rmdir "Folder"  --- removing a symbolic link to a directory, the directory itself is not deleted.
del "Target"    --- removing the file.
