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
	TitleLabel.Text = "14. Half donut gauge"
	NoteLabel.Text = "Half Doughnut Gauge: IsDonut = True, MaxAngle = 180, RotationAngle = 180, HoleRadius = 65%."
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
	Chart.Title = "Half donut gauge"
	Chart.ShowTitle = True
	Chart.ChartType = Chart.CHART_PIE
	Chart.LegendEnabled = Chart.LEGEND_AUTO
	Chart.IsDonut = True
	Chart.HoleRadius = 65
	Chart.MaxAngle = 180
	Chart.RotationAngle = 180
	Chart.CenterText = "85%"
	Chart.CenterSubtext = "SCORE"
	Chart.SliceCornerRadius = 8
	Chart.PadAngle = 3
	Chart.SliceGradient = True
	Chart.DrawEntryLabels = True
	Chart.DrawValues = False
	Chart.ValueFontSize = 11
	Chart.LegendEnabled = Chart.LEGEND_SHOW
	Chart.BadgeText = "GAUGE"
	Chart.BadgeBackgroundColor = Colors.RGB(33, 150, 243)
	Chart.BadgeTextColor = Colors.White
'
	Dim DS0 As Int = Chart.AddDataSet("Health", 0)
	Chart.AddValues(DS0, Array As Double(15, 25, 40, 20))
	Chart.SetDataSetColors(DS0, Array As Int(0xFFEF4444, 0xFFF59E0B, 0xFF10B981, 0xFF3B82F6))
	Chart.AddLabels(Array As String("Critical", "Warning", "Normal", "Optimal"))
	Chart.EndUpdate
End Sub

Sub PreviousButton_Click
    StartActivity(frmExample013)
End Sub

Sub NextButton_Click
    StartActivity(frmExample015)
End Sub

Sub BackButton_Click
	' B4A's StartActivity adds FLAG_ACTIVITY_REORDER_TO_FRONT and the main
	' activity is singleTop, so this brings the existing ListView to the
	' front from any page instead of creating a second one.
	StartActivity(Main)
End Sub
