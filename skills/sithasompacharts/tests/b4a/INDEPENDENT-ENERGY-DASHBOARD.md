# Independent B4A challenge: Renewable Energy Dashboard

## Purpose

This is a practical capability test for the SithasoMPACharts coding-agent skill. The challenge asks an agent to create a complete multi-chart B4A screen from a product requirement, without using any numbered demo module as the implementation template.

It is deliberately a dashboard rather than a single chart. It tests multiple chart instances, data modelling, layout, styling, chart-family selection, API verification and mobile scrolling.

## Challenge prompt

Give this prompt to the candidate AI coding agent with the complete SithasoMPACharts skill installed:

> Build a complete native Android B4A screen called Renewable Energy Dashboard using SithasoMPACharts.
>
> The screen must be designed phone-first and contain three charts in a vertically scrolling dashboard:
>
> 1. Monthly generation trend: 12 months, with separate Solar and Wind datasets. Use MWh.
> 2. Generation by source: annual totals for Solar, Wind, Hydro and Biomass. Choose a suitable chart for comparing the four categories.
> 3. Daily generation versus consumption: seven days, with two separate datasets. Use MWh.
>
> Use realistic sample data, clear titles and axis labels, a consistent professional theme, readable spacing, and a layout that works on a narrow portrait phone. Use three independent SithasoMPACharts instances. Keep chart configuration and data population separated into reusable subs. The parent must scroll vertically without chart gestures preventing the scroll.
>
> Do not copy or adapt any numbered demo module as the implementation base. You may inspect the installed XML, handbook, API references and demos only to verify exact wrapper APIs or understand a particular property. State when an example is consulted only as API evidence.
>
> Deliver a complete B4A project/module, not pseudocode. Include project dependencies, code placement, data assumptions and a verification ledger for every nontrivial wrapper member. Do not invent wrapper calls. If the installed XML is not available, mark API verification limits clearly.
>
> Before declaring completion, audit dataset/label alignment, series identity, units, chart selection, view ownership, layout dimensions and lifecycle. Report source inspection, API verification, compilation, rendering and runtime validation as separate statuses. Do not claim compilation or device testing unless actually performed.

## Expected deliverable

- A B4A 14.x project that opens in the IDE.
- Three independently initialized chart instances.
- A phone-first vertically scrollable layout.
- Three chart builders with distinct data and chart semantics.
- A documented API verification ledger.
- No dependency on the numbered demo Activity or its navigation controls.

## Reference implementation

`IndependentEnergyDashboard.b4a` is a first-pass reference implementation created from the challenge requirements and the documented DataSet/dashboard patterns. It uses:
- `CHART_LINE` for the two time-series comparisons.
- `CHART_COLUMN` for the category comparison.
- `BeginUpdate / AddDataSet / AddLabels / AddValues / EndUpdate` for data population.
- Three chart objects hosted in one B4A ScrollView panel.
- Nightfall theme and dashboard styling patterns documented in handbook Chapter 11.

The implementation does not copy a numbered demo module. It does use general dashboard and DataSet recipes from the handbook, which are valid API evidence rather than demo-module adaptation.

## API evidence and limitations

The following patterns are documented in the supplied v10.19 handbook:
- Chapter 11, pages 255–256: multiple chart instances, ScrollView dashboard layout, chart initialization, `DisableScroll`, `AllowZoom`, theme, background, corner radius, elevation, header padding and legend placement.
- Chapter 11, pages 257–258: `BeginUpdate/EndUpdate`, `AddDataSet`, `AddLabels`, `AddValues`, chart titles/subtitles, theme config, column width and axis minimum.
- Chapter 2 / Section 7: the DataSet model and category/value alignment.
- Repository README: `mpChartLib` and `kotlin-stdlib-2.0.21` dependencies.

The installed XML file was not available in the current test workspace at the time this reference implementation was authored. The handbook/repository are therefore the API evidence used here; confirm the exact members against the XML installed with the user's library before treating the API ledger as fully verified.

## Manual test procedure

1. Open `IndependentEnergyDashboard.b4a` in B4A 14.20 (64-bit).
2. Ensure SithasoMPACharts is checked in the Libraries tab.
3. Ensure `mpChartLib.jar` and `kotlin-stdlib-2.0.21.jar` are available in Additional Libraries.
4. Compile and run on a physical Android device or emulator.
5. Confirm all three charts render and their titles, labels, values and legends are readable.
6. Scroll from top to bottom. Confirm chart gestures do not block vertical dashboard scrolling.
7. Rotate only if the project is later configured to support landscape.
8. Inspect LogCat and record any errors.
9. If release readiness is being evaluated, add the repository's ProGuard/R8 rules and test a minified release build.

## Acceptance checklist

- [ ] Project opens in B4A 14.20 (64-bit).
- [ ] Debug compilation succeeds.
- [ ] All three chart instances render.
- [ ] Monthly chart has 12 labels and two 12-value datasets.
- [ ] Source chart has four labels and four corresponding values.
- [ ] Daily chart has seven labels and two seven-value datasets.
- [ ] Units are consistent and visible.
- [ ] Dashboard scrolls vertically on a phone.
- [ ] No duplicate chart initialization or parent attachment.
- [ ] No LogCat exceptions during normal use.
- [ ] Release/minified build succeeds if release readiness is in scope.

## Test record

| Field | Result |
|---|---|
| B4A version | 14.20 (64-bit) — target |
| SithasoMPACharts version | Not yet recorded |
| Android version/device | Not yet recorded |
| Installed XML checked | Not yet checked in this test workspace |
| Compile result | Not run |
| Runtime rendering | Not run |
| Scroll interaction | Not run |
| LogCat | Not run |
| Release/minified build | Not run |
