#!/usr/bin/env python3
"""Verify Designer property coverage in SithasoMPACharts.java.

Usage:
    python test_designer_preview_mapping.py path/to/SithasoMPACharts.java
"""
from pathlib import Path
import re
import sys

if len(sys.argv) != 2:
    raise SystemExit("Usage: python test_designer_preview_mapping.py path/to/SithasoMPACharts.java")

source = Path(sys.argv[1]).read_text(encoding="utf-8")
annotation_block = source[source.index("@DesignerProperties"):source.index("public class SithasoMPACharts")]
keys = re.findall(r'@Property\(key\s*=\s*"([^"]+)"', annotation_block)
assert len(keys) == 229, f"Expected 229 Designer keys, found {len(keys)}"
assert len(set(keys)) == len(keys), "Duplicate Designer property keys found"

start = source.index("static Spec fromProps(HashMap<String, Object> props)")
end = source.index("/** The comma separated labels", start)
method = source[start:end]
missing = [key for key in keys if f'"{key}"' not in method]
assert not missing, f"Static Designer preview does not consume: {missing}"

regression_keys = """AllowZoom BarCornerRadius CircleRadius DragEnabled DrawCirclesEnabled DrawEntryLabels DrawWebEnabled EntryLabelColor FillAlpha FillColor GridColor HoleRadius LabelCount LegendFontSize LegendFormSize LegendTextColor LineMode LineWidth NormalizeBubbleSize ScatterShape ScatterShapeSize ShowRightAxis SliceSpace TitleColor TransparentCircleRadius ValueFontSize ValueTextColor WebColor WebLineWidth XAxisPosition""".split()
missing_regressions = [key for key in regression_keys if f'"{key}"' not in method]
assert not missing_regressions, f"Regression keys missing: {missing_regressions}"

print(f"PASS: {len(keys)}/{len(keys)} Designer properties are consumed by Spec.fromProps.")
print(f"PASS: all {len(regression_keys)} previously omitted properties are mapped.")
