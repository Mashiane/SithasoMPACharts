# Handbook API catalog — v10.19

**Source:** *SithasoMPACharts: Native Android Charts for B4A Developers*, Appendix A, pp. 237–258 (DOCX page labels). Target stated by the handbook: B4A 12+, Android API 23+, MPAndroidChart 4.0.1.

This is a navigational catalog of the handbook's designer API, constants and events. It is not a substitute for the installed `SithasoMPACharts.xml`: that descriptor and the installed binary remain authoritative. The handbook states that its designer dictionary contains 229 properties. Property names below are transcribed by functional group; repeated names can occur in different conceptual contexts.

## Constants

Use named constants, never numeric enum values.

- Chart types: `CHART_LINE`, `CHART_COLUMN`, `CHART_BAR`, `CHART_PIE`, `CHART_SCATTER`, `CHART_BUBBLE`, `CHART_RADAR`, `CHART_COMBO`, `CHART_CANDLE`, `CHART_POLAR_AREA`, `CHART_RADIAL`.
- Themes: `THEME_DEFAULT`, `THEME_NIGHTFALL`, `THEME_NIGHTFALL_DARK`, `THEME_MATERIAL`, `THEME_PASTEL`, `THEME_CYBERPUNK`, `THEME_LIBERTY`.
- Line modes: `MODE_LINEAR`, `MODE_STEPPED`, `MODE_CUBIC_BEZIER`, `MODE_HORIZONTAL_BEZIER`.
- Scatter shapes: `SHAPE_SQUARE`, `SHAPE_CIRCLE`, `SHAPE_TRIANGLE`, `SHAPE_CROSS`, `SHAPE_X`, `SHAPE_CHEVRON_UP`, `SHAPE_CHEVRON_DOWN`.
- Legend: `LEGEND_AUTO`, `LEGEND_SHOW`, `LEGEND_HIDE`, `LEGEND_RIGHT`, `LEGEND_LEFT`, `LEGEND_BOTTOM`, `LEGEND_TOP`, `LEGEND_FORM_DEFAULT`, `LEGEND_FORM_SQUARE`, `LEGEND_FORM_CIRCLE`, `LEGEND_FORM_LINE`, `LEGEND_ORIENT_AUTO`, `LEGEND_ORIENT_HORIZONTAL`, `LEGEND_ORIENT_VERTICAL`, `LEGEND_DIR_AUTO`, `LEGEND_DIR_LEFT_TO_RIGHT`, `LEGEND_DIR_RIGHT_TO_LEFT`.
- Title alignment: `TITLE_ALIGN_LEFT`, `TITLE_ALIGN_CENTER`, `TITLE_ALIGN_RIGHT`.
- Y title: `YTITLE_TOP`, `YTITLE_LEFT`, `YTITLE_RIGHT`.
- X axis: `XAXIS_BOTTOM`, `XAXIS_TOP`, `XAXIS_BOTH_SIDED`, `XAXIS_TOP_INSIDE`, `XAXIS_BOTTOM_INSIDE`.
- Y label: `YLABEL_OUTSIDE`, `YLABEL_INSIDE`.
- Value position: `VALUE_POS_INSIDE`, `VALUE_POS_OUTSIDE`; value alignment: `VALUE_ALIGN_LEFT`, `VALUE_ALIGN_CENTER`, `VALUE_ALIGN_RIGHT`.
- Bar corners: `BAR_CORNER_ALL`, `BAR_CORNER_TIP`; radial cap: `RING_CAP_BUTT`, `RING_CAP_ROUND`.
- Animation easing: `EASING_LINEAR`, `EASING_EASE_IN_QUAD`, `EASING_EASE_OUT_QUAD`, `EASING_EASE_IN_OUT_QUAD`, `EASING_EASE_IN_CUBIC`, `EASING_EASE_OUT_CUBIC`, `EASING_EASE_IN_OUT_CUBIC`, `EASING_EASE_IN_QUART`, `EASING_EASE_OUT_QUART`, `EASING_EASE_IN_OUT_QUART`, `EASING_EASE_IN_SINE`, `EASING_EASE_OUT_SINE`, `EASING_EASE_IN_OUT_SINE`, `EASING_EASE_IN_EXPO`, `EASING_EASE_OUT_EXPO`, `EASING_EASE_IN_OUT_EXPO`, `EASING_EASE_IN_CIRC`, `EASING_EASE_OUT_CIRC`, `EASING_EASE_IN_OUT_CIRC`, `EASING_EASE_IN_ELASTIC`, `EASING_EASE_OUT_ELASTIC`, `EASING_EASE_IN_OUT_ELASTIC`, `EASING_EASE_IN_BACK`, `EASING_EASE_OUT_BACK`, `EASING_EASE_IN_OUT_BACK`, `EASING_EASE_IN_BOUNCE`, `EASING_EASE_OUT_BOUNCE`, `EASING_EASE_IN_OUT_BOUNCE`.
- Gestures: `GESTURE_NONE`, `GESTURE_DRAG`, `GESTURE_X_ZOOM`, `GESTURE_Y_ZOOM`, `GESTURE_PINCH_ZOOM`, `GESTURE_ROTATE`, `GESTURE_SINGLE_TAP`, `GESTURE_DOUBLE_TAP`, `GESTURE_LONG_PRESS`, `GESTURE_FLING`.

## Events

Declare optional event subs as `Sub Chart_<EventName>` in the Activity. The handbook lists:

| Event | Parameters |
|---|---|
| ValueSelected | SeriesIndex As Int, EntryIndex As Int, Value As Float |
| ValueSelectedEx | SeriesIndex As Int, EntryIndex As Int, Value As Float, StackIndex As Int, Axis As Int |
| NothingSelected | none |
| ChartClicked | X As Float, Y As Float |
| ChartLongClicked | X As Float, Y As Float |
| ChartDoubleTapped | X As Float, Y As Float |
| ChartScaled | ScaleX As Float, ScaleY As Float |
| ChartTranslated | Dx As Float, Dy As Float |
| ChartFlung | VelocityX As Float, VelocityY As Float |
| GestureStart | Gesture As Int |
| GestureEnd | Gesture As Int |

## Designer properties by functional group

The following is the handbook's property-name inventory, grouped by its Appendix A sections. For type, default, enum range, and detailed semantics, consult the corresponding table in Appendix A and verify the installed XML.

### Identity, title and badge
`BackgroundColor`, `ChartType`, `CornerRadius`, `Elevation`, `HeaderPaddingBottom`, `HeaderPaddingHorizontal`, `HeaderPaddingTop`, `NoDataText`, `Palette`, `ShowSubtitle`, `ShowTitle`, `Subtitle`, `SubtitleBold`, `SubtitleColor`, `SubtitleGravity`, `SubtitleSize`, `Theme`, `Title`, `TitleBold`, `TitleColor`, `TitleGravity`, `TitleSize`, `BadgeBackgroundColor`, `BadgeText`, `BadgeTextColor`.

### Legend
`LegendDirection`, `LegendDrawInside`, `LegendEnabled`, `LegendFontSize`, `LegendForm`, `LegendFormSize`, `LegendFormToTextSpace`, `LegendOrientation`, `LegendPosition`, `LegendStackSpace`, `LegendTextColor`, `LegendXEntrySpace`, `LegendYEntrySpace`.

### Axes, labels and grid
`AvoidFirstLastClipping`, `AxisGranularity`, `AxisLineColor`, `AxisLineWidth`, `AxisMaximum`, `AxisMinimum`, `AxisPrefix`, `AxisSuffix`, `BorderColor`, `BorderWidth`, `ClipValuesToContent`, `Decimals`, `DrawAxisLine`, `DrawAxisValues`, `DrawBorders`, `DrawDashedGrid`, `DrawGrid`, `DrawGridBackground`, `DrawXGrid`, `DrawYGrid`, `DrawZeroLine`, `ExtraBottomOffset`, `ExtraLeftOffset`, `ExtraRightOffset`, `ExtraTopOffset`, `ForceLabels`, `GranularityEnabled`, `GridBackgroundColor`, `GridColor`, `GridDashLength`, `GridDashSpace`, `InvertedY`, `KeepPositionOnRotation`, `LabelCount`, `ShowRightAxis`, `SpaceBottom`, `SpaceMax`, `SpaceMin`, `SpaceTop`, `ThousandSeparator`, `XAxisPosition`, `XLabelAngle`, `XTitle`, `XTitleColor`, `XTitleSize`, `YLabelPosition`, `YTitle`, `YTitleColor`, `YTitlePosition`, `YTitleSize`, `ZeroLineColor`, `ZeroLineWidth`.

### Value labels
`DrawValues`, `ValueAlign`, `ValueAngle`, `ValueFontSize`, `ValueTextColor`.

### Line, fill and markers
`CircleHoleRadius`, `CircleRadius`, `CubicIntensity`, `DrawCirclesEnabled`, `DrawFilledEnabled`, `DrawHighlightCircle`, `FillAlpha`, `FillBaseline`, `FillBaselineEnabled`, `FillColor`, `FillGradient`, `HighlightCircleRadius`, `LineMode`, `LineWidth`.

### Bars and stacks
`BarBorderColor`, `BarBorderWidth`, `BarCornerRadius`, `BarCornerStyle`, `BarGradient`, `BarShadowColor`, `BarSpace`, `BarWidth`, `DrawBarShadow`, `DrawValueAboveBar`, `DrawWholeStack`, `GroupSpace`, `HighlightAlpha`, `HighlightFullBar`, `PillShape`, `Stacked`, `StackGap`, `StackLabels`, `StackSectionsRounded`.

### Pie, donut and polar
`BorderRadius`, `CenterOffsetY`, `CenterSubtext`, `CenterText`, `DrawEntryLabels`, `DrawRoundedSlices`, `DrawSlicesUnderHole`, `EntryLabelColor`, `HoleColor`, `HoleRadius`, `IsDonut`, `MaxAngle`, `MinAngleForSlices`, `PadAngle`, `PieHighlightColor`, `PieMaxVisibleCount`, `RotationAngle`, `RotationEnabled`, `SelectionShift`, `SliceCornerRadius`, `SliceGradient`, `SliceSpace`, `TransparentCircleAlpha`, `TransparentCircleColor`, `TransparentCircleRadius`, `UsePercentValues`, `UseValueColorForLine`, `ValueLineColor`, `ValueLinePart1Length`, `ValueLinePart1OffsetPercentage`, `ValueLinePart2Length`, `ValueLineVariableLength`, `ValueLineWidth`, `XValuePosition`, `YValuePosition`.

### Scatter and bubble
`NormalizeBubbleSize`, `ScatterHoleColor`, `ScatterHoleRadius`, `ScatterShape`, `ScatterShapeSize`.

### Radar and web
`DrawWebEnabled`, `RadarCornerRadius`, `RadarHaloAlpha`, `RadarHaloFillColor`, `RadarHaloInnerRadius`, `RadarHaloOuterRadius`, `RadarHaloStrokeColor`, `RadarHaloStrokeWidth`, `SkipWebLineCount`, `WebAlpha`, `WebColor`, `WebColorInner`, `WebLineWidth`, `WebLineWidthInner`.

### Radial and rings
`RadialDashed`, `RingCenterImageSize`, `RingDashLength`, `RingDashSpace`, `RingEndLabels`, `RingGap`, `RingGradient`, `RingLineCap`, `RingWidth`.

### Candlestick
`CandleBarSpace`, `CandleDecreasingColor`, `CandleIncreasingColor`, `CandleIncreasingFill`, `CandleNeutralColor`, `CandleShadowColor`, `CandleShadowWidth`, `ShowCandleBar`.

### Touch, zoom, animation and loading
`AllowZoom`, `Animate`, `AnimateXYEnabled`, `AnimationDuration`, `AnimationEasing`, `AutoScaleMinMax`, `DoubleTapZoom`, `DragDecelerationEnabled`, `DragDecelerationFriction`, `DragEnabled`, `DragXEnabled`, `DragYEnabled`, `DrawMarkers`, `HardwareAcceleration`, `HighlightPerDrag`, `Loading`, `LoadingText`, `MaxHighlightDistance`, `MinOffset`, `PillMarkerEnabled`, `ScaleXEnabled`, `ScaleYEnabled`.

### Highlight and selection
`DashedHighlightLine`, `HighlightDataSetIndex`, `HighlightIndex`, `IgnoreZero`.

### Layering and preview
`DrawGridLinesBehindData`, `DrawLimitLinesBehindData`, `SampleLabels`, `SampleValues`.

## Version gates listed in Appendix A

| Feature | Available from |
|---|---|
| `CHART_RADIAL`, `CHART_POLAR_AREA` | v10.0 |
| `CHART_COMBO` | v10.2 |
| `SetViewPortOffsets` | v10.10 |
| `AnimateDataChange` | v10.10 |
| `VisibleYRangeMin` / `VisibleYRangeMax` | v10.12 |
| `RingEndLabels`, `RingCenterImage` | v10.10 |
| `PillShape`, `StackGap` | v10.10 |
| Programmatic `HighlightIndex` | v10.12 |

## Interpretation cautions from the handbook

- `LegendEnabled` is a mode, not a Boolean: Auto, Show, Hide. Auto hides the legend for a single series and for radial charts.
- `AxisMinimum` and `AxisMaximum` use broad sentinel defaults; retain automatic scaling unless a fixed range is analytically required.
- `SampleLabels` and `SampleValues` are Designer preview data; they do not populate runtime chart data.
- Feature availability is version-sensitive. Compare the installed library's version and XML descriptor before using any version-gated member.
