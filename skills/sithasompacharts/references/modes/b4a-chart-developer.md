# B4A Chart Developer mode

## Mission

Implement a supplied chart specification as maintainable B4A code using the SithasoMPACharts wrapper. Prefer the smallest working adaptation of a real example over a fresh, speculative implementation.

## Source inspection sequence

1. Read the chart gallery/registration module to map the example number to its title.
2. Fetch and inspect the exact demo/frmExampleNNN.bas module.
3. Inspect helper routines and event subs used by that module.
4. Check the handbook catalog for property names, event signatures and version notes.
5. For uncertain calls, inspect the installed SithasoMPACharts.xml or matching wrapper source from the user's actual installation.
6. Check Chart.GetVersion at runtime when behavior depends on a library version.

The handbook targets v10.19; it is not proof that the user's installed library has the same API.

## Implementation procedure

1. Confirm B4A version, library version and whether the chart is Designer-created or programmatic when that affects code.
2. Identify the closest example and explain why it is the right starting point.
3. Keep the chart's data model separate from view construction where practical.
4. Initialize one chart instance and add it to the intended parent exactly once.
5. Configure the chart and populate datasets within BeginUpdate / EndUpdate when supported by the example.
6. Use named wrapper constants instead of raw enum integers.
7. Keep labels and values aligned; keep numeric X/Y values numeric for scatter and bubble charts.
8. Implement event subs with exact signatures copied from verified sources.
9. Handle empty/loading/error states in the host app as appropriate.
10. Explain where code belongs: Process_Globals, Globals, Activity_Create, Designer-generated view declarations, event subs, timers or reusable subs.

## API correctness rules

- The B4A wrapper is not the entire MPAndroidChart Java API. A Java method existing in the engine does not mean it is exposed by the wrapper.
- Never invent method/property names based on naming conventions.
- Do not pass magic integers for chart types, legend modes, easing modes or axis dependencies when named constants exist.
- Preserve special data argument order:
  - Scatter: (X, Y).
  - Bubble: (X, Y, Size).
  - Candlestick: (High, Low, Open, Close).
  - Stacked datasets: use the wrapper's stack-specific method and stack labels.
- Keep dataset handles/identifiers and axis assignment explicit in multi-series, combo and dual-axis charts.
- Confirm whether a property is a designer property, runtime property or method. Do not assume interchangeability.
- Do not confuse Designer preview fields SampleLabels / SampleValues with runtime data.

## Lifecycle and performance

- Avoid adding a second programmatic chart when the Designer has already created the intended view.
- Treat the wrapper chart as a stable host view; changing ChartType changes its inner chart. Do not remove/recreate the host view unless a verified use case requires it.
- For live charts, use bounded history, sensible update cadence and a UI-thread-safe update path.
- Stop timers/listeners when the Activity or owning view is no longer active; restart only when appropriate.
- Do not copy the demo's 60 ms realtime interval as a production default.
- Avoid refreshing/rebuilding the full chart for every incoming sample if the wrapper has an incremental path.
- Test realistic point counts on a real device; emulator-only performance is not sufficient evidence.
- For release builds, apply the repository's ProGuard/R8 rules and test the minified APK.

## Output contract

For each implementation, state:

- Source example module(s) inspected.
- Wrapper methods/properties/events verified and any that remain assumptions.
- Code placement and required library/dependency setup.
- Data assumptions and any transformation/aggregation.
- Lifecycle behavior for timers/listeners.
- Whether code was compiled, run in an emulator or tested on a physical device. If not performed, say so plainly.

Do not state "tested" when only source inspection has occurred.
