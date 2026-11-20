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
	TitleLabel.Text = "77. Material: Spend"
	NoteLabel.Text = "Material stacked bar chart: green, blue, yellow stacked bars with corner radius 6."
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
	Chart.Title = "Material: Spend"
	Chart.ShowTitle = True
	Chart.ChartType = Chart.CHART_COLUMN
	Chart.LegendEnabled = Chart.LEGEND_AUTO
	Chart.XTitle = "Period"
	Chart.YTitle = "Value"
	Chart.ApplyMaterialTheme
	Chart.TitleBold = True
	Chart.TitleSize = 17
	Chart.SubtitleSize = 13
	Chart.BadgeBackgroundColor = 0xFFE8F5E9
	Chart.BadgeTextColor = 0xFF2E7D32
	Chart.Title = "Material: Spend"
	Chart.ShowTitle = True
	Chart.Subtitle = "Stacked, in k€"
	Chart.ShowSubtitle = True
	Chart.Stacked = True
	Chart.StackLabels = Array("Tech", "Marketing", "Operations")
	Chart.LegendEnabled = Chart.LEGEND_SHOW
	Chart.LegendPosition = Chart.LEGEND_TOP
	Chart.BarWidth = 0.55
	Chart.PillShape = True
	Chart.StackGap = 3
	Chart.AxisMinimum = 0
	Chart.AxisMaximum = 100
	Chart.LabelCount = 5
	Chart.DrawValues = True
	Chart.DrawWholeStack = True
	Chart.DrawValueAboveBar = False
	Chart.ValueFontSize = 9
	Chart.ValueTextColor = Colors.White
	Chart.ValueAngle = -45
'
	Dim DS0 As Int = Chart.AddDataSet("Spend", 0xFF2ECC71)
	Chart.AddDataSetStack(DS0, Array As Double(30, 20, 12))
	Chart.AddDataSetStack(DS0, Array As Double(42, 18, 16))
	Chart.AddDataSetStack(DS0, Array As Double(36, 26, 10))
	Chart.AddDataSetStack(DS0, Array As Double(50, 22, 20))
	Chart.AddDataSetStack(DS0, Array As Double(44, 30, 14))
	Chart.AddDataSetStack(DS0, Array As Double(58, 24, 18))
	Chart.AddDataSetStack(DS0, Array As Double(40, 20, 22))
	Chart.AddDataSetStack(DS0, Array As Double(52, 28, 16))
	Chart.SetDataSetColors(DS0, Array As Int(0xFF2ECC71, 0xFF3498DB, 0xFFF1C40F, 0xFFE74C3C, 0xFF9B59B6))
	Chart.AddLabels(Array As String("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug"))
	Chart.EndUpdate
End Sub

Sub PreviousButton_Click
    StartActivity(frmExample076)
End Sub

Sub NextButton_Click
    StartActivity(frmExample078)
End Sub

Sub BackButton_Click
	' B4A's StartActivity adds FLAG_ACTIVITY_REORDER_TO_FRONT and the main
	' activity is singleTop, so this brings the existing ListView to the
	' front from any page instead of creating a second one.
	StartActivity(Main)
End Sub
