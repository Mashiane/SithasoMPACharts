# v10.19 Designer preview mapping fix

This directory contains an apply-ready source patch for the static B4A Visual Designer preview path.

## Apply

From the directory containing the original `SithasoMPACharts.java`:

```bash
patch -p1 < Spec-fromProps-preview-fix-v10.19.patch
```

The patch adds the 30 Designer property values that were declared and applied at runtime but were not copied into `Spec.fromProps`.

## Verify source coverage

Run the regression check against the patched Java source:

```bash
python test_designer_preview_mapping.py /path/to/SithasoMPACharts.java
```

Expected output:

```text
PASS: 229/229 Designer properties are consumed by Spec.fromProps.
PASS: all 30 previously omitted properties are mapped.
```

This is a static source check. It does not replace Java compilation, rebuilding the B4A library/XML/JAR, Visual Designer inspection, or Android runtime testing.

## Files

- `Spec-fromProps-preview-fix-v10.19.patch` — source patch.
- `test_designer_preview_mapping.py` — regression test.
