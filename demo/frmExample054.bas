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
	Private RealtimeTimer As Timer
	Private RealtimeCounter As Float
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
	TitleLabel.Text = "54. Realtime streaming"
	NoteLabel.Text = "Live dynamic data feed updated at 60ms. Tap chart to pause/resume, long-press to clear."
	'
	BuildChart
End Sub

Sub Activity_Resume
End Sub

Sub Activity_Pause (UserClosed As Boolean)
	If RealtimeTimer.IsInitialized Then
	RealtimeTimer.Enabled = False
	End If
End Sub
'
Private Sub BuildChart
	Chart.BeginUpdate
	Chart.Title = "Realtime streaming"
	Chart.ShowTitle = True
	Chart.ChartType = Chart.CHART_LINE
	Chart.LegendEnabled = Chart.LEGEND_AUTO
	Chart.XTitle = "Samples"
	Chart.YTitle = "Voltage (mV)"
	Chart.Animate = False
	Chart.DrawCirclesEnabled = False
	Chart.LineWidth = 2.5
	Chart.AxisMinimum = 0
	Chart.AxisMaximum = 100
	Chart.DrawGrid = True
	Chart.Title = "Realtime Live Feed"
	Chart.ShowTitle = True
	Chart.Subtitle = "Tap chart to Pause/Resume stream"
	Chart.ShowSubtitle = True
	If Not(RealtimeTimer.IsInitialized) Then
	RealtimeTimer.Initialize("RealtimeTimer", 60)
	End If
	RealtimeCounter = 0
	RealtimeTimer.Enabled = True
'
	Dim DS0 As Int = Chart.AddDataSet("Live Sensor", Colors.RGB(3, 169, 244))
	Chart.EndUpdate
End Sub

Sub RealtimeTimer_Tick
	RealtimeCounter = RealtimeCounter + 1
	Dim Wave As Float = 50 + Sin(RealtimeCounter * 0.12) * 25 + Cos(RealtimeCounter * 0.28) * 10 + (Rnd(-25, 25) / 10)
	Chart.AddRealtimeValue(Wave, 0, 35)
End Sub

Sub Chart_ChartClicked(X As Float, Y As Float)
	If RealtimeTimer.IsInitialized Then
		RealtimeTimer.Enabled = Not(RealtimeTimer.Enabled)
		If RealtimeTimer.Enabled Then
			Chart.Subtitle = "Streaming active (tap to pause)"
		Else
			Chart.Subtitle = "Streaming paused (tap to resume)"
		End If
		Chart.ShowSubtitle = True
	End If
End Sub

Sub Chart_ChartLongClicked(X As Float, Y As Float)
	Chart.ClearValues
	RealtimeCounter = 0
	ToastMessageShow("Chart values cleared!", False)
End Sub

Sub PreviousButton_Click
    StartActivity(frmExample053)
End Sub

Sub NextButton_Click
    StartActivity(frmExample055)
End Sub

Sub BackButton_Click
	' B4A's StartActivity adds FLAG_ACTIVITY_REORDER_TO_FRONT and the main
	' activity is singleTop, so this brings the existing ListView to the
	' front from any page instead of creating a second one.
	StartActivity(Main)
End Sub
