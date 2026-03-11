# Legal Contract Analysis & IR Generation

Deterministic pipeline for converting legal contracts to structured intermediate representation (IR) with artifact selection.

## Architecture

```
PDF/Text → Analysis → Normative IR  → Artifact Selection → LAML Generation
           (LLM)      (Structured)    (Deterministic)      (Templates)
```

## Project Structure

```
Classification/
├── src/
│   ├── analysis/        # Legal document text analysis
│   ├── ir/              # Normative IR generation
│   ├── selector/        # Deterministic artifact selector
│   └── validation/      # Schema validation (future)
├── config/
│   ├── legal_registry.json  # Legal knowledge base
│   └── ir_schema.json       # IR schema
├── scripts/
│   └── full_pipeline.py     # CLI wrapper
├── deprecated/              # Old versions
└── downloads/              # Test data
```

## Installation

```bash
pip install -r requirements.txt
```

## Usage

### Full Pipeline (Recommended)

```bash
python3 scripts/full_pipeline.py path/to/contract.txt
```

### Python API

```python
from src.analysis.legal_document import analyze_document
from src.ir.generator import convert_to_normative_ir
from src.selector.artifact_selector import ArtifactSelector

# 1. Analyze contract
basic_analysis = analyze_document("contract.txt")

# 2. Generate IR
with open("contract.txt") as f:
    text = f.read()
ir = convert_to_normative_ir(basic_analysis, text)

# 3. Select artifacts
selector = ArtifactSelector("config/legal_registry.json")
result = selector.select_artifacts(ir)

print(result["institution"])  # ArrendamientoHabitacional
print(result["templates"])    # [FianzaSolidariaTemplate, ...]
print(result["principles"])   # [PactaSuntServanda, ...]
```

## Components

### 1. Analysis (`src/analysis/`)
- Text extraction from PDFs/DOCXs
- Behavior detection using legal keywords
- Subject/role identification

### 2. IR Generation (`src/ir/`)
- Semantic role extraction (arrendador, arrendatario)
- Explicit object binding (inmueble, renta_mensual)
- Fact/norm separation
- CNF clause generation with deontic modalities

### 3. Artifact Selection (`src/selector/`)
- **Deterministic**: No LLM, no heuristics
- Registry-based matching
- Selects: institution, templates, principles

### 4. Registry (`config/legal_registry.json`)
- Pre-defined legal knowledge
- Institutions (contract types)
- Templates (reusable patterns)
- Principles (legal doctrines)

## Output Format

The IR follows a layered normative architecture:

```json
{
  "source": {...},
  "metadata": {...},
  "roles": {"arrendador": "Person", ...},
  "objects": {"inmueble": {...}, ...},
  "behaviors": {"b_1": {...}, ...},
  "facts": [{...}],
  "principal_contract": {
    "normative_clauses": [{...}],
    "templates": [{...}]
  },
  "institution": "ArrendamientoHabitacional",
  "principles": ["PactaSuntServanda", ...]
}
```

## Key Features

✅ **Architecturally sound**: Proper fact/norm separation
✅ **Semantic precision**: Named roles and objects
✅ **Deterministic selection**: No AI hallucination
✅ **Modular**: Easy to extend and reuse
✅ **Traceable**: Every decision is auditable

## Documentation

- [`implementation_plan.md`](.gemini/antigravity/brain/.../implementation_plan.md) - Project reorganization plan
- [`selector_documentation.md`](.gemini/antigravity/brain/.../selector_documentation.md) - Artifact selector details

## License

[Your License]
