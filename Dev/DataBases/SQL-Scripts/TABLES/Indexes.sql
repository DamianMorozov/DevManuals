-- Indexes
SELECT 
	 [IND].[INDEX_ID] [INDEX_ID]
	,[IND].[NAME] [INDEX]
	,[IND].[TYPE_DESC]
	,[T].[NAME] [TABLE]
	,[COL].[NAME] [COLUMN]
	,[IC].*
	,[COL].* 
FROM [SYS].[INDEXES] [IND]
INNER JOIN [SYS].[INDEX_COLUMNS] [IC] ON [IND].[OBJECT_ID] = [IC].[OBJECT_ID] AND [IND].[INDEX_ID] = [IC].[INDEX_ID]
INNER JOIN [SYS].[COLUMNS] [COL] ON [IC].[OBJECT_ID] = [COL].[OBJECT_ID] AND [IC].[COLUMN_ID] = [COL].[COLUMN_ID]
INNER JOIN [SYS].[TABLES] [T] ON [IND].[OBJECT_ID] = [T].[OBJECT_ID]
ORDER BY [T].[NAME], [IND].[NAME], [IND].[INDEX_ID], [IC].[IS_INCLUDED_COLUMN], [IC].[KEY_ORDINAL];