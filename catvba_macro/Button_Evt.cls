VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Button_Evt"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'vba CATIA V5用　ﾏｸﾛ起動(ﾃﾇｷ)ﾒﾆｭｰ  by Kantoku
'Button_Evt.cls
'ﾎﾞﾀﾝのｸﾘkｯｸｲﾍﾞﾝﾄを保持しています

Option Explicit
Private WithEvents mBtn As MSForms.CommandButton
Attribute mBtn.VB_VarHelpID = -1
Private mInfo As Object
Private mParentForm As MSForms.UserForm
Private mCloseType As Boolean

'Cat_Macro_Menu_Model.bas
'と一致させて欲しい(ｽｺｰﾌﾟ大きくしたくない)
Private Const TAG_ENTRYPNT = "ep"           'ﾀｸﾞｴﾝﾄﾘｰﾎﾟｲﾝﾄ
Private Const TAG_PJTPATH = "pjt_path"      'ﾀｸﾞﾌﾟﾛｼﾞｪｸﾄﾊﾟｽ
Private Const TAG_MDLNAME = "mdl_name"      'ﾀｸﾞﾓｼﾞｭｰﾙ名

'設定
Sub set_Event(ByVal Btn As MSForms.CommandButton, _
              ByVal BtnInfo As Object, _
              ByVal ParentForm As MSForms.UserForm, _
              ByVal CloseType As Boolean)
    Set mBtn = Btn
    Set mInfo = BtnInfo
    Set mParentForm = ParentForm
    mCloseType = CloseType
End Sub

'ﾎﾞﾀﾝｸﾘｯｸｲﾍﾞﾝﾄ
Private Sub mBtn_Click()
    If Not mCloseType Then Unload mParentForm
    
    Dim ary: ary = Array()
    Dim ss: Set ss = CATIA.SystemService
    
    Call ss.ExecuteScript(mInfo(TAG_PJTPATH), _
                          catScriptLibraryTypeVBAProject, _
                          mInfo(TAG_MDLNAME), _
                          mInfo(TAG_ENTRYPNT), _
                          Array())
End Sub
