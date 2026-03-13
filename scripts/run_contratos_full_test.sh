#!/bin/bash
# Full pipeline for Contratos: txt → LLM extraction → IR → DSL → report
#
# Usage:
#   ./scripts/run_contratos_full_test.sh              # All contracts (slow, uses API)
#   ./scripts/run_contratos_full_test.sh 10          # First 10 contracts
#   ./scripts/run_contratos_full_test.sh 10 --debug  # With debug output per file
#
# Requires ANTHROPIC_API_KEY (or OPENROUTER_API_KEY with --openrouter) in .env

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

ARGS=("--path" "Contratos")
[[ -n "$LIMIT" ]] && ARGS+=("--limit" "$LIMIT")
ARGS+=("${EXTRA[@]}")

echo "=== Full Contratos pipeline (txt → IR → DSL)${LIMIT:+ — first $LIMIT files} ==="
echo ""

# Step 1: LLM extraction (txt → _ir.json)
echo "[1/2] LLM extraction..."
python scripts/batch_ir_agent.py "${ARGS[@]}" || { echo "IR extraction failed"; exit 1; }
echo ""

# Step 2: IR → DSL + report (skip --openrouter, agent-only)
DSL_EXTRA=()
for x in "${EXTRA[@]}"; do [[ "$x" != "--openrouter" ]] && DSL_EXTRA+=("$x"); done
echo "[2/2] IR → DSL..."
python scripts/batch_ir_to_dsl.py --path Contratos --report test_results/contratos_report.json ${LIMIT:+--limit "$LIMIT"} "${DSL_EXTRA[@]}"
echo ""
echo "Report: test_results/contratos_report.json"
echo "Summary: jq '.summary' test_results/contratos_report.json"
