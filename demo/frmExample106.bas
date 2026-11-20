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
	TitleLabel.Text = "106. Nightfall Dark: Team profile"
	NoteLabel.Text = "Nightfall Dark radar chart: translucent web, dual skill polygons with alpha 56, bottom legend."
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
	Chart.Title = "Nightfall Dark: Team profile"
	Chart.ShowTitle = True
	Chart.ChartType = Chart.CHART_RADAR
	Chart.LegendEnabled = Chart.LEGEND_AUTO
	Chart.ApplyNightfallDarkTheme
	Chart.TitleBold = True
	Chart.TitleSize = 17
	Chart.SubtitleSize = 13
	Chart.BadgeBackgroundColor = 0xFF1E293B
	Chart.BadgeTextColor = 0xFF2FB4B6
	Chart.Title = "Nightfall Dark: Team profile"
	Chart.ShowTitle = True
	Chart.Subtitle = "Skills, 0 to 100"
	Chart.ShowSubtitle = True
	Chart.FillAlpha = 56
	Chart.LineWidth = 2.5
	Chart.DrawWebEnabled = True
	Chart.WebLineWidth = 1
	Chart.WebColor = 0x5094A3B8
	Chart.DrawAxisValues = False
	Chart.AxisMinimum = 0
	Chart.AxisMaximum = 100
	Chart.LegendEnabled = Chart.LEGEND_SHOW
	Chart.LegendPosition = Chart.LEGEND_BOTTOM
	Chart.LegendFontSize = 11
	Chart.LegendFormSize = 10
'
	Dim DS0 As Int = Chart.AddDataSet("Last week", 0xFF8B7CF6)
	Chart.AddValues(DS0, Array As Double(50, 85, 40, 90, 80, 45))
	Dim DS1 As Int = Chart.AddDataSet("This week", 0xFF2FB4B6)
	Chart.AddValues(DS1, Array As Double(90, 60, 80, 70, 50, 85))
	Chart.AddLabels(Array As String("Speed", "Power", "Range", "Agility", "Stealth", "Armor"))
	Chart.EndUpdate
End Sub

Sub PreviousButton_Click
    StartActivity(frmExample105)
End Sub

Sub NextButton_Click
    StartActivity(frmExample107)
End Sub

Sub BackButton_Click
	' B4A's StartActivity adds FLAG_ACTIVITY_REORDER_TO_FRONT and the main
	' activity is singleTop, so this brings the existing ListView to the
	' front from any page instead of creating a second one.
	StartActivity(Main)
End Sub
