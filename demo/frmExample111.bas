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
	TitleLabel.Text = "111. Radial bar labels"
	NoteLabel.Text = "270 degree dial with name and value stacked at top-left via RingEndLabels. ValueFontSize = 16 matches the Apex barLabels fontSize; ValueAlign anchors the block; ValueTextColor overrides the series colors."
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
	Chart.Title = "Radial bar labels"
	Chart.ShowTitle = True
	Chart.ChartType = Chart.CHART_RADIAL
	Chart.LegendEnabled = Chart.LEGEND_AUTO
	Chart.XTitle = "Period"
	Chart.YTitle = "Value"
	Chart.MaxAngle = 270
	Chart.RadialDashed = True
	Chart.RotationAngle = 0
	Chart.RingLineCap = Chart.RING_CAP_BUTT
	Chart.RingEndLabels = True
	Chart.ValueFontSize = 16
	Chart.ValueAlign = Chart.VALUE_ALIGN_RIGHT
	Chart.CenterText = ""
	Chart.CenterSubtext = ""
	Chart.LegendEnabled = Chart.LEGEND_SHOW
	Chart.LegendPosition = Chart.LEGEND_BOTTOM
'
	Dim DS0 As Int = Chart.AddDataSet("Email", 0xFF1AB7EA)
	Chart.AddValues(DS0, Array As Double(76))
	Dim DS1 As Int = Chart.AddDataSet("Push", 0xFF0084FF)
	Chart.AddValues(DS1, Array As Double(67))
	Dim DS2 As Int = Chart.AddDataSet("In-App", 0xFF39539E)
	Chart.AddValues(DS2, Array As Double(61))
	Dim DS3 As Int = Chart.AddDataSet("SMS", 0xFF0077B5)
	Chart.AddValues(DS3, Array As Double(90))
	Chart.AddLabels(Array As String("Email", "Push", "In-App", "SMS"))
	Chart.EndUpdate
End Sub

Sub PreviousButton_Click
    StartActivity(frmExample110)
End Sub

Sub NextButton_Click
    StartActivity(frmExample112)
End Sub

Sub BackButton_Click
	' B4A's StartActivity adds FLAG_ACTIVITY_REORDER_TO_FRONT and the main
	' activity is singleTop, so this brings the existing ListView to the
	' front from any page instead of creating a second one.
	StartActivity(Main)
End Sub
