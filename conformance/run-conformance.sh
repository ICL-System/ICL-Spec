#!/usr/bin/env bash
# =============================================================================
# ICL Conformance Test Runner
# =============================================================================
# Cross-implementation test runner for the ICL conformance suite.
# Any spec-compliant implementation can use this script by providing
# two commands: one for validation and one for normalization.
#
# Usage:
#   ./run-conformance.sh <validate-cmd> <normalize-cmd> [options]
#
# Examples:
#   # Rust reference implementation
#   ./run-conformance.sh "icl-cli validate" "icl-cli normalize"
#
#   # Python binding
#   ./run-conformance.sh "icl-py validate" "icl-py normalize"
#
#   # Custom implementation
#   ./run-conformance.sh "./my-impl --validate" "./my-impl --normalize"
#
# Options:
#   --determinism-iters N   Number of determinism iterations (default: 100)
#   --skip-determinism      Skip determinism tests
#   --skip-normalization    Skip normalization tests
#   --verbose               Print details for each test
#   --suite-dir DIR         Path to conformance/ directory (default: auto-detect)
#
# Exit codes:
#   0 — All tests passed
#   1 — One or more tests failed
#   2 — Usage error
# =============================================================================

set -euo pipefail

# --- Defaults ---
DETERMINISM_ITERS=100
SKIP_DETERMINISM=false
SKIP_NORMALIZATION=false
VERBOSE=false
SUITE_DIR=""

# --- Colors ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# --- Parse arguments ---
if [ $# -lt 2 ]; then
  echo "Usage: $0 <validate-cmd> <normalize-cmd> [options]"
  echo ""
  echo "  validate-cmd   Command that validates an ICL file (exit 0 = valid, non-zero = invalid)"
  echo "  normalize-cmd  Command that normalizes an ICL file (prints canonical form to stdout)"
  echo ""
  echo "Options:"
  echo "  --determinism-iters N   Determinism iterations (default: 100)"
  echo "  --skip-determinism      Skip determinism tests"
  echo "  --skip-normalization    Skip normalization tests"
  echo "  --verbose               Verbose output"
  echo "  --suite-dir DIR         Path to conformance/ directory"
  exit 2
fi

VALIDATE_CMD="$1"
NORMALIZE_CMD="$2"
shift 2

while [ $# -gt 0 ]; do
  case "$1" in
    --determinism-iters)
      DETERMINISM_ITERS="$2"
      shift 2
      ;;
    --skip-determinism)
      SKIP_DETERMINISM=true
      shift
      ;;
    --skip-normalization)
      SKIP_NORMALIZATION=true
      shift
      ;;
    --verbose)
      VERBOSE=true
      shift
      ;;
    --suite-dir)
      SUITE_DIR="$2"
      shift 2
      ;;
    *)
      echo "Unknown option: $1"
      exit 2
      ;;
  esac
done

# --- Auto-detect suite directory ---
if [ -z "$SUITE_DIR" ]; then
  SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
  if [ -d "$SCRIPT_DIR/valid" ] && [ -d "$SCRIPT_DIR/invalid" ]; then
    SUITE_DIR="$SCRIPT_DIR"
  elif [ -d "$SCRIPT_DIR/conformance/valid" ]; then
    SUITE_DIR="$SCRIPT_DIR/conformance"
  else
    echo "Error: Cannot find conformance suite. Use --suite-dir to specify."
    exit 2
  fi
fi

VERSION=$(cat "$SUITE_DIR/VERSION" 2>/dev/null || echo "unknown")
echo -e "${BLUE}═══════════════════════════════════════════════════${NC}"
echo -e "${BLUE}  ICL Conformance Test Runner v${VERSION}${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════${NC}"
echo ""
echo "  Validate command:  $VALIDATE_CMD"
echo "  Normalize command: $NORMALIZE_CMD"
echo "  Determinism iters: $DETERMINISM_ITERS"
echo ""

TOTAL_PASS=0
TOTAL_FAIL=0
TOTAL_SKIP=0

# =============================================================================
# Section 1: Valid Contracts
# =============================================================================
echo -e "${BLUE}── Valid Contracts ──────────────────────────────────${NC}"
valid_pass=0
valid_fail=0

for f in "$SUITE_DIR"/valid/*.icl; do
  [ -f "$f" ] || continue
  name=$(basename "$f")
  if $VALIDATE_CMD "$f" > /dev/null 2>&1; then
    valid_pass=$((valid_pass + 1))
    $VERBOSE && echo -e "  ${GREEN}✓${NC} $name"
  else
    valid_fail=$((valid_fail + 1))
    echo -e "  ${RED}✗${NC} $name — expected VALID but got error"
  fi
done

echo -e "  Result: ${GREEN}${valid_pass} passed${NC}, ${RED}${valid_fail} failed${NC}"
TOTAL_PASS=$((TOTAL_PASS + valid_pass))
TOTAL_FAIL=$((TOTAL_FAIL + valid_fail))
echo ""

# =============================================================================
# Section 2: Invalid Contracts
# =============================================================================
echo -e "${BLUE}── Invalid Contracts ───────────────────────────────${NC}"
invalid_pass=0
invalid_fail=0

for f in "$SUITE_DIR"/invalid/*.icl; do
  [ -f "$f" ] || continue
  name=$(basename "$f")
  if $VALIDATE_CMD "$f" > /dev/null 2>&1; then
    invalid_fail=$((invalid_fail + 1))
    echo -e "  ${RED}✗${NC} $name — expected INVALID but parsed successfully"
  else
    invalid_pass=$((invalid_pass + 1))
    $VERBOSE && echo -e "  ${GREEN}✓${NC} $name"
  fi
done

echo -e "  Result: ${GREEN}${invalid_pass} passed${NC}, ${RED}${invalid_fail} failed${NC}"
TOTAL_PASS=$((TOTAL_PASS + invalid_pass))
TOTAL_FAIL=$((TOTAL_FAIL + invalid_fail))
echo ""

# =============================================================================
# Section 3: Normalization Pairs
# =============================================================================
if [ "$SKIP_NORMALIZATION" = true ]; then
  echo -e "${YELLOW}── Normalization (SKIPPED) ─────────────────────────${NC}"
  norm_count=$(find "$SUITE_DIR/normalization" -name "*.input.icl" 2>/dev/null | wc -l)
  TOTAL_SKIP=$((TOTAL_SKIP + norm_count))
  echo ""
else
  echo -e "${BLUE}── Normalization Pairs ─────────────────────────────${NC}"
  norm_pass=0
  norm_fail=0

  for input in "$SUITE_DIR"/normalization/*.input.icl; do
    [ -f "$input" ] || continue
    expected="${input%.input.icl}.expected.icl"
    name=$(basename "$input" .input.icl)

    if [ ! -f "$expected" ]; then
      norm_fail=$((norm_fail + 1))
      echo -e "  ${RED}✗${NC} $name — missing expected file"
      continue
    fi

    actual=$($NORMALIZE_CMD "$input" 2>/dev/null) || true
    stored=$(cat "$expected")

    if [ "$actual" = "$stored" ]; then
      norm_pass=$((norm_pass + 1))
      $VERBOSE && echo -e "  ${GREEN}✓${NC} $name"
    else
      norm_fail=$((norm_fail + 1))
      echo -e "  ${RED}✗${NC} $name — normalized output differs from expected"
      if $VERBOSE; then
        echo "    --- Expected (first 5 lines) ---"
        echo "$stored" | head -5 | sed 's/^/    /'
        echo "    --- Actual (first 5 lines) ---"
        echo "$actual" | head -5 | sed 's/^/    /'
      fi
    fi
  done

  echo -e "  Result: ${GREEN}${norm_pass} passed${NC}, ${RED}${norm_fail} failed${NC}"
  TOTAL_PASS=$((TOTAL_PASS + norm_pass))
  TOTAL_FAIL=$((TOTAL_FAIL + norm_fail))
  echo ""
fi

# =============================================================================
# Section 4: Determinism Proof
# =============================================================================
if [ "$SKIP_DETERMINISM" = true ]; then
  echo -e "${YELLOW}── Determinism (SKIPPED) ───────────────────────────${NC}"
  echo ""
else
  echo -e "${BLUE}── Determinism Proof (${DETERMINISM_ITERS} iterations) ─────────────${NC}"
  det_pass=0
  det_fail=0

  # Use a subset of valid contracts for determinism testing
  det_files=()
  for f in "$SUITE_DIR"/valid/*.icl; do
    [ -f "$f" ] && det_files+=("$f")
  done

  # Also include normalization inputs
  for f in "$SUITE_DIR"/normalization/*.input.icl; do
    [ -f "$f" ] && det_files+=("$f")
  done

  for f in "${det_files[@]}"; do
    name=$(basename "$f")

    # Get reference normalization
    reference=$($NORMALIZE_CMD "$f" 2>/dev/null) || {
      det_fail=$((det_fail + 1))
      echo -e "  ${RED}✗${NC} $name — normalization failed"
      continue
    }

    ref_hash=$(echo "$reference" | sha256sum | cut -d' ' -f1)
    identical=true

    for i in $(seq 2 "$DETERMINISM_ITERS"); do
      current=$($NORMALIZE_CMD "$f" 2>/dev/null) || {
        identical=false
        break
      }
      cur_hash=$(echo "$current" | sha256sum | cut -d' ' -f1)
      if [ "$cur_hash" != "$ref_hash" ]; then
        identical=false
        echo -e "  ${RED}✗${NC} $name — diverged at iteration $i"
        break
      fi
    done

    if $identical; then
      det_pass=$((det_pass + 1))
      $VERBOSE && echo -e "  ${GREEN}✓${NC} $name (${DETERMINISM_ITERS} iterations identical)"
    else
      det_fail=$((det_fail + 1))
    fi
  done

  echo -e "  Result: ${GREEN}${det_pass} passed${NC}, ${RED}${det_fail} failed${NC}"
  TOTAL_PASS=$((TOTAL_PASS + det_pass))
  TOTAL_FAIL=$((TOTAL_FAIL + det_fail))
  echo ""
fi

# =============================================================================
# Summary
# =============================================================================
echo -e "${BLUE}═══════════════════════════════════════════════════${NC}"
total=$((TOTAL_PASS + TOTAL_FAIL + TOTAL_SKIP))
if [ "$TOTAL_FAIL" -eq 0 ]; then
  echo -e "  ${GREEN}ALL TESTS PASSED${NC}: $TOTAL_PASS passed, $TOTAL_SKIP skipped (of $total)"
  echo -e "${BLUE}═══════════════════════════════════════════════════${NC}"
  exit 0
else
  echo -e "  ${RED}FAILURES DETECTED${NC}: $TOTAL_PASS passed, $TOTAL_FAIL failed, $TOTAL_SKIP skipped (of $total)"
  echo -e "${BLUE}═══════════════════════════════════════════════════${NC}"
  exit 1
fi
