# SithasoMPACharts v10.19 API conformance audit

## Scope and evidence

This audit compares the skill framework and its B4A dashboard example with the user-supplied `SithasoMPACharts.xml`.

- XML class: `com.sithaso.mpacharts.SithasoMPACharts`
- XML version: `10.19`
- B4A wrapper: `SithasoMPACharts`
- This is a descriptor/API-surface audit. It does not establish that the installed JAR and XML are a matching pair, nor does it replace B4A compilation or Android runtime testing.

## XML inventory

| XML element | Count | Interpretation |
|---|---:|---|
| `property` | 237 | All 237 entries have exactly one setter parameter and are writable B4A properties |
| `field` | 118 | Constants and public fields |
| `event` | 11 | Event declarations |
| `method` | 624 | Includes ordinary callable methods, generated property accessors, callback methods and B4A designer/internal hooks |

Do not interpret all 624 method entries as application-level methods. The descriptor also contains generated `getX`/`setX` accessors, event callback implementation methods and B4A lifecycle/designer hooks. For application code, use the `property`, `field` and `event` declarations in their respective roles, and use the ordinary public methods with their declared signatures.

## Handbook property inventory delta

The skill's handbook-derived dictionary contains 229 properties, matching the handbook's stated count. The XML exposes eight additional writable properties:

| Property | XML type |
|---|---|
| `DragOffsetX` | `float` |
| `DragOffsetY` | `float` |
| `DrawHoleEnabled` | `boolean` |
| `DrawOrder` | `java.lang.String` |
| `RingCenterImage` | `java.lang.Object` |
| `TouchEnabled` | `boolean` |
| `VisibleYRangeMax` | `float` |
| `VisibleYRangeMin` | `float` |

The handbook dictionary is accurate as a handbook transcription, but it is not a complete inventory of the installed XML surface. The skill now documents this delta.

## Confirmed syntax distinction: DisableScroll

The XML declares:

- `DisableScroll`: method, no parameters, returns `void`
- `EnableScroll`: method, no parameters, returns `void`
- `AllowZoom`: Boolean property with a setter parameter

Correct B4A syntax:

```basic
Chart.DisableScroll
Chart.EnableScroll
Chart.AllowZoom = False
```

Incorrect syntax:

```basic
Chart.DisableScroll = True
```

The dashboard had the incorrect assignment in its shared chart configuration. It has been corrected to a method call.

## Dashboard API verification

The dashboard's SithasoMPACharts members were checked against the XML.

### Properties used

`Title`, `ShowTitle`, `Subtitle`, `ShowSubtitle`, `Theme`, `BackgroundColor`, `CornerRadius`, `Elevation`, `HeaderPaddingHorizontal`, `HeaderPaddingTop`, `HeaderPaddingBottom`, `XTitle`, `YTitle`, `LegendEnabled`, `AllowZoom`, `Animate`, `AnimationDuration`, `DrawCirclesEnabled`, `LineWidth`, `ChartType`, `AxisMinimum`, `BarWidth`, `DrawValues`, `ValueFontSize`, `CircleRadius`.

All are declared as XML properties.

### Methods used

| Method | XML signature |
|---|---|
| `Initialize` | `Initialize(ba As BA, EventName As String)` |
| `BeginUpdate` | no parameters; returns `void` |
| `EndUpdate` | no parameters; returns `void` |
| `DisableScroll` | no parameters; returns `void` |
| `AddDataSet` | `AddDataSet(Name As String, Color As Int) As Int` |
| `AddLabels` | `AddLabels(Labels As List)` |
| `AddValues` | `AddValues(DataSetIndex As Int, Values As List)` |

All are declared as XML methods.

### Fields used

`THEME_NIGHTFALL`, `LEGEND_AUTO`, `LEGEND_HIDE`, `CHART_LINE`, and `CHART_COLUMN` are declared XML fields.

## Skill framework changes made

1. Added mandatory XML descriptor interpretation rules to `SKILL.md`, explicitly separating properties, methods, fields and events.
2. Added the `DisableScroll` / `EnableScroll` method-call pattern to `verified-api-patterns.md`.
3. Documented the eight XML properties missing from the handbook-derived dictionary.
4. Corrected the dashboard's `DisableScroll` assignment.
5. Updated the dashboard implementation report's API ledger to reflect XML verification.

## Remaining recommendations

- Keep the installed XML (or a generated, versioned API snapshot) available to the agent. The skill cannot verify a target installation it cannot inspect.
- Extend the API reference beyond the handbook's property catalogue: include exact callable method signatures, field/constant inventory and event signatures from the XML.
- Add a regression evaluation specifically for method/property confusion, using `DisableScroll` as the negative case and `AllowZoom` as the Boolean-property case.
- At project setup, record `Chart.GetVersion` and confirm the XML/JAR belong to the same release.
- Compile and run the dashboard in B4A. Gesture arbitration between the chart and parent ScrollView still requires device testing.

## Validation status

| Validation | Status |
|---|---|
| XML parsed and member counts collected | Complete |
| Dashboard members checked against XML | Complete |
| Method/property misuse corrected | Complete |
| Skill instructions updated | Complete |
| B4A compilation | Not run |
| Android rendering and gesture testing | Not run |
| XML/JAR pair consistency | Not verified |
