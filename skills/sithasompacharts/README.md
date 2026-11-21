# SithasoMPACharts skill for coding agents

This folder contains a source-grounded agent skill for designing, creating, styling, modifying and auditing native Android charts in B4A with SithasoMPACharts.

## Core objective

The skill is designed to let an AI agent create working chart implementations from a developer's requirements—even when no matching demo exists. The demos are optional reference implementations and API evidence, not mandatory templates.

## Install

Copy the entire skills/sithasompacharts directory into the skills directory recognized by your coding agent. The skill entry point is SKILL.md; keep the references and evals folders beside it.

## Guided development workflow

For substantial chart tasks, the skill follows six ordered stages:

1. **Environment and project setup** — inspect B4A/library versions, installed XML, dependencies and project structure.
2. **Requirements and rules** — understand the viewer's question, data semantics, units, series, scale, interactions and lifecycle.
3. **Chart design and analytical architecture** — choose chart family, axes, datasets, formatting and mobile layout.
4. **Implementation architecture** — plan B4A view ownership, data flow, initialization, callbacks, updates and cleanup.
5. **Wrapper API and syntax verification** — verify exact signatures and version support; never infer B4A APIs from MPAndroidChart Java APIs.
6. **Quality inspection and validation** — inspect code and, when available, compile, render and exercise runtime behavior.

See references/chart-construction-methodology.md for the full procedure and reusable specification/API-verification templates.

## Operating modes

- **Chart Architect:** translates a business question and data shape into an analytical chart specification.
- **B4A Chart Developer:** implements the specification from first principles using verified wrapper APIs. Existing demos are optional evidence, not a required starting point.
- **Chart Auditor:** checks API use, data integrity, analytical validity, mobile UX, lifecycle and performance.

For a substantial dashboard, the preferred flow is Architect → Developer → Auditor. Small changes do not need all three modes.

## What the skill teaches

- Creating charts independently from natural-language requirements.
- Choosing chart types based on analytical purpose and data shape.
- Using the 127 B4A demo modules as optional reference material.
- Following the wrapper's DataSet API and update lifecycle.
- Applying themes, axes, radial gauges, animation and touch interactions.
- Building dashboards and mapping API/JSON data into datasets.
- Checking version gates, dependencies and release packaging.
- Auditing misleading visualizations, lifecycle risks and mobile chart usability.

## Evaluation

Two separate behavioral suites are provided:

- evals/evals.json — 12 regression cases for chart choice, API correctness, analytical integrity and lifecycle safety.
- evals/independent-chart-creation.json — 12 independent creation prompts that prohibit using numbered demos as implementation templates.

Both are evaluation specifications, not evidence that a model passed. Their procedures and scoring rubrics are documented beside each suite. B4A compilation and device testing must be recorded separately.

## Source/version scope

The handbook supplied with the repository targets SithasoMPACharts v10.19, B4A 12+ and MPAndroidChart 4.0.1. Always verify the installed library XML and Chart.GetVersion before using version-specific APIs.

The skill does not claim that its examples have been compiled as part of this documentation publication.
