# Verified API patterns

These patterns are demonstrated in the repository README and inspected B4A examples. Confirm them against the target installation's XML/API descriptor before using them in a different library version.

## Initialize and add the host view

```basic
Sub Globals
    Private Chart As SithasoMPACharts
End Sub

Sub Activity_Create(FirstTime As Boolean)
    Chart.Initialize("Chart")
    Activity.AddView(Chart, 0, 0, 100%x, 300dip)
End Sub
```

## Method versus property syntax

The v10.19 XML declares `DisableScroll` and `EnableScroll` as parameterless methods returning `void`, not Boolean properties. Invoke them without assignment:

```basic
Chart.DisableScroll
Chart.EnableScroll
```

Do not write `Chart.DisableScroll = True`. The XML element determines B4A syntax: `<property>` is assigned/read as a property, while `<method>` is called as a method.

## DataSet lifecycle

```basic
Chart.BeginUpdate
Chart.ChartType = Chart.CHART_LINE
Dim DS As Int = Chart.AddDataSet("Visitors", 0)
Chart.AddLabels(Array As String("Jan", "Feb", "Mar"))
Chart.AddValues(DS, Array As Double(12, 19, 15))
Chart.EndUpdate
```

A second argument of `0` is used in examples to select the next palette color. A color value can be passed to explicitly select a dataset color.

## Stacked series

Example 016 demonstrates:
```basic
Chart.ChartType = Chart.CHART_COLUMN
Chart.Stacked = True
Chart.StackLabels = Array("Product", "Services")
Dim DS As Int = Chart.AddDataSet("North", 0)
Chart.AddDataSetStack(DS, Array As Double(10, 6))
Chart.AddDataSetStack(DS, Array As Double(12, 8))
Chart.AddDataSetStack(DS, Array As Double(14, 7))
Chart.AddDataSetStack(DS, Array As Double(16, 10))
Chart.AddLabels(Array As String("Q1", "Q2", "Q3", "Q4"))
```

## Combo layers

Example 011:
```basic
Chart.ChartType = Chart.CHART_COMBO
Dim Bars As Int = Chart.AddBarDataSet("Revenue", 0)
Chart.AddValues(Bars, Array As Double(12, 18, 14, 25, 29))
Dim Trend As Int = Chart.AddLineDataSet("Trend", 0)
Chart.AddValues(Trend, Array As Double(10, 13, 17, 19, 24))
Chart.AddLabels(Array As String("Jan", "Feb", "Mar", "Apr", "May"))
```

Example 124 adds `AddScatterDataSet` and sets `DrawOrder = "BAR,SCATTER,LINE"`. Inspect it before extending the layer mix.

## Specialized entries

- Scatter: `AddDataSetEntry(dataset, x, y)` — example 023.
- Bubble: `AddDataSetBubble(dataset, x, y, size)` — example 008.
- Candlestick: `AddDataSetCandle(dataset, high, low, open, close)` — example 010. Preserve this exact argument order.
- Realtime: example 054 uses `AddRealtimeValue(value, datasetIndex, maxVisible)`.
- Dual Y-axis: example 037 enables `ShowRightAxis = True` and assigns a dataset with `SetDataSetAxis(DS1, "right")`.

## Signed values and point colours

Example 038 retains positive and negative values and applies an array of colours with `SetDataSetColors`. Do not remove the sign from values to make a chart render.

## README SetData alternative

The repository README also demonstrates `SetData(labels, seriesList)` with a list of maps containing `name` and `data`. Prefer the DataSet approach when adapting the numbered gallery modules; use `SetData` only after verifying its signature in the installed API descriptor.

## Event callbacks

Inspected examples expose:
```basic
Sub Chart_ChartClicked(X As Float, Y As Float)
End Sub

Sub Chart_ChartLongClicked(X As Float, Y As Float)
End Sub
```

Do not assume the entire underlying MPAndroidChart event surface is exposed unchanged by the B4A wrapper.

## Clear data or reset chart configuration

The supplied `SithasoMPACharts.xml` for v10.19 confirms these parameterless methods and their distinct semantics:

| Method | Exact documented effect | Use it when |
|---|---|---|
| `ClearValues` | Clears all values from chart datasets in-place, resetting it for new real-time data. | You want to retain the current chart/dataset configuration and start feeding new values. |
| `ClearData` | Removes all labels and series, leaving the chart empty. | You want to remove the data structure but are not asking to restore every visual/behavioral setting. |
| `ResetProperties` | Resets all visual and behavioral properties to their defaults (as defined in designer properties), and clears custom limit lines and data. | You are reusing the chart and want a broad configuration reset before setting it up again. |
| `ResetToDefaults` | Alias for `ResetProperties`. | Use as an alternative name for the same reset operation. |

`ResetProperties` has no parameters and returns `void` in the supplied v10.19 XML. The XML does not say that it recreates the permanent host view; do not describe it as a view recreation. The class-level documentation instead describes one permanent host view whose inner chart changes.

Example for reconfiguring the existing chart instance:

```basic
Chart.ResetProperties
Chart.BeginUpdate
Chart.ChartType = Chart.CHART_RADIAL
' Set chart properties and add datasets / labels / values.
Chart.EndUpdate
```

The smoke-test harness calls `ResetProperties` before each test's `BeginUpdate`. For real-time data replacement while retaining the current configuration, use `ClearValues` instead. For removing all labels and series without the broader reset, use `ClearData`.

The supplied XML is the authoritative API evidence for this v10.19 installation. Check the target installation's own XML/version before assuming the same methods or semantics exist in another release.
