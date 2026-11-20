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

	NoteLabel.Initialize("")
	NoteLabel.TextSize = 13
	NoteLabel.TextColor = Colors.RGB(85, 98, 113)
	NoteLabel.Gravity = Gravity.TOP
	Dim NoteTop As Int = ChartTop + ChartHeight + 26dip
	Dim NoteHeight As Int = Max(40dip, Activity.Height - NoteTop - 20dip)
	Activity.AddView(NoteLabel, 18dip, NoteTop, Activity.Width - 36dip, NoteHeight)
	'
	TitleLabel.Text = "42. Scatter shapes"
	NoteLabel.Text = "Distinct per-series point shapes: Triangle, Circle, and Square on one chart."
	'
	BuildChart
End Sub

Sub Activity_Resume
End Sub

Sub Activity_Pause (UserClosed As Boolean)
End Sub
'
Private Sub BuildChart
	Chart.BeginUpdate
	Chart.Title = "Scatter shapes"
	Chart.ShowTitle = True
	Chart.ChartType = Chart.CHART_SCATTER
	Chart.LegendEnabled = Chart.LEGEND_AUTO
	Chart.XTitle = "Period"
	Chart.YTitle = "Value"
	Chart.ScatterShapeSize = 10
'
	Dim DS0 As Int = Chart.AddDataSet("Triangles", Colors.RGB(230, 81, 0))
	Dim T0 As List = Array(Array As Double(1, 14), Array As Double(2, 22), Array As Double(4, 18), Array As Double(6, 29))
	For i = 0 To T0.Size - 1
	Dim P0() As Double = T0.Get(i)
	Chart.AddDataSetEntry(DS0, P0(0), P0(1))
	Next
	Chart.SetDataSetShape(DS0, Chart.SHAPE_TRIANGLE)
	Dim DS1 As Int = Chart.AddDataSet("Circles", Colors.RGB(30, 136, 229))
	Dim T1 As List = Array(Array As Double(1.5, 10), Array As Double(3, 26), Array As Double(5, 15), Array As Double(7, 33))
	For i = 0 To T1.Size - 1
	Dim P1() As Double = T1.Get(i)
	Chart.AddDataSetEntry(DS1, P1(0), P1(1))
	Next
	Chart.SetDataSetShape(DS1, Chart.SHAPE_CIRCLE)
	Dim DS2 As Int = Chart.AddDataSet("Squares", Colors.RGB(76, 175, 80))
	Dim T2 As List = Array(Array As Double(2, 8), Array As Double(3.5, 19), Array As Double(4.5, 24), Array As Double(6.5, 12))
	For i = 0 To T2.Size - 1
	Dim P2() As Double = T2.Get(i)
	Chart.AddDataSetEntry(DS2, P2(0), P2(1))
	Next
	Chart.SetDataSetShape(DS2, Chart.SHAPE_SQUARE)
	Chart.EndUpdate
End Sub

Sub PreviousButton_Click
    StartActivity(frmExample041)
End Sub

Sub NextButton_Click
    StartActivity(frmExample043)
End Sub

Sub BackButton_Click
	' B4A's StartActivity adds FLAG_ACTIVITY_REORDER_TO_FRONT and the main
	' activity is singleTop, so this brings the existing ListView to the
	' front from any page instead of creating a second one.
	StartActivity(Main)
End Sub
