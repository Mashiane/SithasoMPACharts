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
	Private SliceTimer As Timer
	Private SliceTick As Int
	Private SliceDS As Int
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
	TitleLabel.Text = "122. Slice leaders"
	NoteLabel.Text = "Values sit at each slice center while entry names ride outside on leader lines: X outside plus Y inside, engine polyline demo style. Wide offsets shrink the pie so labels fit. Values refresh every 5s to show the auto placement live."
	'
	BuildChart
End Sub

Sub Activity_Resume
End Sub

Sub Activity_Pause (UserClosed As Boolean)
	If SliceTimer.IsInitialized Then
	SliceTimer.Enabled = False
	End If
End Sub
'
Private Sub BuildChart
	Chart.BeginUpdate
	Chart.Title = "Slice leaders"
	Chart.ShowTitle = True
	Chart.ChartType = Chart.CHART_PIE
	Chart.LegendEnabled = Chart.LEGEND_AUTO
	Chart.DrawEntryLabels = True
	Chart.EntryLabelColor = Colors.RGB(51, 65, 85)
	Chart.XValuePosition = Chart.VALUE_POS_OUTSIDE
	Chart.YValuePosition = Chart.VALUE_POS_INSIDE
	Chart.ValueLineColor = Colors.RGB(100, 116, 139)
	Chart.ValueLineWidth = 1
	Chart.ValueLinePart1Length = 0.2
	Chart.ValueLinePart2Length = 0.4
	Chart.DrawValues = True
	Chart.ValueFontSize = 11
	Chart.SetExtraOffsets(32, 8, 32, 8)
	If Not(SliceTimer.IsInitialized) Then
	SliceTimer.Initialize("SliceTimer", 5000)
	End If
	SliceTick = 0
	SliceTimer.Enabled = True
'
	SliceDS = Chart.AddDataSet("Share", 0)
	Chart.AddValues(SliceDS, Array As Double(52, 24, 14, 10))
	Chart.AddLabels(Array As String("Chrome", "Safari", "Firefox", "Other"))
	Chart.EndUpdate
End Sub

Sub SliceTimer_Tick
	SliceTick = SliceTick + 1
	Dim A As Int, B As Int, C As Int, D As Int
	If SliceTick Mod 3 = 0 Then
		A = Rnd(40, 65) : B = Rnd(15, 30) : C = Rnd(4, 9) : D = Rnd(4, 9)
	Else
		A = Rnd(15, 55) : B = Rnd(8, 30) : C = Rnd(5, 22) : D = Rnd(5, 18)
	End If
	Chart.ClearValues
	Chart.AddValues(SliceDS, Array As Double(A, B, C, D))
End Sub

Sub PreviousButton_Click
    StartActivity(frmExample121)
End Sub

Sub NextButton_Click
    StartActivity(frmExample123)
End Sub

Sub BackButton_Click
	' B4A's StartActivity adds FLAG_ACTIVITY_REORDER_TO_FRONT and the main
	' activity is singleTop, so this brings the existing ListView to the
	' front from any page instead of creating a second one.
	StartActivity(Main)
End Sub
