# Chart selection framework

Choose a chart to answer a question, not because a chart looks attractive. First determine the data's semantic shape.

| Analytical question | Preferred chart family | Demo examples |
|---|---|---|
| How does a measure change over ordered periods? | Line | 001, 040, 044, 048 |
| How does a trend's magnitude fill an area? | Area / filled line | 002, 049, 050 |
| Compare values across categories | Column | 003, 015, 021 |
| Compare category values with long labels | Horizontal bar | 004, 017 |
| Show part-to-whole composition | Pie / donut | 005, 006, 121, 122 |
| Show radial category magnitude | Nightingale rose / polar area | 012, 013 |
| Show progress or a bounded single metric | Half-donut or radial gauge | 014, 109–119 |
| Show relationships between numeric variables | Scatter | 007, 023, 042 |
| Encode a third magnitude in point size | Bubble | 008, 063 |
| Compare multiple dimensions for entities | Radar | 009, 061, 127 |
| Show OHLC financial price movement | Candlestick | 010, 060, 126 |
| Combine measures with different visual encodings | Combo | 011, 062, 124 |
| Compare composition across categories | Stacked column/bar | 016–020 |

## Five questions before implementation

1. Is X a category, ordered time, or numeric coordinate?
2. Is the task comparison, trend, composition, distribution, relationship, progress, or OHLC?
3. How many series are present, and do they share units and scale?
4. Are negative values meaningful? Are values bounded (e.g. 0–100)?
5. Does the chart need selection, zoom, live updates, animation, or a dashboard layout?

## Avoid misleading choices

- Do not use pie/donut for many categories or close comparisons where precise ranking matters.
- Do not use stacked charts when the viewer must compare segment values across categories precisely.
- Do not use a dual Y-axis merely to make unrelated scales look correlated; explain both units.
- Do not use radar for precise value reading; use it for multivariate profiles.
- Do not use a line chart for unordered categories.
- Do not convert numeric scatter X coordinates into category labels unless the analytical meaning is categorical.

Once selected, inspect the matching module. This table is a routing aid, not an API specification.