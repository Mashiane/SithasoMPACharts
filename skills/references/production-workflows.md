# Production workflow notes

This reference distills the supplied v10.19 handbook's production and interaction guidance. Confirm exact API calls against the installed library XML and source examples.

## Dashboard composition

- Place multiple chart views in a scrollable dashboard or populate tabbed pages when visible.
- Keep data retrieval and mapping separate from chart rendering.
- Provide explicit loading, empty and error/retry states; do not present an empty chart as a successful zero-valued result.
- Build a reusable chart factory around the DataSet API, but keep chart-specific setup explicit where types differ.
- Use a configuration object/map to centralize title, chart type, labels, palette/theme and formatting when many charts share a design system.

## JSON payload to DataSet

Map the API response into a normalized internal representation before populating the chart:
- labels: ordered category/time labels (where applicable)
- series: stable series name, unit, axis assignment and numeric values
- specialized entries: explicit X/Y, bubble size or OHLC fields as required

Validate numeric conversion, null/missing values, cardinality and chronological ordering before calling the chart API. For decimal JSON values, use a conversion that preserves decimal precision (e.g. `CDbl` in B4A).

## Updating an existing chart

For data replacement, the handbook describes clearing existing values before repopulating. Example 122 specifically uses `ClearValues` followed by `AddValues` to refresh pie data. Inspect the target module for whether datasets are retained or recreated.

For live dashboards, avoid unnecessarily rebuilding the whole view. Preserve zoom/viewport state when the target API and chart type support it; verify the relevant wrapper methods before relying on this behavior.

## Realtime lifecycle

Example 054 uses a B4A Timer with a 60 ms interval and `AddRealtimeValue(Wave, 0, 35)`. It toggles timer state on chart click and clears values on long-click.

Production adaptation requirements:
- replace the synthetic waveform with the actual data source;
- stop or disable the timer when the Activity is paused/closed;
- avoid overlapping timer callbacks or unbounded history;
- separate transport errors from chart rendering errors;
- do not assume a 60 ms interval is appropriate for every data source or device.

## Interaction and animation

- Examples 052–053 demonstrate `AnimateXYEnabled` and `AnimationDuration`.
- Example 120 demonstrates `AnimationEasing = EASING_EASE_OUT_BOUNCE`.
- Example 054 disables entrance animation for continuous streaming.
- Example 056 demonstrates highlighting and pill marker styling.
- Use only event signatures observed in the wrapper/module; don't infer raw engine callbacks.

## Export and release

The handbook includes bitmap/download export recipes and ProGuard/R8 release packaging. Before shipping:
1. check the required JAR dependencies in the repository README;
2. apply the keep rules supplied with the distribution;
3. build and test a minified release, not just a debug build;
4. verify export permissions/storage behavior on the target Android API;
5. record the wrapper and engine versions.

The README currently lists `mpChartLib` and `kotlin-stdlib-2.0.21` as `#AdditionalJar` dependencies. Recheck the current README when doing a new release.