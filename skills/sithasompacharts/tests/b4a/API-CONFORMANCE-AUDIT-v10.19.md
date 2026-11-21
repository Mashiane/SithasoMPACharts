# SithasoMPACharts v10.19 Java / handbook / XML conformance audit

## Scope and evidence

This audit compares:

- The uploaded Java wrapper source, `SithasoMPACharts.java`.
- The supplied B4A XML descriptor, `SithasoMPACharts.xml`.
- The published v10.19 developer handbook, including Appendix A and Appendix D.
- The skill framework's Designer API dictionary, handbook catalog and verified API patterns.

The Java source declares `@Version(10.19f)`; the XML declares version `10.19`. Both identify `com.sithaso.mpacharts.SithasoMPACharts`. The handbook targets v10.19 / B4A 12+ / MPAndroidChart 4.0.1.

The JAR itself was not supplied for this audit. Therefore XML-to-Java-source alignment is checked, but the XML/JAR pair installed in a particular B4A environment is not yet verified. Compilation and IDE preview/runtime tests were not performed.

## 1. Correct API model: Designer metadata versus runtime properties

There are two distinct XML nodes:

- `<designerProperty>` is generated from the Java `@DesignerProperties` / `@Property(key=...)` declarations. It carries the Visual Designer key, display name, field type, default, enum/range and description.
- `<property>` is generated from a public Java getter/setter pair. It defines B4A property syntax and the runtime property type.

The published v10.19 counts are consistent:

| Surface | Count | Source |
|---|---:|---|
| Java `@DesignerProperties` declarations | 229 | Java source |
| XML `<designerProperty>` entries | 229 | XML |
| Handbook Designer property dictionary | 229 | Published Appendix A |
| XML `<property>` descriptors | 237 | XML |
| Code-only runtime properties | 8 | Java getter/setter pairs + XML property entries |
| XML `<method>` entries | 624 | XML |
| Java public constants / XML fields | 118 | Java + XML |
| Java events / XML events | 11 | Java + XML |
| Runnable demo examples | 127 | Published handbook / repository |

The handbook explicitly distinguishes 229 properties visible in the B4A Designer from 237 properties in the combined Basic-and-Designer surface. The eight additional entries are code-only runtime properties, not missing Designer properties.

## 2. Designer-property alignment

The following checks passed:

1. All 229 Java `@Property(key=...)` keys are unique.
2. All 229 keys match the XML `<designerProperty>` keys exactly.
3. All 229 keys match the skill's `complete-api-dictionary.md` property rows exactly.
4. All 229 keys match the skill's `handbook-api-catalog.md` inventory exactly.
5. Java annotation metadata matches XML Designer metadata for display name, field type, default, list/range and description.
6. All 229 Designer keys are read by Java `applyDesignerProps(Map)`.
7. The `ResetProperties` assignments agree with the declared defaults. Special representations are semantically equivalent: `StackLabels` defaults to an empty list internally, while the Designer default is an empty string; `SampleLabels` and `SampleValues` are initialized separately to their declared preview defaults.

This confirms that the skill's 229-property Designer dictionary is aligned with the published book and Java source. It should not be expanded to 237 Designer properties.

## 3. Runtime property getter/setter alignment

All 237 XML `<property>` entries have corresponding public Java getter and setter methods. No XML property is missing its Java accessor pair.

The 229 Designer properties are part of these 237 runtime properties. The additional eight code-only runtime properties are:

| Property | XML type | Java contract |
|---|---|---|
| `DragOffsetX` | Float | `getDragOffsetX()` / `setDragOffsetX(float)` |
| `DragOffsetY` | Float | `getDragOffsetY()` / `setDragOffsetY(float)` |
| `DrawHoleEnabled` | Boolean | `getDrawHoleEnabled()` / `setDrawHoleEnabled(boolean)` |
| `DrawOrder` | String | `getDrawOrder()` / `setDrawOrder(String)` |
| `RingCenterImage` | Object | Setter accepts B4A Bitmap or Null; getter returns Bitmap |
| `TouchEnabled` | Boolean | `getTouchEnabled()` / `setTouchEnabled(boolean)` |
| `VisibleYRangeMin` | Float | `getVisibleYRangeMin()` / `setVisibleYRangeMin(float)` |
| `VisibleYRangeMax` | Float | `getVisibleYRangeMax()` / `setVisibleYRangeMax(float)` |

These are Basic-code properties, not Visual Designer fields. The published handbook's version-gate notes mention some of them; the absence of a code-only property from the 229-row Designer dictionary is intentional.

### Special property type contracts

Two properties intentionally have a broader setter type than their getter return type:

- `StackLabels`: Designer field type is String; Java setter accepts Object and converts a B4A List, String array or comma-separated String; getter returns a B4A List. XML runtime property type is Object. The skill's array-based example is valid.
- `RingCenterImage`: code-only setter accepts Object (B4A Bitmap or Null); getter returns Bitmap; XML runtime property type is Object.

For runtime code, use the XML property type and inspect the Java setter implementation. Do not infer the Basic assignment type from the Designer `fieldType` alone.

## 4. Constants and events

- Java declares 118 public static integer constants; XML exposes 118 fields. Names match exactly.
- Java `@Events` declares 11 events; XML exposes the same 11 event strings and parameter signatures exactly.

## 5. Methods and method/property syntax

The XML contains 624 method entries, matching the published handbook count. This count must not be interpreted as 624 ordinary application methods: the XML also contains B4A integration hooks such as `_initialize`, `DesignerCreateView` and `build`. Check Java visibility/annotations and method role before recommending a method to application code.

The skill's verified method patterns were checked against the XML, including:

- `Initialize(BA, EventName)`
- `BeginUpdate()`, `EndUpdate()`
- `AddDataSet(Name, Color)`
- `AddLabels(Labels As List)`, `AddValues(DataSetIndex, Values As List)`
- `AddDataSetStack`, `AddBarDataSet`, `AddLineDataSet`, `AddScatterDataSet`
- `AddDataSetEntry`, `AddDataSetBubble`, `AddDataSetCandle`
- `AddRealtimeValue`, `SetDataSetAxis`, `SetData`
- `ClearValues`, `ClearData`, `ResetProperties`, `ResetToDefaults`
- `FitScreen`, `GetLabels`, `GetSeriesName`, `SetViewPortOffsets`, `Refresh`

`DisableScroll` and `EnableScroll` are parameterless `void` methods, not Boolean properties. Correct syntax is:

```basic
Chart.DisableScroll
Chart.EnableScroll
Chart.AllowZoom = False
```

The dashboard's former `Chart.DisableScroll = True` assignment was therefore invalid and has been corrected.

## 6. Java source finding: possible static Designer-preview fidelity gap

The runtime Designer path and static Designer canvas path are separate:

- `DesignerCreateView` calls `applyDesignerProps`, which reads all 229 Designer properties.
- The static B4A Designer `build(...)` hook creates a `Spec` using `Spec.fromProps(props)`.
- Source inspection found that `Spec.fromProps` reads 199 of the 229 Designer properties. The following 30 declared Designer properties are not copied into the static preview `Spec` and therefore appear to retain their `Spec` defaults in that preview path:

`AllowZoom`, `BarCornerRadius`, `CircleRadius`, `DragEnabled`, `DrawCirclesEnabled`, `DrawEntryLabels`, `DrawWebEnabled`, `EntryLabelColor`, `FillAlpha`, `FillColor`, `GridColor`, `HoleRadius`, `LabelCount`, `LegendFontSize`, `LegendFormSize`, `LegendTextColor`, `LineMode`, `LineWidth`, `NormalizeBubbleSize`, `ScatterShape`, `ScatterShapeSize`, `ShowRightAxis`, `SliceSpace`, `TitleColor`, `TransparentCircleRadius`, `ValueFontSize`, `ValueTextColor`, `WebColor`, `WebLineWidth`, `XAxisPosition`.

Some are interaction-only, but several visibly affect the chart. This is a source-level preview-fidelity risk, not evidence that the runtime property setter is missing: `applyDesignerProps` does read all 229 keys. It should be checked in the B4A Visual Designer before deciding which omissions are intentional and which need to be added to `Spec.fromProps`.

## 7. Skill-framework alignment and changes

The skill's Designer property inventory is aligned with the Java source and handbook. The audit also identified places where the instructions needed to explain the distinction more explicitly.

Updates made on this branch:

1. `SKILL.md`: added the Java → B4A XML exposure contract, the Designer/runtime property distinction, code-only property rules and special type contracts.
2. `complete-api-dictionary.md`: clarified that 229 is the Designer inventory and 237 is the full XML runtime property surface; documented the eight code-only properties and StackLabels/RingCenterImage types.
3. `handbook-api-catalog.md`: added a separate code-only runtime property table.
4. `verified-api-patterns.md`: explained why `StackLabels` is String in Designer metadata but accepts arrays/lists in Basic code; retained the `DisableScroll` method correction.
5. `chart-auditor.md`: added mandatory checks for annotation/getter/setter/XML/backing-field/default/preview alignment.
6. `chart-construction-methodology.md`: made the full exposure-chain check part of API verification.
7. Dashboard source: corrected `Chart.DisableScroll = True` to `Chart.DisableScroll`.

## 8. Remaining validation

| Validation | Status |
|---|---|
| Java annotation keys vs XML Designer metadata | Complete; 229/229 |
| Java annotation keys vs handbook Designer dictionary | Complete; 229/229 |
| Java annotation keys vs skill Designer catalog | Complete; 229/229 |
| Designer property keys vs `applyDesignerProps` | Complete; 229/229 |
| XML runtime properties vs Java getter/setter pairs | Complete; 237/237 |
| Java constants vs XML fields | Complete; 118/118 |
| Java events vs XML events | Complete; 11/11 |
| Skill's documented method patterns vs XML | Complete for the listed patterns |
| Static Designer preview fidelity | Source gap identified; IDE preview test pending |
| XML/JAR binary pair consistency | Not verified; JAR not supplied |
| B4A compilation | Not run |
| Android runtime/device tests | Not run |

## Recommended next action

Open the library in the B4A Visual Designer and test representative properties from the 30-member preview list, especially visible settings such as `LineWidth`, `DrawCirclesEnabled`, `TitleColor`, `HoleRadius` and `LegendFontSize`. If the preview does not reflect them, update `Spec.fromProps` or explicitly document the properties that are intentionally runtime-only in preview.
