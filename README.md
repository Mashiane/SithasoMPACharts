# SithasoMPACharts Demo Release

This folder contains the official standalone release APK of the **SithasoMPACharts Demo** application for Android.

The demo showcases **127 interactive examples** covering every chart type, design theme, layout, and configuration feature available in the **SithasoMPACharts** native B4A library.

---

## Download & Package Details

| Property | Value |
| :--- | :--- |
| **Filename** | [`SithasoMPAChartsDemo.apk`](./SithasoMPAChartsDemo.apk) |
| **Package Name** | `com.sithaso.mpacharts` |
| **Application Label** | `SithasoMPACharts Demo` |
| **Version Name** | `2.0` |
| **Version Code** | `1` |
| **Build Type** | Release (Obfuscated via R8/ProGuard) |
| **File Size** | 1,066,170 bytes (1,041 KB) |
| **Minimum Android** | Android 6.0 Marshmallow (API 23) |
| **Target Android** | Android 15 (API 35) |
| **SHA-256 Checksum** | `B58309DF63FF52ECC059128DE934D01E61DBC350030978B034685DEE3BAB2974` |

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

## What's in the Demo Gallery (127 Live Examples)

The demo application contains a browsable gallery of 127 interactive examples divided into categories:

### 1. Core Chart Types (11)
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
- **Polar Area / Nightingale Rose**: Radial area charts with angle-based value encoding.

### 2. Multi-Series & Grouping (9)
- **Grouped Columns**: Side-by-side category bars with configurable group spacing and bar width.
- **Stacked Columns & Bars**: Multi-value segment bars with section corner rounding and segment labels.
- **Dual Y-Axes**: Left and Right independent value scales (e.g. Temperature on Left, Pressure on Right).
- **Pill-Shaped Stacked/Grouped Bars**: Capsule-style bars with `PillShape` property.
- **Multiple Series**: Multiple comparative lines/areas on a single plot with automatic or custom palettes.
- **Value Alignment**: Control over in-bar and point label positioning.
- **Scatter Coordinates**: Multi-series coordinate plotting with explicit X/Y pairs.
- **Series Colors**: Custom palette assignment per dataset.
- **Empty State**: Graceful handling of zero-data scenarios.

### 3. Axis, Grid & Formatting Controls (10)
- **Dashed Grid Lines**: Native dashed Cartesian and HorizontalBar grid lines (`DrawDashedGrid`, `GridDashLength`, `GridDashSpace`).
- **Axis Granularity**: Precise minimum step intervals on numerical axes (`AxisGranularity`).
- **Zero Filtering (`IgnoreZero`)**: Automatic omission of zero values while preserving category positions.
- **Limit Lines**: Threshold indicators with custom colors, line widths, and dashed styles.
- **Rotated Labels**: Angled or vertical X-axis labels (e.g. -90° rotation) to eliminate overlap on high-density categories.
- **Prefixes & Suffixes**: Currency formatting (`$`), percentage signs (`%`), unit tags (`k`, `M`), and thousand separators.
- **Stepped Lines**: Staircase transition plots for benchmark rates and discrete intervals.
- **Axis Limits & Auto-Scaling**: Manual or automatic min/max with `AxisMinimum` / `AxisMaximum`.
- **Straight Lines**: Linear interpolation mode for sharp transitions.
- **No Grid / Pan-Zoom Off**: Clean presentation modes with interaction disabled.

### 4. Data Labels & Values (4)
- **Data Values**: Numeric labels on every data point.
- **Currency Prefix**: Automatic `$` / currency symbol formatting.
- **Percent Donut**: Pie/donut slices rendered as percentages of total.
- **Slice Leaders**: Leader lines for outside slice labels on pie/donut charts.

### 5. Animation & Interactivity (6)
- **Animate X and Y**: Simultaneous dual-axis entrance animation.
- **Animate XY Columns**: Column-specific entrance animation.
- **Realtime Streaming**: `AddRealtimeEntry` / `AddRealtimeValue` for live data feeds.
- **Easing Bounce**: 28 easing functions (Bounce, Elastic, Back, Expo, etc.).
- **High Density Line**: Optimized rendering for large datasets.
- **24-Hour Timeline**: Time-axis formatting for hourly data.

### 6. Visual Styling (10)
- **Title and Subtitle**: Header text with alignment, color, size, and weight controls.
- **Rotated Labels**: Angled axis labels for dense categories.
- **Scatter Shapes**: Circle, Triangle, Square, Cross, X, Chevron point shapes.
- **Sine Wave Bars**: Curved bar styling for oscillating data.
- **Positive/Negative Column**: Automatic color split for positive vs negative values.
- **Negative Horizontal Bar**: Inverted horizontal bars for negative datasets.
- **Bar Borders**: Per-bar stroke outlines with custom width/color.
- **Bar Corner Styles**: Round all corners or tip-only (`BarCornerStyle`).
- **Custom Palette**: User-defined color lists cycled across series.
- **Legend Customization**: Position (top/bottom/left/right), form (circle/square/line), orientation, draw-inside mode, and visibility (auto/show/hide).

### 7. Themes & Palettes (6 Built-in Themes × 7 Variants = 42)
Each theme provides 7 contextual examples (Revenue, Orders, Budget, Sessions, Spend, ACME Corp, Team Profile/Growth/Deal Size):

- **Nightfall** (Modern Teal / Cyan palette on clean background)
- **Nightfall Dark** (Sleek dark mode theme)
- **Cyberpunk** (High-contrast neon cyan, magenta, and electric yellow)
- **Material Design** (Google Material vibrant palette)
- **Pastel** (Harmonious muted tones for reports)
- **Liberty** (Professional enterprise palette)

### 8. Radial / Gauge Charts (11)
- **Radial Single**: Single progress ring.
- **Radial Center Image**: Ring with centered bitmap/image.
- **Radial Bar Labels**: Name + value stacked at ring start (Apex barLabels style).
- **Radial Gauge Label**: Gauge with labeled tick marks.
- **Radial Single Dashed**: Dashed segment ring.
- **Radial Dashed Gauge**: Dashed gauge with tick marks.
- **Radial**: Standard multi-ring gauge.
- **Radial Semi**: Half-circle (180°) gauge.
- **Radial Dashed**: Multi-ring dashed gauge.
- **Radial Gradient**: Rings with sweep gradient (color → lighter tint).
- **Radial Gauge**: Full gauge with min/max/value labels.

### 9. Advanced & Composite (14)
- **Multi-line Straight**: Multiple lines with linear interpolation.
- **Multi-series Area**: Stacked/overlaid area charts.
- **Multi-series Gradient**: Gradient fills per dataset.
- **Slice Leaders**: Outside labels with leader lines on pie/donut.
- **Bar Borders**: Outlined bars/columns with custom width/color.
- **Combo Layers**: Line + column + scatter on shared axes.
- **Axis Chrome**: Full axis styling (lines, labels, titles, zero line).
- **Candle Style**: Bullish/bearish colors, wick width, body fill.
- **Radar Web**: Spider web polygon with configurable rings/axes.
- **High Density Line**: Optimized rendering for large datasets.
- **24-Hour Timeline**: Time-axis formatting for hourly data.
- **Realtime Streaming**: `AddRealtimeEntry` / `AddRealtimeValue` for live feeds.
- **Easing Bounce**: 28 easing functions (Bounce, Elastic, Back, Expo, etc.).
- **Empty State**: Graceful handling of zero-data scenarios.

---

## In-App Controls

- **Examples**: Tapping the top-left button opens the quick-jump list of all 127 examples.
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

---

## Recent Updates (October 2026)

### Code Quality Improvements
- **Fixed 91 duplicate/misplaced Javadoc comments** in `SithasoMPACharts.java`
- Removed getter Javadoc accidentally pasted inside setter method bodies
- Eliminated triplicated comments in the internal `Spec` class
- Cleaned up mismatched parameter documentation in property setters/getters
- Library now compiles with **zero javac warnings** (`-Werror` clean)

### Build & Verification
- Library JAR rebuilt and verified against B4A 14 / Java 17 / Android 35 SDK
- Demo APK built with **R8 obfuscation** enabled (release build)
- **127 examples** tested on emulator (API 35) — zero crashes, zero exceptions in logcat
- Screenshots captured for 66 examples during automated sweep

---

## License & Support

**SithasoMPACharts is donationware.** The library is **NOT free to use**. You may use it for **commercial and personal purposes only after donating**.

To obtain a license, send a donation (certificate of appreciation) via:

**[https://paypal.me/anelembanga](https://paypal.me/anelembanga)**

Upon donation, you receive permission to use the library in both commercial and personal projects. This demo APK is provided for evaluation and demonstration purposes only. Contact the author for commercial licensing inquiries or volume discounts.

---

## Author

**Sithaso** — B4A native chart library developer  
Built on [MPAndroidChart](https://github.com/PhilJay/MPAndroidChart) by Philipp Jahoda.