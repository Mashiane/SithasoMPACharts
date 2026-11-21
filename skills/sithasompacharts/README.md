# SithasoMPACharts skill for coding agents

This folder contains an agent skill for building B4A charts with SithasoMPACharts.

## Install

Copy the entire skills/sithasompacharts directory into the skills directory recognized by your coding agent. The skill entry point is SKILL.md; keep the references and evals folders beside it.

## Operating modes

- **Chart Architect:** translates a business question and data shape into an analytical chart specification.
- **B4A Chart Developer:** implements the specification using verified SithasoMPACharts wrapper APIs and real B4A examples.
- **Chart Auditor:** checks API use, data integrity, analytical validity, mobile UX, lifecycle and performance.

For a substantial dashboard, the preferred flow is Architect → Developer → Auditor. Small changes do not need all three modes.

## What the skill teaches

- Choosing chart types based on the question and data shape.
- Locating and reusing the 127 B4A demo modules.
- Following the wrapper's DataSet API and update lifecycle.
- Applying themes, axes, radial gauges, animation and touch interactions.
- Building dashboards and mapping API/JSON data into datasets.
- Checking version gates, dependencies and release packaging.
- Auditing misleading visualizations, lifecycle risks and mobile chart usability.

## Source/version scope

The handbook supplied with the repository targets SithasoMPACharts v10.19, B4A 12+ and MPAndroidChart 4.0.1. Always verify the installed library XML and Chart.GetVersion before using version-specific APIs.

The evaluation file contains regression prompts and expected behaviors. It is a manual/agent evaluation specification, not evidence that automated tests or B4A builds have passed.

The skill does not claim that its examples have been compiled as part of this documentation publication.
