# Independent chart-creation evaluations

## Purpose

This suite measures whether an agent can design and implement new SithasoMPACharts visualizations from requirements without using a numbered demo as its implementation template.

The 12 prompts cover basic and advanced chart families, analytical integrity, realtime updates and a multi-chart dashboard. They deliberately test chart creation rather than example lookup or reproduction.

The suite is a behavioral evaluation specification. It does not execute prompts, compile B4A code or prove that any agent passed.

## Run procedure

1. Start a fresh session with the candidate agent.
2. Expose the complete skill package and a fixed repository revision.
3. Provide the target B4A version and installed SithasoMPACharts XML when testing API correctness. If the XML is unavailable, record that limitation.
4. Submit each prompt exactly as written in independent-chart-creation.json.
5. Preserve the complete response, generated code and source/tool evidence.
6. Score each expected behavior independently.
7. Where feasible, place generated code in a clean B4A test project and compile/run it. Record compiler, Android version, device/emulator and library version.
8. Do not let a human silently repair generated code before scoring the agent's original result.

## Scoring

Score every expected behavior:
- **1 — Pass:** explicitly satisfied and supported by evidence.
- **0 — Fail:** omitted, contradicted or asserted without evidence.
- **N/A — Not applicable:** only when genuinely irrelevant; explain why.

Report both:
- **Reasoning/API score:** expected behaviors satisfied from the response and source evidence.
- **Execution score:** compilation, rendering and runtime checks actually completed.

A case passes only when all required reasoning/API behaviors pass. Execution status must be reported separately; unavailable B4A tooling is a blocked execution test, not an automatic pass.

## Critical failures

Mark a critical failure if the agent:
- Uses a numbered demo as the implementation base despite the independence policy.
- Invents a wrapper API and presents it as verified.
- Treats raw MPAndroidChart Java APIs as automatically exposed by the B4A wrapper.
- Loses or misorders scatter/bubble coordinates or candlestick OHLC values.
- Silently changes units, signs, missing values or aggregation semantics.
- Produces an unbounded realtime data/timer design.
- Claims code compiled, rendered or was device-tested without evidence.

## Report template

| Field | Value |
|---|---|
| Skill revision | |
| Agent/model and version | |
| B4A version | |
| SithasoMPACharts version | |
| Installed XML supplied | Yes / No |
| Repository revision | |
| Case ID | |
| Reasoning/API score | |
| Compile result | Pass / Fail / Not run |
| Runtime rendering | Pass / Fail / Not run |
| Lifecycle checks | Pass / Fail / Not run |
| Critical failure | Yes / No |
| Evidence | |
| Notes | |

## Improvement loop

For each failure, identify whether the cause is missing API evidence, weak methodology, ambiguous prompt requirements, model limitations or unavailable tools. Update the narrowest relevant methodology/reference, add a regression case where appropriate, and rerun the failed case plus adjacent cases. Never report the suite as passed until actual runs are recorded.
