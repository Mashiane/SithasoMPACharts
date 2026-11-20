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
	TitleLabel.Text = "78. Material: ACME Corp"
	NoteLabel.Text = "Material candlestick chart: Material Green (up) and Material Red (down) filled bodies."
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
	Chart.Title = "Material: ACME Corp"
	Chart.ShowTitle = True
	Chart.ChartType = Chart.CHART_CANDLE
	Chart.LegendEnabled = Chart.LEGEND_AUTO
	Chart.XTitle = "Period"
	Chart.YTitle = "Value"
	Chart.ApplyMaterialTheme
	Chart.TitleBold = True
	Chart.TitleSize = 17
	Chart.SubtitleSize = 13
	Chart.BadgeBackgroundColor = 0xFFE8F5E9
	Chart.BadgeTextColor = 0xFF2E7D32
	Chart.Title = "Material: ACME Corp"
	Chart.ShowTitle = True
	Chart.Subtitle = "5 min candles"
	Chart.ShowSubtitle = True
	Chart.BadgeText = "+2.1%"
	Chart.CandleIncreasingColor = 0xFF2ECC71
	Chart.CandleDecreasingColor = 0xFFE74C3C
	Chart.CandleIncreasingFill = True
	Chart.CandleShadowWidth = 1.5
	Chart.CandleBarSpace = 0.25
	Chart.AxisMinimum = 80
	Chart.AxisMaximum = 160
	Chart.LabelCount = 5
'
	Dim DS0 As Int = Chart.AddDataSet("ACME", 0)
	Chart.AddDataSetCandle(DS0, 129, 114, 118, 127)
	Chart.AddDataSetCandle(DS0, 138, 126, 127, 133)
	Chart.AddDataSetCandle(DS0, 135, 123, 133, 126)
	Chart.AddDataSetCandle(DS0, 127, 119, 126, 123)
	Chart.AddDataSetCandle(DS0, 131, 121, 123, 127)
	Chart.AddDataSetCandle(DS0, 132, 126, 127, 127)
	Chart.AddDataSetCandle(DS0, 139, 126, 127, 136)
	Chart.AddDataSetCandle(DS0, 137, 128, 136, 133)
	Chart.AddDataSetCandle(DS0, 146, 131, 133, 142)
	Chart.AddDataSetCandle(DS0, 150, 137, 142, 149)
	Chart.AddDataSetCandle(DS0, 150, 142, 149, 144)
	Chart.AddDataSetCandle(DS0, 149, 141, 144, 148)
	Chart.AddDataSetCandle(DS0, 150, 147, 148, 148)
	Chart.AddDataSetCandle(DS0, 150, 143, 148, 148)
	Chart.AddDataSetCandle(DS0, 151, 141, 148, 145)
	Chart.AddDataSetCandle(DS0, 146, 137, 145, 138)
	Chart.AddDataSetCandle(DS0, 143, 130, 138, 134)
	Chart.AddDataSetCandle(DS0, 138, 131, 134, 133)
	Chart.AddDataSetCandle(DS0, 135, 123, 133, 127)
	Chart.AddDataSetCandle(DS0, 137, 122, 127, 134)
	Chart.AddLabels(Array As String("Mon", "", "Tue", "", "Wed", "", "Thu", "", "Fri", "", "Mon", "", "Tue", "", "Wed", "", "Thu", "", "Fri", ""))
	Chart.EndUpdate
End Sub

Sub PreviousButton_Click
    StartActivity(frmExample077)
End Sub

Sub NextButton_Click
    StartActivity(frmExample079)
End Sub

Sub BackButton_Click
	' B4A's StartActivity adds FLAG_ACTIVITY_REORDER_TO_FRONT and the main
	' activity is singleTop, so this brings the existing ListView to the
	' front from any page instead of creating a second one.
	StartActivity(Main)
End Sub
