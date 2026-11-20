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
	TitleLabel.Text = "99. Liberty: Deal size"
	NoteLabel.Text = "Liberty bubble chart: oceanic translucent bubbles on mint background."
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
	Chart.Title = "Liberty: Deal size"
	Chart.ShowTitle = True
	Chart.ChartType = Chart.CHART_BUBBLE
	Chart.LegendEnabled = Chart.LEGEND_AUTO
	Chart.XTitle = "Period"
	Chart.YTitle = "Value"
	Chart.ApplyLibertyTheme
	Chart.TitleBold = True
	Chart.TitleSize = 17
	Chart.SubtitleSize = 13
	Chart.BadgeBackgroundColor = 0xFFCCFBF1
	Chart.BadgeTextColor = 0xFF0F766E
	Chart.Title = "Liberty: Deal size"
	Chart.ShowTitle = True
	Chart.Subtitle = "By probability"
	Chart.ShowSubtitle = True
	Chart.AxisMinimum = 0
	Chart.AxisMaximum = 100
	Chart.LabelCount = 5
'
	Dim DS0 As Int = Chart.AddDataSet("Deals", 0)
	Chart.AddDataSetBubble(DS0, 0.2, 50, 9)
	Chart.AddDataSetBubble(DS0, 0.5, 49, 13)
	Chart.AddDataSetBubble(DS0, 0.6, 41, 8)
	Chart.AddDataSetBubble(DS0, 0.6, 37, 37)
	Chart.AddDataSetBubble(DS0, 1.9, 39, 30)
	Chart.AddDataSetBubble(DS0, 2.3, 28, 10)
	Chart.AddDataSetBubble(DS0, 2.3, 18, 35)
	Chart.AddDataSetBubble(DS0, 3.4, 55, 15)
	Chart.AddDataSetBubble(DS0, 4.1, 41, 31)
	Chart.AddDataSetBubble(DS0, 4.1, 30, 15)
	Chart.AddDataSetBubble(DS0, 4.2, 47, 18)
	Chart.AddDataSetBubble(DS0, 4.6, 67, 30)
	Chart.AddDataSetBubble(DS0, 4.7, 37, 26)
	Chart.AddDataSetBubble(DS0, 5.4, 71, 17)
	Chart.AddDataSetBubble(DS0, 5.8, 74, 24)
	Chart.AddDataSetBubble(DS0, 5.9, 69, 28)
	Chart.SetDataSetColors(DS0, Array As Int(0x962A6D82, 0x9676AEAF, 0x9688B4BB, 0x9694D4D4))
	Chart.AddLabels(Array As String("Q1", "Q2", "Q3", "Q4", "Q1", "Q2", "Q3"))
	Chart.EndUpdate
End Sub

Sub PreviousButton_Click
    StartActivity(frmExample098)
End Sub

Sub NextButton_Click
    StartActivity(frmExample100)
End Sub

Sub BackButton_Click
	' B4A's StartActivity adds FLAG_ACTIVITY_REORDER_TO_FRONT and the main
	' activity is singleTop, so this brings the existing ListView to the
	' front from any page instead of creating a second one.
	StartActivity(Main)
End Sub
