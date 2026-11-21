# Running the SithasoMPACharts skill evaluations

## Purpose

The cases in `evals.json` are behavioral regression prompts. They are designed to test whether an agent follows the skill's source-grounded workflow, not merely whether its answer sounds plausible.

The current set has 12 cases. The evaluation file is a specification; it does not itself execute prompts or prove that a model passed.

## Run procedure

For each case:

1. Start a fresh conversation/session with the candidate coding agent.
2. Install or expose the complete `skills/sithasompacharts` directory.
3. Submit the case's `prompt` exactly as written.
4. Preserve the full response and any source/tool evidence.
5. Score every item in that case's `expected` list.
6. Record any unsupported API claim, incorrect example reference, omitted caveat or false testing claim.

Use the same model, skill version, repository revision and tool access when comparing runs. If the agent has repository browsing disabled, record that as a test condition rather than silently treating it as equivalent.

## Scoring

Score each expected behavior independently:

- **1 — Pass:** explicitly satisfied and factually supported.
- **0 — Fail:** omitted, contradicted, or asserted without the required evidence.
- **N/A — Not applicable:** only when the expected behavior is genuinely irrelevant to the prompt; explain why.

A case passes only when every required behavior scores 1. Do not award partial credit for confident wording.

## Critical failure flags

Regardless of the numeric score, mark the run as a critical failure if the agent:

- Invents a SithasoMPACharts wrapper method/property/constant and presents it as verified.
- Confuses raw MPAndroidChart Java APIs with the B4A wrapper surface.
- Reorders candlestick values or loses numeric scatter/bubble coordinates.
- Silently converts missing data to zero or changes negative values to positive.
- Claims that code compiled, ran, or was device-tested when it was not.
- Recommends unbounded realtime accumulation or leaves a known timer/listener lifecycle leak unaddressed.

## Suggested report format

| Field | Value |
|---|---|
| Skill revision | Git commit SHA |
| Agent/model | Exact name and version |
| Repository access | Yes / No |
| Installed XML available | Yes / No |
| B4A compile available | Yes / No |
| Case ID | — |
| Score | Passed / total |
| Critical failure | Yes / No |
| Evidence | Response excerpt, source file, or tool trace |
| Notes | Missing behavior and recommended skill correction |

## Coverage map

| Evaluation case | Primary mode | Main competency |
|---|---|---|
| line-trend | Developer | Basic line chart and example reuse |
| dual-axis | Architect + Developer | Units, dual-axis trade-offs and mapping |
| realtime-lifecycle | Developer + Auditor | Bounded updates and lifecycle |
| ohlc-order | Developer | Candlestick argument order |
| radial-version | Developer | Version gates and radial API |
| bad-api-invention | Developer + Auditor | Wrapper/engine boundary |
| chart-selection | Architect | Category comparison and label density |
| architect-dual-units | Architect | Specification for unlike measures |
| analytical-integrity | Architect + Auditor | Pie-chart overload and denominator semantics |
| mobile-layout | Architect | Phone viewport and time-label density |
| designer-duplicate | Developer + Auditor | Designer/programmatic view lifecycle |
| audit-confidence | Auditor | Evidence, confidence and limitations |

## Improvement loop

When a case fails:

1. Determine whether the failure is caused by missing source material, ambiguous skill instructions, a weak evaluation prompt, or model/tool limitations.
2. Fix the narrowest relevant reference or workflow.
3. Add a regression case if the failure represents a new failure mode.
4. Re-run the failed case and nearby cases.
5. Record the revision and outcome. Do not describe a skill update as validated until the affected evaluations have actually been rerun.
