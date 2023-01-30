#NoEnv
#NoTrayIcon
#SingleInstance, ignore
FileEncoding, utf-8
path_config := A_ScriptDir . "\config.ini"
IfNotExist, % path_config
{
    Msgbox, 16, % "Lỗi", % path_config . "`nkhông tồn tại"
    ExitApp, 
}
IniRead, nHISEnvID, % path_config, section1, HISEnvID

Global gaResolution := ["1366x768","1920x1080"]

Gui, Font, s15 BOLD cNavy
Gui, Add, Text, , % "POSition"
Gui, Font,
Gui, Font, cNavy
Gui, Add, DropDownList, w130 choose1 vddlNhom gddlNhom, % ConvertARRtoString(gaResolution)
Gui, Add, Checkbox, x+210 h21 vcbFind gcbFind, % "Find"
Gui, Add, DropDownList, x+10, % "||Phòng khám|BHYT 5 năm|Mua sổ KB|BN ưu tiên|Giấy CT|Phòng làm việc|Version|Email|CMND|Người thân"

Gui, Add, Groupbox, x20 y80 w250 h160
Gui, Add, Groupbox, x280 y80 w250 h160
; Gui, Add, Groupbox, x20 y240 w510 h50
;Group 1
Gui, Add, Text, x30 y100 w80 h21 +0x200, % "Phòng khám:"
Gui, Add, Text, x30 y125 w80 h21 +0x200, % "BHYT 5 năm:"
Gui, Add, Text, x30 y150 w80 h21 +0x200, % "Mua sổ KB:"
Gui, Add, Text, x30 y175 w80 h21 +0x200, % "BN ưu tiên:"
Gui, Add, Text, x30 y200 w80 h21 +0x200, % "Giấy CT:"

Gui, Add, Text, x110 y100 h21 +0x200, % "X:"
Gui, Add, Text, x110 y125 h21 +0x200, % "X:"
Gui, Add, Text, x110 y150 h21 +0x200, % "X:"
Gui, Add, Text, x110 y175 h21 +0x200, % "X:"
Gui, Add, Text, x110 y200 h21 +0x200, % "X:"

Gui, Add, edit, x130 y100 w40 vedtx1 cMaroon
Gui, Add, edit, x130 y125 w40 vedtx2 cMaroon
Gui, Add, edit, x130 y150 w40 vedtx3 cMaroon
Gui, Add, edit, x130 y175 w40 vedtx4 cMaroon
Gui, Add, edit, x130 y200 w40 vedtx5 cMaroon

Gui, Add, Text, x190 y100 h21 +0x200, % "Y:"
Gui, Add, Text, x190 y125 h21 +0x200, % "Y:"
Gui, Add, Text, x190 y150 h21 +0x200, % "Y:"
Gui, Add, Text, x190 y175 h21 +0x200, % "Y:"
Gui, Add, Text, x190 y200 h21 +0x200, % "Y:"

Gui, Add, edit, x210 y100 w40 vedty1 cMaroon
Gui, Add, edit, x210 y125 w40 vedty2 cMaroon
Gui, Add, edit, x210 y150 w40 vedty3 cMaroon
Gui, Add, edit, x210 y175 w40 vedty4 cMaroon
Gui, Add, edit, x210 y200 w40 vedty5 cMaroon
;Group 2
Gui, Add, Text, x290 y100 w80 h21 +0x200, % "Phòng làm việc:"
Gui, Add, Text, x290 y125 w80 h21 +0x200, % "Version:"
Gui, Add, Text, x290 y150 w80 h21 +0x200, % "Email:"
Gui, Add, Text, x290 y175 w80 h21 +0x200, % "CMND:"
Gui, Add, Text, x290 y200 w80 h21 +0x200, % "Người thân:"

Gui, Add, Text, x370 y100 h21 +0x200, % "X:"
Gui, Add, Text, x370 y125 h21 +0x200, % "X:"
Gui, Add, Text, x370 y150 h21 +0x200, % "X:"
Gui, Add, Text, x370 y175 h21 +0x200, % "X:"
Gui, Add, Text, x370 y200 h21 +0x200, % "X:"

Gui, Add, edit, x390 y100 w40 vedtx6 cMaroon
Gui, Add, edit, x390 y125 w40 vedtx7 cMaroon
Gui, Add, edit, x390 y150 w40 vedtx8 cMaroon
Gui, Add, edit, x390 y175 w40 vedtx9 cMaroon
Gui, Add, edit, x390 y200 w40 vedtx10 cMaroon

Gui, Add, Text, x450 y100 h21 +0x200, % "Y:"
Gui, Add, Text, x450 y125 h21 +0x200, % "Y:"
Gui, Add, Text, x450 y150 h21 +0x200, % "Y:"
Gui, Add, Text, x450 y175 h21 +0x200, % "Y:"
Gui, Add, Text, x450 y200 h21 +0x200, % "Y:"

Gui, Add, edit, x470 y100 w40 vedty6 cMaroon
Gui, Add, edit, x470 y125 w40 vedty7 cMaroon
Gui, Add, edit, x470 y150 w40 vedty8 cMaroon
Gui, Add, edit, x470 y175 w40 vedty9 cMaroon
Gui, Add, edit, x470 y200 w40 vedty10 cMaroon
;Group 3
Gui, Add, button, x420 y250 w50 h32 gbtnSave, % "Lưu" 
Gui, Add, button, x480 y250 w50 h32 gbtnCLose , % "Đóng" 
Gui, Add, StatusBar
SB_SetParts(310, 20, 200)
Gui, Show,, % "POSition"
ControlGetText, outVar, ComboBox1, % "POS"
readfile(outVar)
SetTimer, Update, 250
SetTimer, Update, Off
Return

btnClose:
GuiClose:
GuiEscape:
    ExitApp,

ddlNhom:
    ControlGetText, outVar, ComboBox1, % "POS"
    readfile(outVar)
    Return

cbFind:
    Gui, Submit, NoHide

    If (cbFind)
    {
        SetTimer, Update, On
        Winset, AlwaysOnTop, On, % "POSition"
    }
    Else
    {
        SetTimer, Update, Off
        Winset, AlwaysOnTop, Off, % "POSition"
    }
    Return

btnSave:
    Gui, Submit, NoHide
    path := A_ScriptDir . "\POS\" . ddlNhom
    tmpPath := A_ScriptDir . "\POS\tmp"
    Loop, 10
    {
        var := edtx%A_index% . "," . edty%A_index%
        if ( A_index != 10)
            var := var . "`n"
        FileAppend, % var, % tmpPath
    }
    FileDelete, % path
    FileMove, % tmpPath, % path
    
    SB_SetText("Lưu thành công", 1)
    Return

Update:
    ;Gui, Default
    ControlGetText, var, ComboBox2, % "POSition"
    CoordMode, Mouse, Relative
    MouseGetPos, , , msWin, msCtrl
    WinGetTitle, WinTitle, ahk_id %msWin%
    If (WinTitle = "POSition") Or (WinTitle = "") OR (var = "")
    {
        SB_SetText("Hold Ctrl to pause update", 1)
        SB_SetText("", 3)
        Return
    }
    ControlGetText, ctrlName, %msCtrl%, % WinTitle
    SB_SetText(WinTitle, 1)
    SB_SetText(ctrlName, 3)
    ControlGetPos, ctrlX, ctrlY, , , %msCtrl%, % WinTitle
    Switch, var
    {
        Case "Phòng khám":
            GuiControl, , edtx1, % ctrlX
            GuiControl, , edty1, % ctrlY
        Case "BHYT 5 năm":
            GuiControl, , edtx2, % ctrlX
            GuiControl, , edty2, % ctrlY
        Case "Mua sổ KB":
            GuiControl, , edtx3, % ctrlX
            GuiControl, , edty3, % ctrlY
        Case "BN Ưu tiên":
            GuiControl, , edtx4, % ctrlX
            GuiControl, , edty4, % ctrlY
        Case "Số CT":
            GuiControl, , edtx5, % ctrlX
            GuiControl, , edty5, % ctrlY
        Case "Phòng làm việc":
            GuiControl, , edtx6, % ctrlX
            GuiControl, , edty6, % ctrlY
        Case "Version":
            GuiControl, , edtx7, % ctrlX
            GuiControl, , edty7, % ctrlY
        Case "Email":
            GuiControl, , edtx8, % ctrlX
            GuiControl, , edty8, % ctrlY
        Case "CMND":
            GuiControl, , edtx9, % ctrlX
            GuiControl, , edty9, % ctrlY
        Case "Người thân":
            GuiControl, , edtx10, % ctrlX
            GuiControl, , edty10, % ctrlY
    }
    Return

;Nhấn giữ ctrl
~*Ctrl::
    SetTimer, Update, Off
    Return

~*Ctrl up::
    SetTimer, Update, On
    Return

;Đọc dữ liệu
readfile(var) {
    path := A_ScriptDir . "\POS\" . var
    Loop, 10
    {
        i := A_Index
        GuiControl, , edtx%i%, % ""
        GuiControl, , edty%i%, % ""
        FileReadLine, OutputVar, % path, i
        Loop, Parse, OutputVar, `,
        {
            If (A_index = 1)
                GuiControl, , edtx%i%, % A_LoopField
             GuiControl, , edty%i%, % A_LoopField
        }
    }
    Return
}
; fn_GetlistFile(path)
; {
; 	tmpAR := []
; 	path := path . "\*.*"
; 	tmpString := ""
; 	Loop, % path
; 	{
; 		tmpAR.push(A_LoopFileName)
; 	}
; 	Return, tmpAR
; }
ConvertARRtoString(arr)
{
	i := arr.Length()
	Loop, % i
	{
		_str .= arr[A_Index]
		If (A_Index <> i)
			_str .= "|"
	}
	Return, _str
}