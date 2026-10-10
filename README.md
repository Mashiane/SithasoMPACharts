# SithasoMPACharts Demo Release

This folder contains the official standalone release APK of the **SithasoMPACharts Demo** application for Android.

The demo showcases **98 interactive examples** covering every chart type, design theme, layout, and configuration feature available in the **SithasoMPACharts** native B4A library.

---

## Download & Package Details

| Property | Value |
| :--- | :--- |
| **Filename** | [`SithasoMPAChartsDemo.apk`](./SithasoMPAChartsDemo.apk) |
| **Package Name** | `com.sithaso.mpacharts` |
| **Application Label** | `SithasoMPACharts Demo` |
| **Version Name** | `2.0` |
| **Version Code** | `1` |
| **Build Type** | Release (Obfuscated) |
| **File Size** | 1,008,764 bytes (985 KB) |
| **Minimum Android** | Android 6.0 Marshmallow (API 23) |
| **Target Android** | Android 15 (API 35) |
| **SHA-256 Checksum** | `9EF0C8E0314153D2574F1261C4223A8DE88AD55F3C53D902D04FECC0CA920207` |

---

## Installation

### Option 1: Install via ADB (Computer)
Connect your Android device with USB debugging enabled, then run:

```bash
adb install -r SithasoMPAChartsDemo.apk
```

To launch immediately:
```bash
adb shell am start -n com.sithaso.mpacharts/.main
```

### Option 2: Direct Install on Android Device
1. Download `SithasoMPAChartsDemo.apk` directly to your phone or tablet.
2. Open the downloaded file from your file manager or browser downloads.
3. If prompted, allow your browser or file manager to **Install unknown apps**.
4. Tap **Install** and then **Open**.

---

## What's in the Demo Gallery (98 Live Examples)

The demo application contains a browsable gallery of 98 interactive examples divided into categories:

### 1. Core Chart Types
- **Line Chart**: Smooth cubic bezier curves, customizable stroke widths, point circles, and data values.
- **Area Chart**: Smooth lines with soft vertical gradients and translucent fill alpha.
- **Column Chart**: Vertical bars with corner radius rounding, bar gradient fills, and shadow effects.
- **Horizontal Bar Chart**: Left-to-right bars with inverted category and value axes.
- **Pie & Donut Chart**: Pie slices with entry labels, donut center text with two-tone typography, and slice spacing.
- **Scatter Chart**: Multi-series coordinate plotting with customizable shapes (Circle, Triangle, Square, Cross, Chevron).
- **Bubble Chart**: 3-variable plotting $(x, y, \text{size})$ with auto-normalized bubble diameters.
- **Radar Chart**: Multi-axis spider/web comparison plots with polygon filling.
- **Candlestick Chart**: Financial trading charts with configurable bullish/bearish candle colors and wick widths.
- **Combo Chart**: Combined line and column data sets rendered on shared or dual independent axes.

### 2. Multi-Series & Grouping
- **Multi-Series Lines**: Multiple comparative lines on a single plot with automatic or custom palettes.
- **Grouped Columns**: Side-by-side category bars with configurable group spacing and bar width.
- **Stacked Columns & Bars**: Multi-value segment bars with section corner rounding and segment labels.
- **Dual Y-Axes**: Left and Right independent value scales (e.g. Temperature on Left, Pressure on Right).

### 3. Axis, Grid & Formatting Controls
- **Dashed Grid Lines**: Native dashed Cartesian and HorizontalBar grid lines (`DrawDashedGrid`, `GridDashLength`, `GridDashSpace`).
- **Axis Granularity**: Precise minimum step intervals on numerical axes (`AxisGranularity`).
- **Zero Filtering (`IgnoreZero`)**: Automatic omission of zero values while preserving category positions.
- **Limit Lines**: Threshold indicators with custom colors, line widths, and dashed styles.
- **Rotated Labels**: Angled or vertical X-axis labels (e.g. -90° rotation) to eliminate overlap on high-density categories.
- **Prefixes & Suffixes**: Currency formatting (`$`), percentage signs (`%`), unit tags (`k`, `M`), and thousand separators.
- **Stepped Lines**: Staircase transition plots for benchmark rates and discrete intervals.

### 4. Interactive Themes & Palettes
- **Nightfall** (Modern Teal / Cyan palette on clean background)
- **Nightfall Dark** (Sleek dark mode theme)
- **Cyberpunk** (High-contrast neon cyan, magenta, and electric yellow)
- **Material Design** (Google Material vibrant palette)
- **Pastel** (Harmonious muted tones for reports)
- **Liberty** (Professional enterprise palette)

---

## In-App Controls

- **Examples**: Tapping the top-left button opens the quick-jump list of all 98 examples.
- **< Prev / Next >**: Sequentially step forward or backward through the gallery.
- **Download**: Exports and saves the current live chart view as a PNG image directly to your device storage.
- **Gestures**: Pinch-to-zoom, pan/drag, double-tap to zoom, and single-tap to inspect highlight values.

---

## Library Integration for B4A Developers

To use the library in your own B4A project:

1. Copy [`SithasoMPACharts.jar`](../library/SithasoMPACharts.jar) and [`SithasoMPACharts.xml`](../library/SithasoMPACharts.xml) into your B4A Additional Libraries folder.
2. In the B4A IDE, check **SithasoMPACharts** in the **Libraries Manager** tab.
3. Add the view in the Visual Designer or create it via code:

```basic
Sub Globals
    Private Chart As SithasoMPACharts
End Sub

Sub Activity_Create(FirstTime As Boolean)
    Activity.LoadLayout("Layout1")

    Chart.ChartType = Chart.CHART_LINE
    Chart.Title = "Monthly Visitors"
    Chart.ShowTitle = True
    Chart.LineMode = Chart.MODE_CUBIC_BEZIER

    Dim S As List
    S.Initialize
    S.Add(CreateMap("name": "Visitors", "data": Array(12, 19, 15, 28, 24, 35)))

    Chart.SetData(Array("Jan", "Feb", "Mar", "Apr", "May", "Jun"), S)
End Sub
```
