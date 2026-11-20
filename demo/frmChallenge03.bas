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
	Private TypeSpinner As Spinner
	Private Types As List
	Private NoteLabel As Label
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

	Types.Initialize
	Types.AddAll(Array("Line", "Column", "Bar", "Pie", "Scatter", "Bubble", "Radar", "Combo", "Candle", "Polar Area", "Radial"))

	TypeSpinner.Initialize("TypeSpinner")
	TypeSpinner.AddAll(Types)
	Activity.AddView(TypeSpinner, 16dip, ChartTop + ChartHeight + 10dip, 210dip, 44dip)

	NoteLabel.Initialize("")
	NoteLabel.TextSize = 13
	NoteLabel.TextColor = Colors.RGB(85, 98, 113)
	NoteLabel.Gravity = Gravity.TOP
	Dim NoteTop As Int = ChartTop + ChartHeight + 62dip
	Dim NoteHeight As Int = Max(40dip, Activity.Height - NoteTop - 16dip)
	Activity.AddView(NoteLabel, 18dip, NoteTop, Activity.Width - 36dip, NoteHeight)

	TitleLabel.Text = "Challenge 1.3: Chart Type Picker"
	NoteLabel.Text = "Chapter 1 Challenge 3: Pick a chart type from the spinner to swap the inner chart."

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
	Chart.AddLabels(Array As String("Q1", "Q2", "Q3", "Q4"))
	Chart.AddValues(DS0, Array As Double(120, 180, 150, 220))
	Chart.EndUpdate
End Sub

Sub TypeSpinner_ItemClick (Position As Int, Value As Object)
	Select Position
		Case 0: Chart.ChartType = Chart.CHART_LINE
		Case 1: Chart.ChartType = Chart.CHART_COLUMN
		Case 2: Chart.ChartType = Chart.CHART_BAR
		Case 3: Chart.ChartType = Chart.CHART_PIE
		Case 4: Chart.ChartType = Chart.CHART_SCATTER
		Case 5: Chart.ChartType = Chart.CHART_BUBBLE
		Case 6: Chart.ChartType = Chart.CHART_RADAR
		Case 7: Chart.ChartType = Chart.CHART_COMBO
		Case 8: Chart.ChartType = Chart.CHART_CANDLE
		Case 9: Chart.ChartType = Chart.CHART_POLAR_AREA
		Case 10: Chart.ChartType = Chart.CHART_RADIAL
	End Select
End Sub

Sub PreviousButton_Click
	StartActivity(frmChallenge02)
End Sub

Sub NextButton_Click
	StartActivity(frmChallenge04)
End Sub

Sub BackButton_Click
	StartActivity(Main)
End Sub
