#!/bin/bash
# Run IR→DSL pipeline on Contratos folder and write a report.
#
# Usage:
#   ./scripts/run_contratos_test.sh              # All 154 contracts
#   ./scripts/run_contratos_test.sh 20           # First 20 contracts (quick test)
#   ./scripts/run_contratos_test.sh 20 --debug   # With debug output per file
#
# Report: test_results/contratos_report.json

set -e
cd "$(dirname "$0")/.."

LIMIT=""
EXTRA=()
for arg in "$@"; do
    if [[ "$arg" =~ ^[0-9]+$ ]]; then
        LIMIT="$arg"
    else
        EXTRA+=("$arg")
    fi
done

ARGS=("--path" "Contratos" "--report" "test_results/contratos_report.json")
[[ -n "$LIMIT" ]] && ARGS+=("--limit" "$LIMIT")
ARGS+=("${EXTRA[@]}")

echo "=== Contratos test${LIMIT:+ (first $LIMIT files)} ==="
echo ""
python scripts/batch_ir_to_dsl.py "${ARGS[@]}"
echo ""
echo "Report: test_results/contratos_report.json"
echo "Summary: jq '.summary' test_results/contratos_report.json"
