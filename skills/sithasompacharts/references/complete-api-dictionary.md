# Complete Designer API dictionary — handbook v10.19

**Source:** *SithasoMPACharts: Native Android Charts for B4A Developers*, Appendix A, pp. 237–258. This reference transcribes the supplied handbook. It is not a guarantee that every member exists in an older/newer installation. The installed `SithasoMPACharts.xml` and runtime `Chart.GetVersion` remain authoritative.

The handbook states that the Designer dictionary contains 229 properties. Tables below preserve its property names, types, defaults, ranges and descriptions. A dash means the handbook does not specify additional values or description.

## Installed v10.19 XML delta

The handbook inventory below contains the 229 Visual Designer properties. The installed v10.19 XML contains 237 B4A `<property>` descriptors: the same 229 Designer properties plus eight code-only runtime properties. This is the intended distinction between XML `<designerProperty>` metadata and XML `<property>` getter/setter descriptors; the eight code-only entries are not missing Designer properties:

| Property | XML type | XML description |
|---|---|---|
| `DragOffsetX` | Float | Horizontal drag offset |
| `DragOffsetY` | Float | Vertical drag offset |
| `DrawHoleEnabled` | Boolean | Direct toggle for the pie/donut hole, independent of `IsDonut` |
| `DrawOrder` | String | Combo draw order; comma-separated subset of BAR, BUBBLE, LINE, SCATTER, CANDLE |
| `RingCenterImage` | Object | B4A Bitmap displayed in the radial centre; pass Null to clear |
| `TouchEnabled` | Boolean | Master switch for touch gestures and taps |
| `VisibleYRangeMax` | Float | Live visible Y-window ceiling |
| `VisibleYRangeMin` | Float | Live visible Y-window floor |

These eight entries are confirmed in the uploaded `SithasoMPACharts.xml` for class `com.sithaso.mpacharts.SithasoMPACharts`, version 10.19. Each has a Java getter/setter pair and an XML `<property>` descriptor, but no `@DesignerProperties` declaration / XML `<designerProperty>` entry. Across the full surface, all 237 XML property descriptors have a setter parameter and matching Java getter/setter pair. The handbook Appendix A dictionary is specifically the complete Designer-property inventory, not a list of every code-only runtime property.

## Special runtime type contracts\n\n- `StackLabels` is a Designer `String` field, but its Java runtime setter accepts `Object` (B4A List, String array or comma-separated String) and its getter returns a B4A List. The XML runtime property type is `Object`; this is intentional flexibility, not a missing setter.\n- `RingCenterImage` is code-only (not a Visual Designer property). Its setter accepts `Object` (B4A Bitmap or Null) and its getter returns Bitmap; the XML runtime property type is `Object`.\n\n## Reading this reference

- Types and defaults are transcribed from the handbook, not inferred from the Java engine.
- Integer values shown in ranges are documented enum encodings. In B4A code, prefer the corresponding named constant.
- Color value `0` often means a library default, transparent, or a documented fallback; consult the row description rather than assuming one universal meaning.
- In v10.19, each of the 229 Designer properties also has a Java getter/setter pair and an XML `<property>` descriptor, so it is available through B4A property syntax at runtime. The separate `<designerProperty>` entry supplies Visual Designer metadata. For another library version, verify both XML entries and the matching Java source.
- The handbook targets SithasoMPACharts v10.19, B4A 12+, Android API 23+ and MPAndroidChart 4.0.1.

## Chart identity and title row

| Property | Type | Default | Values / range | Description |
|---|---|---:|---|---|
| BackgroundColor | Color | 0 | — | 0 = transparent |
| ChartType | Int | 0 | 0–10 | 0=Line, 1=Column, 2=Bar horizontal, 3=Pie, 4=Scatter, 5=Bubble, 6=Radar, 7=Combo, 8=CandleStick, 9=Polar Area, 10=Radial |
| CornerRadius | Float | 0 | — | Rounds the chart card itself; 0 = square; content clips to rounded outline |
| Elevation | Float | 0 | — | Shadow lift in dips; 0 = flat; shows best with BackgroundColor set |
| HeaderPaddingBottom | Float | 4 | — | Space below title row |
| HeaderPaddingHorizontal | Float | 12 | — | Left and right inset of title row |
| HeaderPaddingTop | Float | 8 | — | Space above title row |
| NoDataText | String | No data | — | — |
| Palette | List | "" | — | Series colors, cycled in order; empty = built-in palette |
| ShowSubtitle | Boolean | False | — | — |
| ShowTitle | Boolean | False | — | — |
| Subtitle | String | "" | — | — |
| SubtitleBold | Boolean | False | — | — |
| SubtitleColor | Color | 0 | — | 0 = library default, otherwise ARGB color |
| SubtitleGravity | Int | 0 | 0 / 1 / 2 | 0=Left, 1=Center, 2=Right |
| SubtitleSize | Float | 11 | — | — |
| Theme | Int | 0 | 0–6 | 0=Default, 1=Nightfall Light, 2=Nightfall Dark, 3=Material, 4=Pastel, 5=Cyberpunk, 6=Liberty |
| Title | String | "" | — | — |
| TitleBold | Boolean | False | — | — |
| TitleColor | Color | 0 | — | 0 = library default, otherwise ARGB color |
| TitleGravity | Int | 0 | 0 / 1 / 2 | 0=Left, 1=Center, 2=Right |
| TitleSize | Float | 12 | — | — |

## Badge

| Property | Type | Default | Values / range | Description |
|---|---|---:|---|---|
| BadgeBackgroundColor | Color | 0 | — | — |
| BadgeText | String | "" | — | — |
| BadgeTextColor | Color | 0 | — | — |

## Legend

| Property | Type | Default | Values / range | Description |
|---|---|---:|---|---|
| LegendDirection | Int | 0 | 0 / 1 / 2 | 0=Auto, 1=Left to right, 2=Right to left |
| LegendDrawInside | Boolean | False | — | Draws legend over plot; takes no layout space and does not shrink chart |
| LegendEnabled | Int | 0 | 0 / 1 / 2 | 0=Auto (one series and all radial charts hide), 1=Always, 2=Never |
| LegendFontSize | Float | 10 | — | — |
| LegendForm | Int | 2 | 0 / 1 / 2 / 3 | 0=Default, 1=Square, 2=Circle, 3=Line; engine does not support ovals/custom glyphs |
| LegendFormSize | Float | 8 | — | — |
| LegendFormToTextSpace | Float | 5 | — | — |
| LegendOrientation | Int | 0 | 0 / 1 / 2 | 0=Auto by position, 1=Horizontal, 2=Vertical |
| LegendPosition | Int | 2 | 0 / 1 / 2 / 3 | 0=Right, 1=Left, 2=Bottom, 3=Top |
| LegendStackSpace | Float | 3 | — | — |
| LegendTextColor | Color | 0 | — | — |
| LegendXEntrySpace | Float | 6 | — | — |
| LegendYEntrySpace | Float | 0 | — | — |

## Axes and grid

| Property | Type | Default | Values / range | Description |
|---|---|---:|---|---|
| AvoidFirstLastClipping | Boolean | False | — | — |
| AxisGranularity | Float | 0 | — | Minimum interval between axis ticks; 0=auto, 1.0=whole numbers |
| AxisLineColor | Color | 0 | — | — |
| AxisLineWidth | Float | 1 | — | — |
| AxisMaximum | Float | 999999 | — | Leave default for automatic scaling |
| AxisMinimum | Float | -999999 | — | Leave default for automatic scaling |
| AxisPrefix | String | "" | — | — |
| AxisSuffix | String | "" | — | — |
| BorderColor | Color | 0 | — | — |
| BorderWidth | Float | 1 | — | — |
| ClipValuesToContent | Boolean | False | — | — |
| Decimals | Int | -1 | -1 to 8 | -1=automatic |
| DrawAxisLine | Boolean | True | — | — |
| DrawAxisValues | Boolean | True | — | — |
| DrawBorders | Boolean | False | — | — |
| DrawDashedGrid | Boolean | False | — | — |
| DrawGrid | Boolean | True | — | — |
| DrawGridBackground | Boolean | False | — | — |
| DrawXGrid | Boolean | True | — | — |
| DrawYGrid | Boolean | True | — | — |
| DrawZeroLine | Boolean | False | — | — |
| ExtraBottomOffset | Float | 0 | — | — |
| ExtraLeftOffset | Float | 0 | — | — |
| ExtraRightOffset | Float | 0 | — | — |
| ExtraTopOffset | Float | 0 | — | — |
| ForceLabels | Boolean | False | — | — |
| GranularityEnabled | Boolean | False | — | — |
| GridBackgroundColor | Color | 0 | — | — |
| GridColor | Color | 0 | — | — |
| GridDashLength | Float | 10 | — | — |
| GridDashSpace | Float | 5 | — | — |
| InvertedY | Boolean | False | — | — |
| KeepPositionOnRotation | Boolean | False | — | — |
| LabelCount | Int | 6 | 2 to 20 | — |
| ShowRightAxis | Boolean | False | — | — |
| SpaceBottom | Float | 10 | — | — |
| SpaceMax | Float | 0 | — | — |
| SpaceMin | Float | 0 | — | — |
| SpaceTop | Float | 10 | — | — |
| ThousandSeparator | Boolean | False | — | — |
| XAxisPosition | Int | 0 | 0–4 | 0=Bottom, 1=Top, 2=Both Sides, 3=Top Inside, 4=Bottom Inside |
| XLabelAngle | Float | 0 | — | Clockwise degrees; negative values rotate counter-clockwise |
| XTitle | String | "" | — | — |
| XTitleColor | Color | 0 | — | — |
| XTitleSize | Float | 11 | — | — |
| YLabelPosition | Int | 0 | 0 / 1 | 0=Outside chart, 1=Inside chart |
| YTitle | String | "" | — | — |
| YTitleColor | Color | 0 | — | — |
| YTitlePosition | Int | 1 | 0 / 1 / 2 | 0=Top left, 1=Left vertical, 2=Right vertical |
| YTitleSize | Float | 11 | — | — |
| ZeroLineColor | Color | 0 | — | — |
| ZeroLineWidth | Float | 1 | — | — |

## Value labels

| Property | Type | Default | Values / range | Description |
|---|---|---:|---|---|
| DrawValues | Boolean | False | — | — |
| ValueAlign | Int | 1 | 0 / 1 / 2 | Horizontal anchor: 0=Left, 1=Center, 2=Right; pie and radar always center |
| ValueAngle | Float | 0 | — | Clockwise degrees; negative values rotate counter-clockwise |
| ValueFontSize | Float | 10 | — | — |
| ValueTextColor | Color | 0 | — | — |

## Line, fill and markers

| Property | Type | Default | Values / range | Description |
|---|---|---:|---|---|
| CircleHoleRadius | Float | -1 | — | -1 = half the point radius |
| CircleRadius | Float | 3 | — | — |
| CubicIntensity | Float | 0.2 | — | — |
| DrawCirclesEnabled | Boolean | True | — | — |
| DrawFilledEnabled | Boolean | False | — | — |
| DrawHighlightCircle | Boolean | False | — | — |
| FillAlpha | Int | 65 | 0 to 255 | — |
| FillBaseline | Float | 0 | — | — |
| FillBaselineEnabled | Boolean | False | — | Fills to FillBaseline instead of zero |
| FillColor | Color | 0 | — | 0 = reuse series color |
| FillGradient | Boolean | False | — | — |
| HighlightCircleRadius | Float | 5 | — | — |
| LineMode | Int | 2 | 0 / 1 / 2 / 3 | 0=Linear, 1=Stepped, 2=Cubic Bezier, 3=Horizontal Bezier |
| LineWidth | Float | 2 | — | — |

## Bars

| Property | Type | Default | Values / range | Description |
|---|---|---:|---|---|
| BarBorderColor | Color | 0 | — | — |
| BarBorderWidth | Float | 0 | — | — |
| BarCornerRadius | Float | 0 | — | — |
| BarCornerStyle | Int | 0 | 0 / 1 | 0=Rounds every corner, 1=Rounds outer tip only and keeps axis foot square |
| BarGradient | Boolean | False | — | — |
| BarShadowColor | Color | 0 | — | — |
| BarSpace | Float | 0.05 | — | — |
| BarWidth | Float | 0.85 | 0.0 to 1.0 | Width relative to category slot |
| DrawBarShadow | Boolean | False | — | — |
| DrawValueAboveBar | Boolean | True | — | True=values above bars; False=inside |
| DrawWholeStack | Boolean | True | — | False=label only total on top of stacked bar |
| GroupSpace | Float | 0.2 | — | — |
| HighlightAlpha | Int | 120 | 0 to 255 | — |
| HighlightFullBar | Boolean | False | — | Tapping a stacked bar highlights the entire bar |
| PillShape | Boolean | False | — | Bars, columns and stacked sections as rounded pill/capsule shapes |
| Stacked | Boolean | False | — | False: list value is summed into one bar |
| StackGap | Float | 0 | — | Gap between stacked sections in dips; handbook notes 3.5 default when PillShape enabled |
| StackLabels | String | "" | — | Comma-separated legend labels for stacked bars |
| StackSectionsRounded | Boolean | False | — | Rounds every section instead of only the tip |

## Pie, donut and polar

| Property | Type | Default | Values / range | Description |
|---|---|---:|---|---|
| BorderRadius | Float | 0 | — | Universal corner radius for bar corners and pie/polar slice corners in dips |
| CenterOffsetY | Float | 0 | — | Shifts center text block vertically; positive moves down |
| CenterSubtext | String | "" | — | — |
| CenterText | String | "" | — | — |
| DrawEntryLabels | Boolean | False | — | — |
| DrawRoundedSlices | Boolean | False | — | — |
| DrawSlicesUnderHole | Boolean | False | — | — |
| EntryLabelColor | Color | 0 | — | — |
| HoleColor | Color | 0 | — | — |
| HoleRadius | Float | 55 | 0 to 90 | — |
| IsDonut | Boolean | False | — | — |
| MaxAngle | Float | 360 | — | — |
| MinAngleForSlices | Float | 0 | — | Slices smaller than this angle still draw at this size |
| PadAngle | Float | 0 | — | Angular gap between pie/polar slices in degrees |
| PieHighlightColor | Color | 0 | — | — |
| PieMaxVisibleCount | Int | 0 | — | Hides value labels past this slice count; 0=no limit |
| RotationAngle | Float | 0 | — | — |
| RotationEnabled | Boolean | True | — | — |
| SelectionShift | Float | 9 | — | Distance tapped pie slice pops out |
| SliceCornerRadius | Float | 0 | — | Rounded corner radius for pie/polar slices in dips |
| SliceGradient | Boolean | False | — | — |
| SliceSpace | Float | 2 | — | — |
| TransparentCircleAlpha | Int | 105 | 0 to 255 | — |
| TransparentCircleColor | Color | 0 | — | — |
| TransparentCircleRadius | Float | 61 | — | — |
| UsePercentValues | Boolean | False | — | Pie values render as percentages of total |
| UseValueColorForLine | Boolean | False | — | — |
| ValueLineColor | Color | 0 | — | — |
| ValueLinePart1Length | Float | 0.3 | — | — |
| ValueLinePart1OffsetPercentage | Float | 75 | — | — |
| ValueLinePart2Length | Float | 0.4 | — | — |
| ValueLineVariableLength | Boolean | True | — | — |
| ValueLineWidth | Float | 1 | — | — |
| XValuePosition | Int | 0 | 0 / 1 | 0=Inside slice, 1=Outside with leader line |
| YValuePosition | Int | 0 | 0 / 1 | 0=Inside slice, 1=Outside with leader line |

## Scatter and bubble

| Property | Type | Default | Values / range | Description |
|---|---|---:|---|---|
| NormalizeBubbleSize | Boolean | True | — | — |
| ScatterHoleColor | Color | 0 | — | — |
| ScatterHoleRadius | Float | 0 | — | — |
| ScatterShape | Int | 1 | 0–6 | 0=Square, 1=Circle, 2=Triangle, 3=Cross, 4=X, 5=Chevron Up, 6=Chevron Down |
| ScatterShapeSize | Float | 8 | — | — |

## Radar and web

| Property | Type | Default | Values / range | Description |
|---|---|---:|---|---|
| DrawWebEnabled | Boolean | True | — | — |
| RadarCornerRadius | Float | 0 | — | — |
| RadarHaloAlpha | Int | 76 | 0 to 255 | — |
| RadarHaloFillColor | Color | 0 | — | — |
| RadarHaloInnerRadius | Float | 3 | — | — |
| RadarHaloOuterRadius | Float | 4 | — | — |
| RadarHaloStrokeColor | Color | 0 | — | — |
| RadarHaloStrokeWidth | Float | 2 | — | — |
| SkipWebLineCount | Int | 0 | — | — |
| WebAlpha | Int | 40 | 0 to 255 | — |
| WebColor | Color | 0 | — | — |
| WebColorInner | Color | 0 | — | 0 = mirror WebColor |
| WebLineWidth | Float | 1 | — | — |
| WebLineWidthInner | Float | -1 | — | -1 = mirror WebLineWidth |

## Radial and rings

| Property | Type | Default | Values / range | Description |
|---|---|---:|---|---|
| RadialDashed | Boolean | False | — | Dashes value arcs using RingDashLength/RingDashSpace; False=solid |
| RingCenterImageSize | Float | 64 | — | Center image size in hollow; 0=hide |
| RingDashLength | Float | 4 | — | Dash segment length; applies only when RadialDashed=True |
| RingDashSpace | Float | 4 | — | Gap between dashes; applies only when RadialDashed=True |
| RingEndLabels | Boolean | False | — | Draws name and value stacked top-left in series colors |
| RingGap | Float | 8 | — | Space between radial rings |
| RingGradient | Boolean | False | — | Fades each value arc from series color to lighter tint along sweep |
| RingLineCap | Int | 1 | 0 / 1 | 0=Butt, 1=Round; dashed arcs always use butt |
| RingWidth | Float | 16 | — | Stroke width of each radial ring |

## Candlestick

| Property | Type | Default | Values / range | Description |
|---|---|---:|---|---|
| CandleBarSpace | Float | 0.1 | — | — |
| CandleDecreasingColor | Color | 0 | — | 0=red |
| CandleIncreasingColor | Color | 0 | — | 0=green |
| CandleIncreasingFill | Boolean | False | — | — |
| CandleNeutralColor | Color | 0 | — | — |
| CandleShadowColor | Color | 0 | — | 0=same as candle |
| CandleShadowWidth | Float | 1.5 | — | — |
| ShowCandleBar | Boolean | True | — | False draws wicks only |

## Touch, zoom and animation

| Property | Type | Default | Values / range | Description |
|---|---|---:|---|---|
| AllowZoom | Boolean | True | — | — |
| Animate | Boolean | True | — | — |
| AnimateXYEnabled | Boolean | False | — | — |
| AnimationDuration | Int | 650 | — | — |
| AnimationEasing | Int | 5 | 0–27 | 5=EaseOutCubic default; 3=EaseInOutQuad; 23=EaseOutBack; 26=EaseOutBounce |
| AutoScaleMinMax | Boolean | False | — | Rescales Y to visible window while panning |
| DoubleTapZoom | Boolean | True | — | — |
| DragDecelerationEnabled | Boolean | True | — | Fling momentum after drag; False stops chart immediately |
| DragDecelerationFriction | Float | 0.9 | — | — |
| DragEnabled | Boolean | True | — | — |
| DragXEnabled | Boolean | True | — | — |
| DragYEnabled | Boolean | True | — | — |
| DrawMarkers | Boolean | True | — | — |
| HardwareAcceleration | Boolean | True | — | — |
| HighlightPerDrag | Boolean | True | — | — |
| Loading | Boolean | False | — | — |
| LoadingText | String | "" | — | — |
| MaxHighlightDistance | Float | 500 | — | — |
| MinOffset | Float | 0 | — | — |
| PillMarkerEnabled | Boolean | False | — | — |
| ScaleXEnabled | Boolean | True | — | — |
| ScaleYEnabled | Boolean | True | — | — |

## Highlight and selection

| Property | Type | Default | Values / range | Description |
|---|---|---:|---|---|
| DashedHighlightLine | Boolean | False | — | — |
| HighlightDataSetIndex | Int | 0 | — | — |
| HighlightIndex | Float | -1 | — | — |
| IgnoreZero | Boolean | False | — | When True, entries with value 0 are omitted |

## Limit lines and background layering

| Property | Type | Default | Values / range | Description |
|---|---|---:|---|---|
| DrawGridLinesBehindData | Boolean | True | — | — |
| DrawLimitLinesBehindData | Boolean | True | — | — |

## Designer preview

| Property | Type | Default | Values / range | Description |
|---|---|---:|---|---|
| SampleLabels | String | Jan,Feb,Mar,Apr | — | Designer preview data only |
| SampleValues | String | 10,25,18,40 | — | Designer preview data only |

## Constants

All numeric values below are handbook encodings. Use named constants in B4A source.

### Chart types
| Constant | Value |
|---|---:|
| CHART_LINE | 0 |
| CHART_COLUMN | 1 |
| CHART_BAR | 2 |
| CHART_PIE | 3 |
| CHART_SCATTER | 4 |
| CHART_BUBBLE | 5 |
| CHART_RADAR | 6 |
| CHART_COMBO | 7 |
| CHART_CANDLE | 8 |
| CHART_POLAR_AREA | 9 |
| CHART_RADIAL | 10 |

### Themes
| Constant | Value |
|---|---:|
| THEME_DEFAULT | 0 |
| THEME_NIGHTFALL | 1 |
| THEME_NIGHTFALL_DARK | 2 |
| THEME_MATERIAL | 3 |
| THEME_PASTEL | 4 |
| THEME_CYBERPUNK | 5 |
| THEME_LIBERTY | 6 |

### Other constants
| Group | Constant | Value |
|---|---|---:|
| Line mode | MODE_LINEAR | 0 |
| Line mode | MODE_STEPPED | 1 |
| Line mode | MODE_CUBIC_BEZIER | 2 |
| Line mode | MODE_HORIZONTAL_BEZIER | 3 |
| Scatter shape | SHAPE_SQUARE | 0 |
| Scatter shape | SHAPE_CIRCLE | 1 |
| Scatter shape | SHAPE_TRIANGLE | 2 |
| Scatter shape | SHAPE_CROSS | 3 |
| Scatter shape | SHAPE_X | 4 |
| Scatter shape | SHAPE_CHEVRON_UP | 5 |
| Scatter shape | SHAPE_CHEVRON_DOWN | 6 |
| Legend | LEGEND_AUTO | 0 |
| Legend | LEGEND_SHOW | 1 |
| Legend | LEGEND_HIDE | 2 |
| Legend position | LEGEND_RIGHT | 0 |
| Legend position | LEGEND_LEFT | 1 |
| Legend position | LEGEND_BOTTOM | 2 |
| Legend position | LEGEND_TOP | 3 |
| Legend form | LEGEND_FORM_DEFAULT | 0 |
| Legend form | LEGEND_FORM_SQUARE | 1 |
| Legend form | LEGEND_FORM_CIRCLE | 2 |
| Legend form | LEGEND_FORM_LINE | 3 |
| Legend orientation | LEGEND_ORIENT_AUTO | 0 |
| Legend orientation | LEGEND_ORIENT_HORIZONTAL | 1 |
| Legend orientation | LEGEND_ORIENT_VERTICAL | 2 |
| Legend direction | LEGEND_DIR_AUTO | 0 |
| Legend direction | LEGEND_DIR_LEFT_TO_RIGHT | 1 |
| Legend direction | LEGEND_DIR_RIGHT_TO_LEFT | 2 |
| Title alignment | TITLE_ALIGN_LEFT | 0 |
| Title alignment | TITLE_ALIGN_CENTER | 1 |
| Title alignment | TITLE_ALIGN_RIGHT | 2 |
| Y title | YTITLE_TOP | 0 |
| Y title | YTITLE_LEFT | 1 |
| Y title | YTITLE_RIGHT | 2 |
| X axis | XAXIS_BOTTOM | 0 |
| X axis | XAXIS_TOP | 1 |
| X axis | XAXIS_BOTH_SIDED | 2 |
| X axis | XAXIS_TOP_INSIDE | 3 |
| X axis | XAXIS_BOTTOM_INSIDE | 4 |
| Y label | YLABEL_OUTSIDE | 0 |
| Y label | YLABEL_INSIDE | 1 |
| Value position | VALUE_POS_INSIDE | 0 |
| Value position | VALUE_POS_OUTSIDE | 1 |
| Value alignment | VALUE_ALIGN_LEFT | 0 |
| Value alignment | VALUE_ALIGN_CENTER | 1 |
| Value alignment | VALUE_ALIGN_RIGHT | 2 |
| Bar corner | BAR_CORNER_ALL | 0 |
| Bar corner | BAR_CORNER_TIP | 1 |
| Ring cap | RING_CAP_BUTT | 0 |
| Ring cap | RING_CAP_ROUND | 1 |

### Animation easing
| Constant | Value |
|---|---:|
| EASING_LINEAR | 0 |
| EASING_EASE_IN_QUAD | 1 |
| EASING_EASE_OUT_QUAD | 2 |
| EASING_EASE_IN_OUT_QUAD | 3 |
| EASING_EASE_IN_CUBIC | 4 |
| EASING_EASE_OUT_CUBIC | 5 |
| EASING_EASE_IN_OUT_CUBIC | 6 |
| EASING_EASE_IN_QUART | 7 |
| EASING_EASE_OUT_QUART | 8 |
| EASING_EASE_IN_OUT_QUART | 9 |
| EASING_EASE_IN_SINE | 10 |
| EASING_EASE_OUT_SINE | 11 |
| EASING_EASE_IN_OUT_SINE | 12 |
| EASING_EASE_IN_EXPO | 13 |
| EASING_EASE_OUT_EXPO | 14 |
| EASING_EASE_IN_OUT_EXPO | 15 |
| EASING_EASE_IN_CIRC | 16 |
| EASING_EASE_OUT_CIRC | 17 |
| EASING_EASE_IN_OUT_CIRC | 18 |
| EASING_EASE_IN_ELASTIC | 19 |
| EASING_EASE_OUT_ELASTIC | 20 |
| EASING_EASE_IN_OUT_ELASTIC | 21 |
| EASING_EASE_IN_BACK | 22 |
| EASING_EASE_OUT_BACK | 23 |
| EASING_EASE_IN_OUT_BACK | 24 |
| EASING_EASE_IN_BOUNCE | 25 |
| EASING_EASE_OUT_BOUNCE | 26 |
| EASING_EASE_IN_OUT_BOUNCE | 27 |

### Gestures
| Constant | Value |
|---|---:|
| GESTURE_NONE | 0 |
| GESTURE_DRAG | 1 |
| GESTURE_X_ZOOM | 2 |
| GESTURE_Y_ZOOM | 3 |
| GESTURE_PINCH_ZOOM | 4 |
| GESTURE_ROTATE | 5 |
| GESTURE_SINGLE_TAP | 6 |
| GESTURE_DOUBLE_TAP | 7 |
| GESTURE_LONG_PRESS | 8 |
| GESTURE_FLING | 9 |

## Events

Declare optional handlers as `Sub Chart_<EventName>` in the Activity. The handbook lists these signatures.

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

## Version gates listed in Appendix A

| Feature | Available from | Earlier-version alternative |
|---|---|---|
| CHART_RADIAL, CHART_POLAR_AREA | v10.0 | Not available |
| CHART_COMBO | v10.2 | Draw separate charts |
| SetViewPortOffsets | v10.10 | Use ExtraTopOffset |
| AnimateDataChange | v10.10 | SetData |
| VisibleYRangeMin / VisibleYRangeMax | v10.12 | SetVisibleYRange per render |
| RingEndLabels, RingCenterImage | v10.10 | CenterText only |
| PillShape, StackGap | v10.10 | BarCornerRadius with a large value |
| HighlightIndex (programmatic) | v10.12 | Touch only |

## Important interpretation notes

- `LegendEnabled` is an integer mode, not Boolean: Auto, Show, Hide. Auto hides the legend for one series and for all radial charts.
- `AxisMinimum` and `AxisMaximum` default to broad sentinel values. Leave automatic scaling unless fixed bounds are analytically required.
- `SampleLabels` and `SampleValues` are Designer preview values; they do not populate runtime chart data.
- The handbook's chart type/property values are not permission to pass numeric magic values in code. Prefer named constants.
- The handbook notes `GetNativeChart` as an escape hatch for MPAndroidChart capabilities not wrapped by SithasoMPACharts. Prefer wrapper APIs for normal work; native escape-hatch code needs separate verification and maintenance consideration.
