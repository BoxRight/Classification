#!/usr/bin/env python3
"""
Analyze IR concept reuse across generated IR files.

Finds the most frequently used parties, objects, acts, facts, norms, and rules
to investigate modularity and identify reusable patterns.
"""

import json
import sys
from collections import Counter, defaultdict
from pathlib import Path

PROJECT_ROOT = Path(__file__).resolve().parent.parent


def load_ir(path: Path) -> dict | None:
    """Load and parse an IR JSON file."""
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except Exception:
        return None


def extract_act_signature(act: dict) -> str:
    """Canonical signature for an act: actor→object→target."""
    a = act.get("actor", "")
    o = act.get("object") or ""
    t = act.get("target") or ""
    return f"{a}→{o}→{t}"


def extract_condition_signature(cond: dict) -> str:
    """Canonical signature for a rule condition."""
    if isinstance(cond, dict):
        t = cond.get("type", "?")
        n = cond.get("name", "")
        return f"{t}:{n}" if n else t
    return str(cond)[:50]


def extract_consequence_signature(cons: dict) -> str:
    """Canonical signature for a rule consequence."""
    if isinstance(cons, dict):
        m = cons.get("modality", "?")
        act = cons.get("act", {})
        if isinstance(act, dict):
            sig = extract_act_signature(act)
            return f"{m}({sig})"
        return m
    return str(cons)[:50]


def analyze_irs(root: Path) -> dict:
    """Aggregate concept counts across all IR files."""
    ir_files = sorted(root.rglob("*_ir.json"))
    n_files = len(ir_files)

    party_ids = Counter()
    party_subtypes = Counter()
    object_ids = Counter()
    object_types = Counter()
    fact_types = Counter()
    fact_names = Counter()
    norm_modalities = Counter()
    act_signatures = Counter()
    rule_condition_types = Counter()
    rule_consequence_modalities = Counter()
    authority_types = Counter()

    # Per-document sets for overlap analysis
    doc_party_sets: list[set[str]] = []
    doc_object_sets: list[set[str]] = []
    doc_fact_names: list[set[str]] = []

    for path in ir_files:
        ir = load_ir(path)
        if not ir:
            continue

        authority_types[ir.get("authority", "?")] += 1

        for p in ir.get("parties", []):
            if isinstance(p, dict):
                pid = p.get("id", "")
                if pid:
                    party_ids[pid] += 1
                    party_subtypes[p.get("subtype", "?")] += 1

        parties_this_doc = {p.get("id") for p in ir.get("parties", []) if isinstance(p, dict) and p.get("id")}
        doc_party_sets.append(parties_this_doc)

        for o in ir.get("objects", []):
            if isinstance(o, dict):
                oid = o.get("id", "")
                otype = o.get("type", "?")
                if oid:
                    object_ids[oid] += 1
                object_types[otype] += 1

        objects_this_doc = {o.get("id") for o in ir.get("objects", []) if isinstance(o, dict) and o.get("id")}
        doc_object_sets.append(objects_this_doc)

        for f in ir.get("facts", []):
            if isinstance(f, dict):
                fact_types[f.get("type", "?")] += 1
                fname = f.get("name", "")
                if fname:
                    fact_names[fname] += 1

        facts_this_doc = {f.get("name") for f in ir.get("facts", []) if isinstance(f, dict) and f.get("name")}
        doc_fact_names.append(facts_this_doc)

        for n in ir.get("norms", []):
            if isinstance(n, dict):
                norm_modalities[n.get("modality", "?")] += 1
                act = n.get("act")
                if isinstance(act, dict):
                    act_signatures[extract_act_signature(act)] += 1

        for a in ir.get("acts", []):
            if isinstance(a, dict):
                act_signatures[extract_act_signature(a)] += 1

        for r in ir.get("rules", []):
            if isinstance(r, dict):
                for c in r.get("conditions", []):
                    rule_condition_types[extract_condition_signature(c)] += 1
                cons = r.get("consequence", {})
                if cons:
                    rule_consequence_modalities[extract_consequence_signature(cons)] += 1

    # Cross-document overlap: concepts appearing in N+ documents
    def overlap_count(sets: list[set], min_docs: int = 2) -> list[tuple[str, int]]:
        concept_doc_count: dict[str, int] = defaultdict(int)
        for s in sets:
            for x in s:
                if x:
                    concept_doc_count[x] += 1
        return [(k, v) for k, v in concept_doc_count.items() if v >= min_docs]

    party_overlap = sorted(overlap_count(doc_party_sets), key=lambda x: -x[1])
    object_overlap = sorted(overlap_count(doc_object_sets), key=lambda x: -x[1])
    fact_overlap = sorted(overlap_count(doc_fact_names), key=lambda x: -x[1])

    return {
        "n_files": n_files,
        "authority": dict(authority_types.most_common()),
        "parties": {
            "by_id": party_ids.most_common(50),
            "by_subtype": dict(party_subtypes),
            "overlap": party_overlap[:30],
        },
        "objects": {
            "by_id": object_ids.most_common(50),
            "by_type": dict(object_types),
            "overlap": object_overlap[:30],
        },
        "facts": {
            "by_type": dict(fact_types),
            "by_name": fact_names.most_common(50),
            "overlap": fact_overlap[:30],
        },
        "norms": {
            "by_modality": dict(norm_modalities),
        },
        "acts": {
            "signatures": act_signatures.most_common(50),
        },
        "rules": {
            "condition_types": rule_condition_types.most_common(30),
            "consequence_patterns": rule_consequence_modalities.most_common(30),
        },
    }


def report_markdown(data: dict) -> str:
    """Format analysis as Markdown."""
    lines = [
        "# IR Concept Reuse Analysis",
        "",
        f"**Files analyzed:** {data['n_files']}",
        "",
        "## Authority",
        "",
        "| Authority | Count |",
        "|-----------|-------|",
    ]
    for k, v in data["authority"].items():
        lines.append(f"| {k} | {v} |")

    lines.extend([
        "",
        "## Parties (most reused)",
        "",
        "| ID | Count |",
        "|----|-------|",
    ])
    for pid, cnt in data["parties"]["by_id"][:25]:
        lines.append(f"| `{pid}` | {cnt} |")

    lines.extend([
        "",
        "### Party overlap (in 2+ documents)",
        "",
        "| Party ID | Documents |",
        "|----------|-----------|",
    ])
    for pid, cnt in data["parties"]["overlap"][:15]:
        lines.append(f"| `{pid}` | {cnt} |")

    lines.extend([
        "",
        "## Objects (most reused)",
        "",
        "| ID | Count | Type |",
        "|----|-------|------|",
    ])
    # Re-fetch type for top objects if needed - we don't have it in by_id, so just show id and count
    for oid, cnt in data["objects"]["by_id"][:25]:
        lines.append(f"| `{oid}` | {cnt} | - |")

    lines.extend([
        "",
        "### Object types",
        "",
        "| Type | Count |",
        "|------|-------|",
    ])
    for t, c in data["objects"]["by_type"].items():
        lines.append(f"| {t} | {c} |")

    lines.extend([
        "",
        "### Object overlap (in 2+ documents)",
        "",
        "| Object ID | Documents |",
        "|-----------|-----------|",
    ])
    for oid, cnt in data["objects"]["overlap"][:15]:
        lines.append(f"| `{oid}` | {cnt} |")

    lines.extend([
        "",
        "## Facts (most reused names)",
        "",
        "| Name | Count |",
        "|------|-------|",
    ])
    for name, cnt in data["facts"]["by_name"][:25]:
        lines.append(f"| `{name}` | {cnt} |")

    lines.extend([
        "",
        "### Fact overlap (in 2+ documents)",
        "",
        "| Fact Name | Documents |",
        "|-----------|-----------|",
    ])
    for name, cnt in data["facts"]["overlap"][:15]:
        lines.append(f"| `{name}` | {cnt} |")

    lines.extend([
        "",
        "## Norm modalities",
        "",
        "| Modality | Count |",
        "|----------|-------|",
    ])
    for m, c in data["norms"]["by_modality"].items():
        lines.append(f"| {m} | {c} |")

    lines.extend([
        "",
        "## Act signatures (most common)",
        "",
        "| Actor→Object→Target | Count |",
        "|---------------------|-------|",
    ])
    for sig, cnt in data["acts"]["signatures"][:25]:
        lines.append(f"| `{sig}` | {cnt} |")

    lines.extend([
        "",
        "## Rule condition patterns",
        "",
        "| Condition | Count |",
        "|-----------|-------|",
    ])
    for c, cnt in data["rules"]["condition_types"][:20]:
        lines.append(f"| `{c}` | {cnt} |")

    lines.extend([
        "",
        "## Rule consequence patterns",
        "",
        "| Consequence | Count |",
        "|-------------|-------|",
    ])
    for c, cnt in data["rules"]["consequence_patterns"][:20]:
        lines.append(f"| `{c}` | {cnt} |")

    return "\n".join(lines)


def main():
    import argparse
    parser = argparse.ArgumentParser(description="Analyze IR concept reuse")
    parser.add_argument("--downloads", default=str(PROJECT_ROOT / "downloads"), help="Root with IR files")
    parser.add_argument("--output", "-o", help="Write report to file (default: stdout)")
    parser.add_argument("--json", action="store_true", help="Output raw JSON instead of Markdown")
    args = parser.parse_args()

    root = Path(args.downloads).resolve()
    if not root.exists():
        print(f"Error: {root} not found", file=sys.stderr)
        return 1

    data = analyze_irs(root)
    if args.json:
        out = json.dumps(data, indent=2, ensure_ascii=False)
    else:
        out = report_markdown(data)

    if args.output:
        Path(args.output).write_text(out, encoding="utf-8")
        print(f"Wrote {args.output}")
    else:
        print(out)

    return 0


if __name__ == "__main__":
    sys.exit(main())
