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

	TitleLabel.Text = "Challenge 2.1: Anatomy Labeler"
	NoteLabel.Text = "Chapter 2 Challenge 1: Title, Subtitle, BadgeText, XTitle, YTitle, Legend, and DrawValues enabled."

	BuildChart
End Sub

Sub Activity_Resume
End Sub

Sub Activity_Pause (UserClosed As Boolean)
End Sub

Private Sub BuildChart
	Chart.BeginUpdate
	Chart.ChartType = Chart.CHART_LINE
	Chart.ShowTitle = True
	Chart.Title = "TITLE ROW → Title"
	Chart.ShowSubtitle = True
	Chart.Subtitle = "TITLE ROW → Subtitle"
	Chart.BadgeText = "BADGE"
	Chart.BadgeBackgroundColor = Colors.RGB(194, 65, 12)
	Chart.BadgeTextColor = Colors.White

	Chart.XTitle = "X AXIS TITLE"
	Chart.YTitle = "Y AXIS TITLE"
	Chart.YTitlePosition = Chart.YTITLE_LEFT

	Chart.LegendEnabled = Chart.LEGEND_SHOW
	Chart.LegendPosition = Chart.LEGEND_BOTTOM
	Chart.LegendDrawInside = False

	Chart.DrawValues = True
	Chart.ValueFontSize = 10

	Dim DS0 As Int = Chart.AddDataSet("Revenue", 0)
	Dim DS1 As Int = Chart.AddDataSet("Expenses", 0)
	Chart.AddLabels(Array As String("Jan", "Feb", "Mar", "Apr", "May", "Jun"))
	Chart.AddValues(DS0, Array As Double(12, 19, 15, 28, 24, 35))
	Chart.AddValues(DS1, Array As Double(8, 14, 12, 20, 18, 25))
	Chart.EndUpdate
End Sub

Sub PreviousButton_Click
	StartActivity(frmChallenge03)
End Sub

Sub NextButton_Click
	StartActivity(frmChallenge05)
End Sub

Sub BackButton_Click
	StartActivity(Main)
End Sub
