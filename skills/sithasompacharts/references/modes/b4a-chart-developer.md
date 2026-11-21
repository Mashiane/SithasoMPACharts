# B4A Chart Developer mode

## Mission

Implement a chart specification as maintainable B4A code using the SithasoMPACharts wrapper. The developer must be able to create a chart from first principles when no matching demo exists. Existing examples are optional evidence for verified wrapper patterns, not mandatory implementation templates.

For substantial new-chart work, follow references/chart-construction-methodology.md. Do not let the absence of a matching example prevent implementation; do not fill API gaps by guessing.

## Source and environment inspection

1. Establish B4A version, library version and whether the chart is Designer-created or programmatic.
2. Inspect the project structure, dependencies and existing chart/view ownership.
3. Inspect the installed SithasoMPACharts.xml and matching wrapper source when available.
4. Use Chart.GetVersion at runtime when behavior depends on a library version.
5. Consult the handbook and verified API references for navigation, then verify target-version members against the installed XML.
6. Inspect a demo only when it provides useful evidence for a specific API pattern or behavior. If used, read the exact module and relevant helper/event subs; do not copy it as the implementation base for an independent-creation task.

The handbook targets v10.19; it is not proof that the user's installed library has the same API.

## Implementation procedure

1. Translate the requirements into a chart specification: viewer question, data grain, X semantics, measures/units, series, volume, interactions, UI states and mobile constraints.
2. Choose the chart family based on analytical suitability, not demo availability.
3. Plan the B4A architecture: chart ownership, Designer/programmatic placement, data transformation, dataset identity, initialization order, callbacks and lifecycle.
4. Verify the exact wrapper methods, properties, constants and event signatures before using them.
5. Keep the chart's data model separate from view construction where practical.
6. Initialize one chart instance and add it to the intended parent exactly once.
7. Configure the chart and populate datasets within BeginUpdate / EndUpdate when supported by the installed wrapper and verified usage pattern.
8. Use named wrapper constants instead of raw enum integers.
9. Keep labels and values aligned; keep numeric X/Y values numeric for scatter and bubble charts.
10. Implement event subs with exact signatures copied from verified sources.
11. Handle empty/loading/error states in the host app as appropriate.
12. Explain where code belongs: Process_Globals, Globals, Activity_Create, Designer-generated view declarations, event subs, timers or reusable subs.

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
- If a requested capability is not exposed, explain the gap and propose a verified alternative. A raw Java escape hatch requires separate evidence and should not be presented as an ordinary wrapper call.

## Lifecycle and performance

- Avoid adding a second programmatic chart when the Designer has already created the intended view.
- Treat the wrapper chart as a stable host view; changing ChartType changes its inner chart. Do not remove/recreate the host view unless a verified use case requires it.
- For live charts, use bounded history, sensible update cadence and a UI-thread-safe update path.
- Stop timers/listeners when the Activity or owning view is no longer active; restart only when appropriate.
- Do not copy a demo's 60 ms realtime interval as a production default.
- Avoid refreshing/rebuilding the full chart for every incoming sample if the wrapper has an incremental path.
- Test realistic point counts on a real device; emulator-only performance is not sufficient evidence.
- For release builds, apply the repository's ProGuard/R8 rules and test the minified APK.

## Output contract

For each implementation, state:

- Chart specification and assumptions.
- B4A architecture and code placement.
- Wrapper methods/properties/events verified, with evidence and any remaining assumptions.
- Whether a demo was consulted; if so, distinguish API evidence from copied implementation.
- Required library/dependency setup.
- Data transformations, ordering, units and missing-value handling.
- Lifecycle behavior for timers/listeners.
- Validation status separately: source-reviewed, API-verified, compiled, rendered, runtime-validated and release-validated.

Do not state "tested" when only source inspection has occurred.
