#!/bin/bash
# Run the full pipeline for a single file: txt -> IR (agent) -> DSL
#
# Usage:
#   ./scripts/run_single_file.sh "Contratos/Arrendamiento/Contrato de Arrendamiento/TMX_2432814_es.txt"
#
# Path is relative to downloads/. Requires ANTHROPIC_API_KEY in .env for step 1.

set -e
cd "$(dirname "$0")/.."

FILE="${1:?Usage: $0 <path-to-txt-file relative to downloads/>}"

# Strip downloads/ prefix if user passed it
FILE="${FILE#downloads/}"

IR_REL="${FILE%.txt}_ir.json"
DSL_REL="${FILE%.txt}.dsl"

echo "=== Single-file pipeline: $FILE ==="
echo ""

# Step 1: Extract IR (Anthropic agent)
echo "[1/2] Extracting IR..."
python scripts/batch_ir_agent.py --file "$FILE" || { echo "IR extraction failed (check ANTHROPIC_API_KEY)"; exit 1; }
echo "  -> downloads/$IR_REL"
echo ""

# Step 2: Render DSL
echo "[2/2] Rendering DSL..."
python scripts/batch_ir_to_dsl.py --file "$IR_REL"
echo "  -> dsl/dataset/$DSL_REL"
echo ""
echo "Done."
