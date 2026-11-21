# Troubleshooting checklist

1. Log `Chart.GetVersion` and confirm it matches the version targeted by the code/handbook.
2. Recheck the current repository README for the correct JAR/XML files and `#AdditionalJar` declarations.
3. Confirm the view is initialized and added to the parent exactly once (unless intentionally using multiple chart views).
4. Confirm configuration/data calls are bracketed by `BeginUpdate` and `EndUpdate`.
5. Validate labels and values: same category cardinality, correct ordering, numeric types and missing-value policy.
6. Check whether the chart expects category-indexed values or explicit numeric coordinates.
7. For stacked/combo/dual-axis charts, compare dataset registration order, stack order, draw order and axis assignment against the closest module.
8. For a blank chart, inspect the no-data behavior in example 051 and compare whether the dataset was actually populated.
9. For radial charts, verify the chosen chart type and ring/range/angle configuration against examples 109–119.
10. For release-only failures, apply the supplied ProGuard/R8 rules and test a minified build.
11. Do not call an unavailable property a library defect until checking the installed XML/API descriptor and version gates.

## Evidence boundaries

The handbook targets v10.19 / B4A 12+ / MPAndroidChart 4.0.1. The demo registration order maps the 127 gallery labels to numbered modules. The source audit inspected examples 001–054, specialized examples 109–127, challenges 01–06, and representative theme modules; not every theme module was individually audited. No compilation/runtime validation is implied by this skill.