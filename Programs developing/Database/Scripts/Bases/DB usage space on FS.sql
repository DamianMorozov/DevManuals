-- DB usage space on FS
select distinct
       serverproperty('MachineName') [MachineName]
     ,isnull(serverproperty('InstanceName'), 'MSSQLSERVER') [InstanceName]
     ,[vs].[volume_mount_point] [VolumeName]
     ,[vs].logical_volume_name [VolumeLabel]
     ,[vs].total_bytes [VolumeCapacity]
     ,[vs].available_bytes [VolumeFreeSpace]
     , CAST([vs].[available_bytes] * 100.0 / [vs].[total_bytes] as decimal(5, 2)) PercentageFreeSpace
from [sys].[master_files] [mf]
cross apply [sys].[dm_os_volume_stats]([mf].database_id, mf.file_id) [vs]
