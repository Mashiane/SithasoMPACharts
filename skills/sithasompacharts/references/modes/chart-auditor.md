# Chart Auditor mode

## Mission

Review an existing SithasoMPACharts implementation for API correctness, data integrity, analytical validity, mobile usability, performance and lifecycle safety. Prioritize defects by impact and provide evidence for each finding.

## Audit sequence

### 1. Establish target environment

Record the B4A version, SithasoMPACharts version (Chart.GetVersion where available), Android API target, device class and whether the chart is Designer-created or programmatic. If unavailable, mark the environment unknown rather than assuming the handbook target.

### 2. Verify wrapper API use

- Compare every method, property, constant and event signature with the installed XML and source examples.
- Identify calls that appear to be raw MPAndroidChart methods rather than exposed wrapper APIs.
- Check version-gated features against the installed version.
- Check chart type constants and legend modes; flag unexplained magic integers.
- Confirm specialized argument order for scatter, bubble, candlestick and stacked datasets.
- Confirm designer properties are not mistakenly used as runtime data APIs.
- Flag assumptions about behavior not demonstrated in the source.

### 3. Verify data integrity

- Compare label count, order and meaning with corresponding values.
- Check dataset identifiers and whether values are appended to the intended dataset.
- Check stack segment order and stack labels.
- Check numeric X/Y coordinate preservation for scatter/bubble.
- Check OHLC validity (High/Low bounds contain Open and Close) and wrapper argument order.
- Check units, currency, percentages, precision and aggregation.
- Check null/missing versus zero, duplicate timestamps, sort order and outliers.
- Check negative values are preserved and not silently converted to absolute values.

### 4. Verify analytical integrity

- Is the chart appropriate for the viewer's question?
- Are bar/column baselines and axis ranges defensible?
- Are dual axes clearly labeled and not visually implying false correlation?
- Are pie/donut categories few enough to compare?
- Are radar dimensions comparable and not overloaded?
- Are gauge range, target and denominator explicit?
- Are time intervals regular or are gaps represented honestly?
- Are labels and legend sufficient to interpret the plot without guessing?

### 5. Verify mobile UX

- Can the chart be read on a narrow phone in portrait orientation?
- Are labels clipped, overcrowded or rotated excessively?
- Is the legend consuming more space than the plot?
- Is text legible and contrast sufficient?
- Does interaction require precision tapping?
- Is there a textual or numeric alternative for important values?
- Does the chart remain understandable without relying on color alone?

### 6. Verify lifecycle and performance

- Is the chart initialized and attached exactly once?
- Is Designer-created view initialization duplicated?
- Are BeginUpdate / EndUpdate balanced?
- Are unnecessary full refreshes performed?
- Does a realtime timer have bounded history and a reasonable cadence?
- Are timers/listeners stopped when the Activity/view pauses or is destroyed?
- Can data accumulation cause memory growth?
- Is the chart tested with realistic data volume and a minified release build?

## Severity model

- **Critical:** likely crash, corrupted data, or materially false interpretation.
- **High:** core chart fails, values/series are misassigned, or lifecycle leaks are likely.
- **Medium:** significant readability, performance or maintainability problem.
- **Low:** minor visual inconsistency, naming or cleanup.
- **Info:** unverified assumption, environment gap or optional improvement.

## Finding format

For each finding provide:

- Severity.
- File/subroutine/line or code fragment.
- Evidence: exact wrapper/example/handbook source checked.
- Impact and failure mode.
- Minimal corrective action.
- Confidence: verified, strongly indicated, or needs runtime validation.

Separate confirmed defects from risks and suggestions. Do not label an API call invalid unless the target wrapper source or XML has been checked. If only handbook/repository examples were available, state that limitation.

## Final audit summary

Report:
1. Critical/high findings first.
2. Data and analytical integrity risks.
3. API/version uncertainties.
4. Mobile UX and performance risks.
5. Lifecycle/release-readiness gaps.
6. Tests required to close remaining uncertainty.

Never claim compile/runtime validation unless it was actually performed.
