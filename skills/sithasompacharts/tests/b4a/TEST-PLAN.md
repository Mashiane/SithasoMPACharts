# B4A smoke-test execution record

Use this checklist after opening ChartSmokeTests.b4a in the B4A IDE. The project is a manual runtime harness, not an automated test runner.

## Environment record

| Field | Record |
|---|---|
| Date | |
| B4A IDE version | |
| SithasoMPACharts version | |
| Android version / API | |
| Device or emulator | |
| ABI | |
| Debug or release build | |
| ProGuard/R8 enabled | |
| Compiler output / log file | |

## Test cases

| ID | Test | Expected visual/runtime result | Pass? | Evidence / notes |
|---|---|---|---|---|
| SMK-01 | Line / DataSet | Six monthly categories with six corresponding values; no compile/runtime exception | | |
| SMK-02 | Horizontal bar | Five category bars with labels matching the five values | | |
| SMK-03 | Candlestick OHLC | Five candles render; each uses High, Low, Open, Close ordering and valid bounds | | |
| SMK-04 | Dual Y-axis | Temperature series uses left axis; pressure series uses right axis; both units are identifiable | | |
| SMK-05 | Realtime | New sample appears approximately once per second; updates stop when Activity pauses | | |
| SMK-06 | Radial | Radial completion ring and center text render on a supported library version (v10.0+) | | |
| SMK-07 | Radar | Two five-point datasets render with the five category labels and web styling | | |

## Lifecycle checks

- [ ] Select realtime and verify samples are added.
- [ ] Background the app; verify the timer stops.
- [ ] Return to the app; verify no background timer updates occurred.
- [ ] Select a non-realtime test; verify realtime updates do not continue.
- [ ] Navigate repeatedly between all seven cases; watch for stale datasets, duplicated series or crashes.
- [ ] Rotate only if orientation support is deliberately enabled; this project is portrait-oriented.

## Release checks

- [ ] Debug APK compiles.
- [ ] Debug APK installs and opens.
- [ ] All seven cases render on a physical device.
- [ ] Release/minified APK compiles with the repository's ProGuard/R8 rules.
- [ ] Release/minified APK installs and all seven cases render.
- [ ] LogCat contains no chart-related uncaught exceptions.

## Defect report template

For each failure capture:
- Test ID.
- Exact steps to reproduce.
- Expected versus actual result.
- B4A compiler error or LogCat stack trace.
- Installed SithasoMPACharts version.
- Relevant original example module and whether that example also fails.
- Screenshot or screen recording.

Do not mark a test passed merely because it compiles. Rendering and lifecycle behavior require runtime observation.
