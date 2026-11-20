B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Activity
Version=11
@EndOfDesignText@

#region Activity Attributes
	#FullScreen: False
	#IncludeTitle: False
#End Region

Sub Process_Globals
End Sub

Sub Globals
	Private Chart As SithasoMPACharts
	Private TitleLabel As Label
	Private BackButton As Button
	Private PreviousButton As Button
	Private NextButton As Button
	Private ThemeBtn As Button
	Private NoteLabel As Label
	Private CurrentTheme As Int = 0
End Sub

Sub Activity_Create (FirstTime As Boolean)
	Activity.Color = Colors.White

	TitleLabel.Initialize("")
	TitleLabel.TextSize = 20
	TitleLabel.TextColor = Colors.RGB(27, 38, 59)
	TitleLabel.Gravity = Gravity.CENTER_VERTICAL
	Activity.AddView(TitleLabel, 16dip, 28dip, Activity.Width - 32dip, 48dip)

	BackButton.Initialize("BackButton")
	BackButton.Text = "Examples"
	BackButton.TextSize = 12
	Activity.AddView(BackButton, 8dip, 80dip, 76dip, 42dip)

	PreviousButton.Initialize("PreviousButton")
	PreviousButton.Text = "< Prev"
	PreviousButton.TextSize = 12
	Activity.AddView(PreviousButton, Activity.Width - 166dip, 80dip, 76dip, 42dip)

	NextButton.Initialize("NextButton")
	NextButton.Text = "Next >"
	NextButton.TextSize = 12
	Activity.AddView(NextButton, Activity.Width - 84dip, 80dip, 76dip, 42dip)

	Chart.Initialize("Chart")
	Dim ChartTop As Int = 136dip
	Dim ChartHeight As Int = Min(360dip, Max(220dip, Activity.Height - ChartTop - 150dip))
	Activity.AddView(Chart, 8dip, ChartTop, Activity.Width - 16dip, ChartHeight)

	ThemeBtn.Initialize("ThemeBtn")
	ThemeBtn.Text = "Next Theme (Default)"
	Activity.AddView(ThemeBtn, 16dip, ChartTop + ChartHeight + 10dip, 210dip, 44dip)

	NoteLabel.Initialize("")
	NoteLabel.TextSize = 13
	NoteLabel.TextColor = Colors.RGB(85, 98, 113)
	NoteLabel.Gravity = Gravity.TOP
	Dim NoteTop As Int = ChartTop + ChartHeight + 62dip
	Dim NoteHeight As Int = Max(40dip, Activity.Height - NoteTop - 16dip)
	Activity.AddView(NoteLabel, 18dip, NoteTop, Activity.Width - 36dip, NoteHeight)

	TitleLabel.Text = "Challenge 1.2: Theme Swap"
	NoteLabel.Text = "Chapter 1 Challenge 2: Tap Next Theme to cycle all 7 built-in themes."

	BuildChart
End Sub

Sub Activity_Resume
End Sub

Sub Activity_Pause (UserClosed As Boolean)
End Sub

Private Sub BuildChart
	Chart.BeginUpdate
	Chart.ChartType = Chart.CHART_LINE
	Dim DS0 As Int = Chart.AddDataSet("Revenue", 0)
	Chart.AddLabels(Array As String("Jan", "Feb", "Mar", "Apr", "May", "Jun"))
	Chart.AddValues(DS0, Array As Double(12, 19, 15, 28, 24, 35))
	Chart.EndUpdate
End Sub

Sub ThemeBtn_Click
	CurrentTheme = (CurrentTheme + 1) Mod 7
	Chart.BeginUpdate
	Chart.Theme = CurrentTheme
	Chart.AllowZoom = True
	Chart.DragEnabled = True
	Chart.LegendEnabled = Chart.LEGEND_AUTO
	Chart.EndUpdate
	ThemeBtn.Text = "Theme: " & GetThemeName(CurrentTheme)
End Sub

Private Sub GetThemeName(t As Int) As String
	Select t
		Case 0: Return "Default"
		Case 1: Return "Nightfall"
		Case 2: Return "Nightfall Dark"
		Case 3: Return "Material"
		Case 4: Return "Pastel"
		Case 5: Return "Cyberpunk"
		Case 6: Return "Liberty"
	End Select
	Return "Unknown"
End Sub

Sub PreviousButton_Click
	StartActivity(frmChallenge01)
End Sub

Sub NextButton_Click
	StartActivity(frmChallenge03)
End Sub

Sub BackButton_Click
	StartActivity(Main)
End Sub
