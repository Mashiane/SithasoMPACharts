# SithasoMPACharts B4A smoke-test project

A focused B4A project for manually exercising representative wrapper APIs used by the coding-agent skill. Each in-place test calls `ResetProperties` before configuring the next chart so the harness exercises the library's documented full chart-view reset rather than only clearing data.

## Included cases

| Test | Coverage | Source reference |
|---|---|---|
| Line / DataSet | Chart initialization, type, dataset, labels and values | demo/frmExample001.bas |
| Horizontal bar | Bar chart and category/value alignment | demo/frmExample004.bas |
| Candlestick | OHLC dataset insertion and argument order | demo/frmExample010.bas |
| Dual Y-axis | Right axis and per-dataset axis assignment | demo/frmExample037.bas |
| Realtime | Incremental values and Activity pause lifecycle | demo/frmExample054.bas |
| Radial gauge | Radial type, ring cap and center labels | demo/frmExample109.bas |
| Radar web | Multiple datasets and radar web styling | demo/frmExample127.bas |

## Requirements

- B4A 12+ (project file format saved as B4A 14.2, matching the source demo project).
- SithasoMPACharts library installed and enabled in the Libraries tab.
- mpChartLib and kotlin-stdlib-2.0.21 JAR dependencies, matching the source repository README/project.
- Android minimum API 23; target API 35 in the manifest.
- The installed library must expose the methods used by the selected tests. `ResetProperties` requires v10.2+; radial chart support requires v10.0+. The handbook targets v10.19.

## Open and run

1. Download or clone this repository branch.
2. Open ChartSmokeTests.b4a in B4A.
3. Confirm the SithasoMPACharts library and both additional JARs are available.
4. Compile and run on an Android device or emulator.
5. Select each test from the list at the top. The chart is rendered beneath it.
6. For realtime, leave the screen active for several seconds, background the Activity, then return. Confirm updates stop while paused.

## Limitations

- This project has not been compiled in this workflow.
- No emulator or physical-device run has been performed.
- The status label reports which test was selected; it is not an automated assertion that rendering succeeded. `ResetProperties` is called before each test's `BeginUpdate`; `ClearValues` is deliberately not used as a substitute for resetting chart properties.
- It does not replace the full 127-example demo app or the library's regression suite.

## Record results

For each case record the B4A version, SithasoMPACharts version (Chart.GetVersion if available), Android version/API, device/emulator model, compile result, runtime result, screenshots and LogCat exceptions.

If a method fails to compile, compare the installed SithasoMPACharts.xml against the handbook and the corresponding original demo example. Do not patch by guessing wrapper method names.
