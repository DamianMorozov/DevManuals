# Net use

View network drives
```
net use
```

Delete network drive
```
net use /delete <drive_letter>:
```

Add network drive
```
net use <drive_letter>: \\<remote_pc>\<remote_folder>
net use <drive_letter>: \\<remote_pc>\<remote_folder> /u:<domain_name>\<user_name>
net use <drive_letter>: \\<remote_pc>\<remote_folder> /u:<domain_name>\<user_name> <password>
```
