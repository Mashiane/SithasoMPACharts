# Research note: charting and mobile-development agent skills

**Research date:** 21 November 2026  
**Purpose:** Identify existing AI coding skills that can inform SithasoMPACharts skill design. This is a small targeted scan, not an exhaustive census of GitHub.

## Findings

### 1. Dedicated cross-platform charting skill — strongest direct comparison

**mthines/agent-skills — `skills/design/charting/SKILL.md`**  
https://github.com/mthines/agent-skills/tree/main/skills/design/charting

This is the closest match to a charting-focused agent skill discovered in the scan. It covers React/Next.js and Expo/React Native and separates the workflow into:
- discover visualization intent, data shape, audience and platform constraints;
- select a chart type;
- select a library for the platform and dataset size;
- apply accessibility and anti-pattern guardrails;
- load specialized guidance on demand for gestures, performance, annotations, theming, geo, formatting, server rendering, state and testing.

Its mobile library decision table recommends Victory Native XL for performance/animation, react-native-gifted-charts for polished defaults, and chart-kit or SVG for simple metrics. These recommendations are specific to its React Native stack and should not be transplanted into B4A.

### 2. Flutter agent-skill collection

**ariaramin/flutter-skills**  
https://github.com/ariaramin/flutter-skills

The repository describes 72 skill folders for Flutter/Dart coding agents, with a consistent folder structure: a `SKILL.md` manifest, supporting references, occasional examples and evaluations. It explicitly documents installation for Codex, Cursor, Claude Code, GitHub Copilot, Gemini CLI, OpenCode and others.

Relevance: good model for packaging and progressive disclosure. It demonstrates that a library-specific skill should have a small trigger/entry point and move detailed, version-sensitive knowledge into references.

### 3. Swift Charts specialist coverage inside a larger iOS skill ecosystem

**tucarmd/claude-code-skills**  
https://github.com/tucarmd/claude-code-skills

The repository lists a `swift-charts` skill covering bar, line, area, pie, donut and 3D charts, plus scrolling, selection and annotations. It is part of a larger collection of Swift/iOS framework skills.

Relevance: platform-native charting skills can be narrow and framework-specific while remaining part of a larger mobile engineering skill family.

### 4. General mobile-development skill

**magnus919/agent-skills — mobile-development**  
https://github.com/magnus919/agent-skills/tree/main/mobile-development

This is a cross-platform mobile lifecycle skill spanning native iOS, Android, Flutter and React Native. It routes to platform references for scaffold/build/sign/test/ship, lifecycle, background execution, offline and sync.

Relevance: chart rendering is only one concern in a production mobile app. The SithasoMPACharts skill should stay focused on chart implementation but include lifecycle and device validation where they affect chart correctness.

### 5. React Native design skill

**brunoviews/agent-skills**  
https://github.com/brunoviews/agent-skills

This collection includes React Native/mobile design guidance, install instructions and scripts/references. It is more UI-design-oriented than chart-library-specific.

Relevance: visual polish, spacing, typography, touch targets and design-system consistency deserve their own checklist, distinct from chart data and wrapper API knowledge.

## What should be adopted for SithasoMPACharts

The strongest transferable practices are:

1. **Intent-first chart selection:** choose chart family based on analytical task and data shape, not visual preference.
2. **Data-shape discovery:** category/time/numeric X, measures, series count, units, cardinality, missing values and expected point count.
3. **Mobile interaction discipline:** touch target sizing, gesture conflicts with parent scroll views, selection feedback, pinch/drag behavior and accessibility alternatives.
4. **Performance budgets:** benchmark realistic point counts on real devices; consider downsampling, batching, update frequency, redraw costs and lifecycle cleanup.
5. **Accessibility:** never rely on color alone; provide meaningful titles/units, contrast, selection feedback and a textual/table alternative for critical data.
6. **Localization:** currency/number formatting, date/time zones, decimal separators, RTL and long translated labels.
7. **Progressive disclosure:** keep `SKILL.md` as a concise router; load detailed references only when relevant.
8. **Evaluations:** create task prompts with expected chart choice, expected source module, required API calls and failure checks.

## What not to copy

- Do not copy React Native, Expo, SwiftUI or Flutter APIs into B4A examples.
- Do not copy library recommendations as if they were applicable to SithasoMPACharts.
- Do not enforce generic chart rules without context. For example, a strict pie-slice cap can be a useful review heuristic but must be framed as a guideline, not a wrapper constraint.
- Do not let broad visualization advice override the installed SithasoMPACharts XML and working B4A source.

## Sources

- mthines charting skill: https://github.com/mthines/agent-skills/blob/main/skills/design/charting/SKILL.md
- Flutter skills repository: https://github.com/ariaramin/flutter-skills
- Swift/iOS skills repository: https://github.com/tucarmd/claude-code-skills
- Mobile development skill: https://github.com/magnus919/agent-skills/tree/main/mobile-development
- React Native skills repository: https://github.com/brunoviews/agent-skills
