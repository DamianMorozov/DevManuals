https://www.excel-vba.ru/chto-umeet-excel/kak-opredelit-poslednyuyu-yachejku-na-liste-cherez-vba/
====================================================================================================
' 65536
endRow = xlApp.ActiveSheet.UsedRange.Rows.Count
' 65536
endRow = xlApp.Range("A1").SpecialCells(xlCellTypeLastCell).Row
' 
endRow = xlApp.ActiveSheet.Cells.Find("", , xlValues, xlWhole, xlPrevious).Row
endRow = xlApp.ActiveSheet.UsedRange.Find("", , xlValues, xlWhole, xlPrevious).Row
' 
endRow = xlApp.ActiveSheet.Cells.Find("", , xlValues, xlPart, xlNext).Row
endRow = xlApp.ActiveSheet.UsedRange.Find("", , xlValues, xlPart, xlNext).Row
' Microsoft VBScript runtime error: Object required: 'ActiveSheet.Columns(...).Find(...)'
endRow = xlApp.ActiveSheet.Columns("A:A").Find("", , xlValues, xlWhole, xlPrevious).Row
endRow = xlApp.ActiveSheet.Columns("A:A").Find("", , xlValues, xlPart, xlNext).Row
endRow = xlApp.ActiveSheet.Columns("A:A").Find("", , xlValues, xlWhole, xlByColumns, xlPrevious).Row
endRow = xlApp.ActiveSheet.Columns("A:A").Find("", , xlValues, xlPart, xlByColumns, xlNext).Row
' 0x800a01a8 - Microsoft VBScript runtime error: Object required: 'ActiveSheet.Range(...).Find(...)'
endRow = xlApp.ActiveSheet.Range("A:A").Find("", , xlValues, xlPart, xlNext).Row
