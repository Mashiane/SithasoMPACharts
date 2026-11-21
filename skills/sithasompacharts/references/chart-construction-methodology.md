# Independent chart construction methodology

## Purpose

Use this methodology when a developer asks for a new chart, visualization or dashboard and no existing demo is an appropriate implementation to copy. The objective is to create a correct, maintainable B4A implementation from requirements and verified wrapper capabilities—not to imitate a numbered demo.

Existing examples remain useful as evidence for API usage and visual behavior. They are not mandatory starting points, and their absence must not prevent chart creation. Never fabricate API calls to fill a gap in the examples.

## Mandatory six-stage workflow

Follow these stages in order for a substantial new-chart task. A small, straightforward chart may combine stages, but must still satisfy their checks.

### Stage 1 — Environment and project setup

Establish the implementation context before writing code.

Inspect:
- B4A version and project structure.
- SithasoMPACharts version using Chart.GetVersion where available.
- Installed SithasoMPACharts.xml and matching wrapper source, if supplied.
- Required library references and dependency/JAR setup.
- Android minimum/target API and whether the project uses Visual Designer.
- Existing chart instances, parent containers, naming conventions and lifecycle.
- Build configuration, including ProGuard/R8 rules for release builds.

Do not assume that the handbook's v10.19 API is identical to the installed library. If the installed XML is unavailable, mark version-sensitive API details as unverified and request the XML only when it materially blocks a safe implementation.

**Output:** a concise environment record and explicit evidence gaps.

### Stage 2 — Requirements and implementation rules

Translate the prompt into an implementation brief. Identify:

- Viewer question and decision supported by the chart.
- Chart family candidate and alternatives.
- Data source and representative sample data.
- Data grain, dimensions, measures, units, precision and sign conventions.
- X semantics: category, ordered time, or numeric coordinate.
- Number of series, series identity and comparability.
- Missing/null/zero semantics, duplicates, ordering and aggregation.
- Expected point/category count and growth.
- Static, refreshable or streaming behavior and update cadence.
- Required interactions, annotations, formatting and visual constraints.
- Empty, loading, partial and error states.
- Device orientation, available dimensions and accessibility needs.

Do not invent business meaning or silently transform data. Record assumptions and ask only for missing information that changes the design or correctness.

Apply the non-negotiable rules in SKILL.md: wrapper APIs only, exact argument order, explicit dataset identity, no magic enum integers where constants exist, no false testing claims.

**Output:** a requirements checklist and unresolved questions.

### Stage 3 — Chart design and analytical architecture

Choose a chart that answers the viewer's question and fits the data semantics. Consult chart-selection.md, but do not select a chart solely because an example exists.

Define:
1. Chart family and rationale; include a rejected alternative where useful.
2. X-axis type, labels, ordering and formatter needs.
3. Y-axis measure, units, baseline/range and tick strategy.
4. Dataset inventory: stable name, source field, value type, series color and axis assignment.
5. Stack/group/combo semantics, if applicable.
6. Legend, title, subtitle, direct-label and tooltip/selection strategy.
7. Empty and error presentation.
8. Interaction and update model.
9. Expected data volume and mobile layout constraints.

For dual axes, state both units and explain why separate charts are not preferable. For pie/donut, justify category count and denominator. For gauges, define minimum, maximum, current value and target meaning. For scatter/bubble, preserve numeric coordinates; for candlesticks, validate OHLC data.

**Output:** a compact chart specification that can be implemented independently of any demo.

### Stage 4 — Implementation architecture

Plan the B4A implementation before emitting code.

Decide:
- Designer-created versus programmatically created chart view.
- Ownership and lifetime of the chart instance.
- Separation of data retrieval/transformation from chart rendering.
- Dataset creation and stable dataset-index/handle management.
- Initialization, configuration, population and update order.
- Event callback subs and their verified signatures.
- Timer/listener lifecycle and bounded history for realtime data.
- Reusable subs for loading, clearing, refreshing and replacing data.
- Error handling and UI states in the host Activity.

Use one host chart view and attach it once. Do not duplicate Designer-generated initialization. Batch chart setup with BeginUpdate / EndUpdate when supported by the installed wrapper and the verified usage pattern.

For realtime charts, define a maximum retained point count and a cadence suitable for the application. Do not copy a demo timer interval without justification. Stop timer/listener work when the owning Activity/view is inactive and restore it deliberately.

**Output:** implementation outline and code placement map (Globals, Activity_Create, event subs, timers, reusable routines).

### Stage 5 — Wrapper API and syntax verification

Before using a member, establish that it exists on the B4A wrapper.

Evidence priority:
1. Installed SithasoMPACharts.xml and matching wrapper source for the target installation.
2. Repository working modules that demonstrate the exact call.
3. Version-matched handbook and verified API references.
4. Underlying MPAndroidChart documentation only to understand engine concepts—not as proof of B4A wrapper exposure.

For every nontrivial property, method, constant and event:
- Verify the exact spelling and signature.
- Verify parameter types and order.
- Determine whether it is a Designer property, code-only runtime property, method, field or event.
- For Designer properties, verify the Java `@Property` annotation, getter/setter pair, XML `<designerProperty>` metadata, XML `<property>` descriptor, and the backing-field mapping in `applyDesignerProps`.
- Check `ResetProperties` against Designer defaults. If the Visual Designer canvas is expected to preview the setting, verify the static `build` / `Spec.fromProps` path separately.
- Do not report an XML runtime property as a missing Designer property when it is intentionally code-only (XML `<property>` without XML `<designerProperty>`).
- Check version gates.
- Check chart-family compatibility where documented or demonstrated.
- Mark unresolved calls as assumptions; do not present them as verified.

Special data contracts must be preserved:
- Scatter: (X, Y).
- Bubble: (X, Y, Size).
- Candlestick: (High, Low, Open, Close).
- Stacked data: wrapper stack-specific methods and matching stack labels.

If a requested feature is not exposed by the wrapper, explain the gap. Consider a documented alternative or a separately verified native escape hatch only when appropriate; do not silently substitute raw MPAndroidChart calls.

**Output:** an API verification ledger: member, signature, source evidence, version condition and confidence.

### Stage 6 — Quality inspection and validation

Review the completed implementation against the specification.

#### Static/source inspection
- Every API call is verified or explicitly marked unverified.
- Dataset handles, series names, labels and values map correctly.
- Label/value counts and order are consistent.
- Units, sign, precision, missing values and aggregation are preserved.
- Axis assignments and chart semantics are correct.
- Initialization and update calls are balanced.
- Designer/programmatic view ownership is correct.
- Timers/listeners have bounded work and lifecycle cleanup.
- Empty/loading/error states are handled as required.
- No accidental demo navigation or unrelated sample UI remains.

#### Build and runtime validation
When the environment is available:
1. Compile with the target B4A version and installed library.
2. Run on an Android device or emulator and confirm the chart renders.
3. Check labels, axes, legends, series colors, values and interactions.
4. Exercise empty data, one point, multiple series, missing values and realistic volume as applicable.
5. Exercise refresh/replacement and Activity pause/resume/destroy behavior.
6. Inspect LogCat for errors and lifecycle problems.
7. Test a minified release build with the repository's R8/ProGuard rules where release readiness is requested.

A source review is not a compile test. A successful compile is not proof of correct rendering. A screenshot is not proof of lifecycle safety. Report each validation level separately.

**Output:** an inspection report with pass/fail/blocked items, evidence, unresolved risks and exact tests not performed.

## API verification ledger template

| Member | Purpose | Exact signature/type | Evidence | Version gate | Status |
|---|---|---|---|---|---|
| ChartType | Select chart family | Verify target XML | Installed XML | Check | Verified / unverified |

## Chart specification template

| Field | Specification |
|---|---|
| Viewer question | |
| Chart family | |
| X semantics | |
| Y measure and units | |
| Datasets and source fields | |
| Labels and ordering | |
| Axis assignment | |
| Interactions | |
| Data volume/update cadence | |
| Empty/loading/error states | |
| Mobile layout | |
| Assumptions/API gaps | |

## Independence rule

For independent chart-creation tasks, do not copy an existing demo as the implementation base and do not require a demo number in the answer. You may inspect examples to verify a particular wrapper pattern, but the chart architecture and code must be derived from the user's requirements and the verified API. State when an example was consulted only as API evidence.

## Completion standard

A chart is not "working" merely because plausible B4A code was generated. Use precise status language:

- **Designed:** analytical specification exists.
- **Implemented:** code has been produced and source-reviewed.
- **API-verified:** wrapper calls have been checked against target evidence.
- **Compiled:** B4A compiler completed successfully.
- **Rendered:** chart was observed on an Android runtime.
- **Runtime-validated:** relevant interactions, data updates and lifecycle cases were exercised.
- **Release-validated:** minified/release artifact was tested on the target Android environment.

Never promote one status to another without evidence.
