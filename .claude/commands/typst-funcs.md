Read the specified functions in the given file. Think hard about each function. Create a Typst file with landscape layout where each function gets its own page with a 2-column grid: left column contains the function name as heading and numbered main steps/function calls; right column contains the 5-dimension analysis in a bordered block. Use these styles: font "Linux Biolinum", 2cm margins, 10pt text, 2em enum spacing, 40pt gutter between columns. Escape underscores in identifier names with `\_` (Typst uses `_` for subscripts).

For each function's right column, analyze and write a concise note for each of these 5 dimensions:
1. Caller context & role in control flow
2. Component ownership & data flow
3. Key subroutines called
4. Threading & synchronization
5. Algorithmic details & tradeoffs

## Arguments
- `functions`: Comma-separated list of function names to document
- `file`: Source file containing the functions
- `output`: Output Typst filename

## Example

```
/typst-funcs functions: Prepare, Run, Install file: db/compaction/compaction_job.cc output: compaction.typ
```
