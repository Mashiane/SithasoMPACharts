---
name: sithasompacharts
description: Build, style, modify and troubleshoot native Android charts in B4A with SithasoMPACharts. Design and create new charts independently from requirements, use the 127 demos as optional API evidence, implement interactions and production dashboards, and verify APIs against the installed library.
---

# SithasoMPACharts coding skill

Use this skill whenever a task involves the SithasoMPACharts B4A library.

## Core objective

Enable an agent to work as a competent SithasoMPACharts developer—not merely an assistant that adapts the supplied demos. A new chart must be designable and implementable from requirements even when no matching example exists.

The 127 demo modules are valuable reference implementations and API evidence. They are optional learning material, not a prerequisite or implementation template for independent chart creation.

## Source of truth

- Repository: https://github.com/Mashiane/SithasoMPACharts
- Demo gallery and registration order: demo/SithasoMPAChartsDemo.b4a
- Working example modules: demo/frmExample001.bas–demo/frmExample127.bas
- Challenges: demo/frmChallenge01.bas–demo/frmChallenge06.bas
- Handbook target: v10.19, B4A 12+, MPAndroidChart 4.0.1
- Current integration instructions: repository README.md and the installed SithasoMPACharts.xml

Authority order for exact implementation:
1. Target installation's XML/API descriptor and matching wrapper source.
2. Working B4A example module.
3. Handbook API reference and recipes.
4. README overview.

The handbook is specifically versioned for v10.19. Check Chart.GetVersion and the installed XML before using version-sensitive properties. Do not assume the current installation matches the book.

## Guided workflow

For substantial chart creation tasks, follow the six stages in [Independent chart construction methodology](references/chart-construction-methodology.md):

1. **Environment and project setup:** inspect B4A/library versions, installed XML, dependencies, project structure and view ownership.
2. **Requirements and rules:** extract analytical purpose, data semantics, series, units, volume, interactions, lifecycle and UI states.
3. **Chart design and architecture:** choose the chart family, axes, datasets, formatting, interactions and mobile layout.
4. **Implementation architecture:** plan B4A object ownership, data flow, initialization, events, updates and lifecycle.
5. **Wrapper API and syntax verification:** verify each member's exact signature, type, version gate and wrapper exposure.
6. **Quality inspection and validation:** inspect source, compile, render and exercise runtime/lifecycle behavior when tools are available.

Small tasks may combine stages, but must not skip API verification or make unsupported testing claims.

## Mode dispatch

Select the mode that matches the user's actual task. A task may pass through more than one mode.

- **Chart Architect:** use when planning a new chart, dashboard, report or visualization. Follow [Chart Architect](references/modes/chart-architect.md). Produce a chart specification before implementation when analytical design is non-trivial.
- **B4A Chart Developer:** use when producing B4A code, a new chart, modification or integration. Follow [B4A Chart Developer](references/modes/b4a-chart-developer.md) and the construction methodology. New chart creation does not require a matching demo.
- **Chart Auditor:** use when debugging, reviewing, optimizing or validating code/chart output. Follow [Chart Auditor](references/modes/chart-auditor.md). Separate confirmed defects from risks and unverified assumptions.

For a substantial dashboard, Architect → Developer → Auditor is the preferred sequence. Do not force the user through all three stages for a small, straightforward task.

## Mandatory implementation workflow

1. Establish analytical purpose, data shape, series count, X-axis semantics (category, time or numeric), units, sign conventions, volume and interaction needs.
2. Select a chart family using references/chart-selection.md.
3. Decide whether a demo is needed. For independent creation, do not search for or require a matching demo as the code template. A demo may be inspected only to verify a specific wrapper pattern.
4. Plan the chart from first principles using references/chart-construction-methodology.md.
5. Verify every method, property, constant and event against the target XML or other authoritative evidence. Do not invent wrapper APIs from MPAndroidChart Java APIs. Distinguish ClearValues (clear dataset values in-place), ClearData (remove labels and series), and ResetProperties (restore designer-default visual/behavioral properties and clear custom limit lines/data) when present in the target XML.
6. Implement the smallest maintainable solution that satisfies the specification. Remove demo navigation and sample UI chrome unless requested.
7. Validate labels, values, order, units, missing data, signs, dataset identity, stacking and axis assignment.
8. Inspect the result and report exactly what was source-checked, compiled, rendered and runtime-tested. Clearly mark assumptions and unverified combinations.

## Core DataSet recipe

This verified basic pattern is a starting point, not a substitute for checking the target installation:

```basic
Sub Globals
    Private Chart As SithasoMPACharts
End Sub

Sub Activity_Create(FirstTime As Boolean)
    Chart.Initialize("Chart")
    Activity.AddView(Chart, 0, 0, 100%x, 300dip)

    Chart.BeginUpdate
    Chart.Title = "Monthly Visitors"
    Chart.ShowTitle = True
    Chart.ChartType = Chart.CHART_LINE
    Chart.XTitle = "Month"
    Chart.YTitle = "Visitors"
    Chart.LegendEnabled = Chart.LEGEND_AUTO

    Dim DS As Int = Chart.AddDataSet("Visitors", 0)
    Chart.AddValues(DS, Array As Double(12, 19, 15, 28, 24, 35))
    Chart.AddLabels(Array As String("Jan", "Feb", "Mar", "Apr", "May", "Jun"))
    Chart.EndUpdate
End Sub
```

For Visual Designer placement, add the view in the Designer and declare the generated member; do not also initialize/add a second programmatic view unless intentionally creating another chart.

## Non-negotiable rules

- Use the B4A wrapper, not raw MPAndroidChart Java, for normal chart work.
- The wrapper is a stable host view. Changing ChartType swaps its inner chart. Do not call GetView or RemoveView to switch chart types.
- Batch setup/data with BeginUpdate and EndUpdate when supported by the target wrapper and verified usage pattern.
- Use named constants, not numeric enum values.
- Preserve negative values and decimals. Do not take absolute values to force a chart to render.
- Keep category labels aligned with each dataset's values. For scatter/bubble, preserve numeric X/Y coordinates instead of pretending they are category positions.
- Preserve specialized argument order: scatter (X,Y); bubble (X,Y,Size); candlestick (High,Low,Open,Close); stacked data uses stack arrays.
- Multi-series, combo and dual-axis charts require explicit dataset identity and axis semantics.
- Theme galleries demonstrate combinations, not universal compatibility of every property with every chart type.
- Designer SampleLabels / SampleValues are preview data, not runtime population.
- Log Chart.GetVersion before diagnosing version-sensitive behavior.
- For minified release builds, include the repository's ProGuard/R8 rules and test the minified artifact.

## Reference map

- Chart selection: references/chart-selection.md
- Independent chart construction methodology: references/chart-construction-methodology.md
- 127 example index (optional reference evidence): references/example-index.md
- Verified API patterns: references/verified-api-patterns.md
- Complete Designer API dictionary: references/complete-api-dictionary.md
- Handbook API catalog: references/handbook-api-catalog.md
- Production workflows: references/production-workflows.md
- Troubleshooting: references/troubleshooting.md
- Chart Architect mode: references/modes/chart-architect.md
- B4A Chart Developer mode: references/modes/b4a-chart-developer.md
- Chart Auditor mode: references/modes/chart-auditor.md
- Charting-skills research: references/charting-skills-research.md
- Regression evaluations: evals/evals.json (12 cases)
- Regression evaluation procedure: evals/README.md
- Independent chart-creation evaluations: evals/independent-chart-creation.json (12 prompts that prohibit demo-based implementation)
- Independent evaluation procedure: evals/independent-chart-creation-README.md
- Independent evaluation schema: evals/independent-chart-creation.schema.json
- B4A smoke-test project: tests/b4a/ChartSmokeTests.b4a
- B4A smoke-test execution matrix: tests/b4a/TEST-PLAN.md

## Response format when generating code

For independent chart creation, identify the chart specification and data assumptions, explain the B4A object/data architecture, and say where each block belongs (Globals, Activity_Create, event sub, timer or reusable routine). List the wrapper members verified and their evidence. Examples are optional and, if consulted, state whether they were used only as API evidence. Include relevant dependencies. Distinguish source inspection, API verification, compilation, rendering and runtime validation; never claim a higher validation level than actually performed.
