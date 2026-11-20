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
	TitleLabel.Text = "98. Liberty: Growth"
	NoteLabel.Text = "Liberty combo chart: translucent teal bars with deep ocean cubic spline."
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
	Chart.Title = "Liberty: Growth"
	Chart.ShowTitle = True
	Chart.ChartType = Chart.CHART_COMBO
	Chart.LegendEnabled = Chart.LEGEND_AUTO
	Chart.XTitle = "Period"
	Chart.YTitle = "Value"
	Chart.ApplyLibertyTheme
	Chart.TitleBold = True
	Chart.TitleSize = 17
	Chart.SubtitleSize = 13
	Chart.BadgeBackgroundColor = 0xFFCCFBF1
	Chart.BadgeTextColor = 0xFF0F766E
	Chart.Title = "Liberty: Growth"
	Chart.ShowTitle = True
	Chart.Subtitle = "Bars: users · line: revenue"
	Chart.ShowSubtitle = True
	Chart.BarWidth = 0.5
	Chart.BarCornerRadius = 4
	Chart.LineWidth = 3
	Chart.CircleRadius = 4
	Chart.LineMode = Chart.MODE_CUBIC_BEZIER
	Chart.AxisMinimum = 0
	Chart.AxisMaximum = 100
	Chart.LabelCount = 5
'
	Dim DS0 As Int = Chart.AddBarDataSet("Users", 0x8C2A6D82)
	Chart.AddValues(DS0, Array As Double(40, 55, 48, 66, 60, 78, 70, 86, 74, 90, 82, 95))
	Dim DS1 As Int = Chart.AddLineDataSet("Revenue", 0xFF88B4BB)
	Chart.AddValues(DS1, Array As Double(30, 42, 38, 50, 52, 60, 58, 66, 64, 72, 70, 80))
	Chart.AddLabels(Array As String("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"))
	Chart.EndUpdate
End Sub

Sub PreviousButton_Click
    StartActivity(frmExample097)
End Sub

Sub NextButton_Click
    StartActivity(frmExample099)
End Sub

Sub BackButton_Click
	' B4A's StartActivity adds FLAG_ACTIVITY_REORDER_TO_FRONT and the main
	' activity is singleTop, so this brings the existing ListView to the
	' front from any page instead of creating a second one.
	StartActivity(Main)
End Sub
