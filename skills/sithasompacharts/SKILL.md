---
name: sithasompacharts
description: Build, style, modify and troubleshoot native Android charts in B4A with SithasoMPACharts. Select chart types, reuse the 127 real demo examples, apply themes, implement interactions and production dashboards, and verify APIs against the installed library.
---

# SithasoMPACharts coding skill

Use this skill whenever a task involves the SithasoMPACharts B4A library.

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

## Mode dispatch

Select the mode that matches the user's actual task. A task may pass through more than one mode.

- **Chart Architect:** use when the user is planning a new chart, dashboard, report or visualization and needs help deciding what to show and how. Follow [Chart Architect](references/modes/chart-architect.md). Produce a chart specification before implementation when the analytical design is non-trivial.
- **B4A Chart Developer:** use when the user asks for B4A code, a new chart, a modification or integration. Follow [B4A Chart Developer](references/modes/b4a-chart-developer.md). Inspect the exact example module and verify wrapper calls before coding.
- **Chart Auditor:** use when the user asks to debug, review, optimize or validate existing code or a chart. Follow [Chart Auditor](references/modes/chart-auditor.md). Separate confirmed defects from risks and unverified assumptions.

For a full dashboard request, Architect → Developer → Auditor is the preferred sequence. Do not force the user through all three stages for a small, straightforward task.

## Mandatory workflow

1. Establish the user's analytical purpose, data shape, series count, X-axis meaning (category, time, or numeric), units, sign conventions, point count and interaction needs.
2. Select a chart family using references/chart-selection.md.
3. Find the closest numbered example in references/example-index.md.
4. Fetch and read that exact .bas module before coding. The gallery title is a locator, not proof of implementation details.
5. Verify every method, property, constant and event against the target XML or a working module. Do not invent wrapper APIs from MPAndroidChart Java APIs.
6. Adapt the smallest working example. Remove demo navigation, title labels, previous/next controls and sample UI chrome unless requested.
7. Validate labels, values, order, units, missing data, signs, dataset identity, stacking and axis assignment.
8. State the source example and assumptions. Clearly mark unverified combinations. Never claim compilation or device testing unless performed.

## Core DataSet recipe

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
- Batch setup/data with BeginUpdate and EndUpdate. Use Refresh when changing properties outside a batch if the source recipe requires it.
- Use named constants, not numeric enum values.
- Preserve negative values and decimals. Do not take absolute values to force a chart to render.
- Keep category labels aligned with each dataset's values. For scatter/bubble, preserve numeric X/Y coordinates instead of pretending they are category positions.
- Preserve specialized argument order: scatter (X,Y); bubble (X,Y,Size); candlestick (High,Low,Open,Close); stacked data uses stack arrays.
- Multi-series, combo and dual-axis charts require explicit dataset identity and axis semantics. Inspect their examples.
- Theme galleries demonstrate combinations, not universal compatibility of every property with every chart type.
- Designer SampleLabels / SampleValues are preview data, not runtime population.
- Log Chart.GetVersion before diagnosing version-sensitive behavior.
- For minified release builds, include the repository's ProGuard/R8 rules and test the minified artifact.

## Reference map

- Chart selection: references/chart-selection.md
- 127 example index: references/example-index.md
- Verified API patterns: references/verified-api-patterns.md
- Handbook API catalog: references/handbook-api-catalog.md — constants, 11 events, designer-property inventory and version gates
- Production workflows: references/production-workflows.md
- Troubleshooting: references/troubleshooting.md
- Chart Architect mode: references/modes/chart-architect.md
- B4A Chart Developer mode: references/modes/b4a-chart-developer.md
- Chart Auditor mode: references/modes/chart-auditor.md
- Charting-skills research: references/charting-skills-research.md — external skill patterns worth adopting
- Evaluation cases: evals/evals.json — regression prompts for chart choice, API correctness, analytical integrity and lifecycle safety

## Response format when generating code

Identify the example module used, explain what was adapted, and say where each block belongs (Globals, Activity_Create, event sub, timer, or reusable routine). Include only relevant dependencies. Distinguish directly verified wrapper calls from inferred compositions.
