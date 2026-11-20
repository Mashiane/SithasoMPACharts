# SithasoMPACharts Deployment Distribution

This folder contains the deployment artifacts for **SithasoMPACharts v10.19** (backed by MPAndroidChart 4.0.1):

- [`library/`](./library/) — B4A wrapper library (`SithasoMPACharts.jar`, `SithasoMPACharts.xml`), required `#AdditionalJar` dependencies (`mpChartLib.jar`, `kotlin-stdlib-2.0.21.jar`), and [`PROGUARD.txt`](./library/PROGUARD.txt) keep rules
- [`demo/`](./demo/) — Complete runnable B4A demo project source (`SithasoMPAChartsDemo.b4a`, 127 example modules `frmExample001`–`frmExample127`, `Files/`, and project-local `Libraries/`)
- [`SithasoMPAChartsDemo.apk`](./SithasoMPAChartsDemo.apk) — Standalone release APK showcasing **127 interactive examples**
- [`book/`](./book/) — Complete developer guide (`HTML`, `EPUB`, `DOCX`, `PDF`) using the DataSet API with 127 live emulator screenshots

---

## Library Integration for B4A Developers

1. Copy all `.jar` and `.xml` files from [`dist/library/`](./library/) (`SithasoMPACharts.jar`, `SithasoMPACharts.xml`, `mpChartLib.jar`, `kotlin-stdlib-2.0.21.jar`) into your B4A Additional Libraries folder (e.g. `C:\b4a\libraries`).
2. In the B4A IDE, refresh the **Libraries Manager** tab and check **SithasoMPACharts**.
3. Add the required `#AdditionalJar` project attributes to your app's `Main` module:

```basic
#Region Project Attributes
    #AdditionalJar: mpChartLib
    #AdditionalJar: kotlin-stdlib-2.0.21
#End Region
```

4. For minified release builds (R8/ProGuard), add the rules in [`dist/library/PROGUARD.txt`](./library/PROGUARD.txt) to your project's `proguard-user.conf`.
5. Add the view in the Visual Designer or create it via code:

```basic
Sub Globals
    Private Chart As SithasoMPACharts
End Sub

Sub Activity_Create(FirstTime As Boolean)
    Chart.Initialize("Chart")
    Activity.AddView(Chart, 0, 0, 100%x, 300dip)

    Chart.BeginUpdate
    Chart.ChartType = Chart.CHART_LINE
    Chart.Title = "Monthly Visitors"
    Chart.ShowTitle = True
    Chart.LineMode = Chart.MODE_CUBIC_BEZIER

    Dim S As List
    S.Initialize
    S.Add(CreateMap("name": "Visitors", "data": Array(12, 19, 15, 28, 24, 35)))

    Chart.SetData(Array("Jan", "Feb", "Mar", "Apr", "May", "Jun"), S)
    Chart.EndUpdate
End Sub
```

---

## Demo APK Details

| Property | Value |
| :--- | :--- |
| **Filename** | [`SithasoMPAChartsDemo.apk`](./SithasoMPAChartsDemo.apk) |
| **Package Name** | `com.sithaso.mpacharts` |
| **Application Label** | `SithasoMPACharts Demo` |
| **Library Version** | `10.19` |
| **App Version Name** | `2.0` (`VersionCode: 1`) |
| **Build Type** | Release (Obfuscated, debug-key signed) |
| **File Size** | 1,340,602 bytes (1.28 MB) |
| **Minimum Android** | Android 6.0 Marshmallow (API 23) |
| **Target Android** | Android 15 (API 35) |
| **SHA-256 Checksum** | `53F87D29CDC51BCA6DE38101887E00DCC00B54527ED5F23C656646B88DED1693` |

---

## Demo Installation

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

The demo application opens to a list of 127 interactive examples (`frmExample001`–`frmExample127`) covering:

- **Core Chart Types:** Line, Area, Column, Horizontal Bar, Pie, Donut, Half Donut Gauge, Nightingale Rose, Polar Area, Scatter, Bubble, Radar, Candlestick, Combo, and Concentric Radial Gauges/Progress Rings.
- **Multi-Series & Grouping:** Grouped columns, stacked columns & bars, pill-shaped bars, dual Y-axes, and multi-layer combo charts.
- **Axes, Grid & Formatting:** Dashed grid lines, axis granularity, `IgnoreZero` filtering, limit lines, rotated labels, currency/unit prefixes & suffixes, thousand separators, and stepped lines.
- **Interactive Themes & Palettes:** Default, Nightfall, Nightfall Dark, Cyberpunk, Material, Pastel, and Liberty.
- **Interactions & Animation:** Eased entrance animations (including Bounce), realtime streaming, programmatic highlighting, pill markers, and slice leader lines.
