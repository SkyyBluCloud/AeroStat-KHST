VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Form_frmAnnounce"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database

Private Sub add_Click()
    DoCmd.OpenForm "frmAnnounceSet", , , , acFormAdd
End Sub

Private Sub announcements_DblClick(cancel As Integer)
    DoCmd.OpenForm "frmAnnounceSet", , , "ID=" & announcements.Column(0), acFormEdit
End Sub

Private Sub announcements_GotFocus()
    announcements.Requery
End Sub

Private Sub del_Click()
If IsNull(Me.announcements) Then Exit Sub
    If MsgBox("Delete notice?", vbQuestion + vbYesNo, "Notice") = vbYes Then
        CurrentDb.Execute "DELETE FROM tblAnnounce WHERE ID = " & Me.announcements
        Me.announcements.Requery
    End If
End Sub
