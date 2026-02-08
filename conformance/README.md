# ICL Conformance Test Suite

**Version:** 0.1.0  
**Spec Version:** ICL Core Specification 0.1.0

## Overview

The ICL Conformance Suite verifies that an ICL implementation correctly parses, validates, normalizes, and deterministically processes ICL contracts according to the [ICL Core Specification](../spec/CORE-SPECIFICATION.md).

Any implementation claiming ICL conformance **must** pass all tests in this suite.

## Directory Structure

```
conformance/
├── VERSION                    # Suite version (semver, matches spec)
├── README.md                  # This file
├── run-conformance.sh         # Cross-implementation test runner
├── valid/                     # Contracts that MUST parse successfully
│   ├── minimal-contract.icl
│   ├── all-primitive-types.icl
│   └── ... (57 fixtures)
├── invalid/                   # Contracts that MUST fail to parse/validate
│   ├── missing-identity.icl
│   ├── confidence-out-of-range.icl
│   └── ... (55 fixtures)
└── normalization/             # Input→expected normalization pairs
    ├── sort-identity-fields.input.icl
    ├── sort-identity-fields.expected.icl
    └── ... (25 pairs)
```

## Test Categories

### Valid Contracts (`valid/`)

Each `.icl` file **must** parse and validate without errors. Covers:

- Minimal contracts (bare minimum required fields)
- All primitive types (`Integer`, `Float`, `String`, `Boolean`, `ISO8601`, `UUID`)
- Composite types (`Array<T>`, `Map<K,V>`, `Enum[...]`, nested objects)
- Multiple operations with full field sets
- Extensions blocks
- Edge cases (long strings, Unicode, deeply nested types)

### Invalid Contracts (`invalid/`)

Each `.icl` file **must** fail to parse or validate. Each file targets a specific error:

| Category | Count | Examples |
|----------|-------|---------|
| Missing required sections | 5 | `missing-purpose.icl`, `missing-hmc.icl` |
| Missing required fields | 8 | `missing-stable-id.icl`, `missing-narrative.icl` |
| Wrong types for fields | 8 | `version-string.icl`, `confidence-string.icl` |
| Value range errors | 5 | `confidence-negative.icl`, `version-negative.icl` |
| Syntax errors | 10 | `unterminated-string.icl`, `duplicate-section.icl` |
| Invalid type expressions | 5 | `unknown-type.icl`, `enum-empty.icl` |
| Invalid operations | 5 | `operation-missing-name.icl`, `operation-duplicate-name.icl` |
| Structural errors | 4 | `nested-contract.icl`, `section-inside-section.icl` |

Every file includes a 3-line header comment describing what it tests:

```
// Conformance: invalid/<filename>.icl
// Tests: <description of the error condition>
// Expected: MUST fail — <specific error type>
```

### Normalization Pairs (`normalization/`)

Each pair consists of:
- `<name>.input.icl` — A valid but non-canonical contract
- `<name>.expected.icl` — The exact canonical form after normalization

Your normalizer's output for the input file must **byte-for-byte match** the expected file.

Tests cover:
- Field ordering within each section (alphabetical)
- State field ordering
- String list sorting (trigger_types, permissions, commitments, etc.)
- Operation sorting by name
- Operation field and parameter ordering
- Enum variant sorting
- Nested object field sorting
- Whitespace normalization (2-space indent, trailing commas)
- Comment removal
- Combined normalizations (everything at once)
- Idempotence (already-canonical input)
- Extension namespace sorting

## Running the Tests

### Using the Test Runner

The included `run-conformance.sh` works with any implementation that provides:

1. **A validate command** — exits 0 for valid contracts, non-zero for invalid
2. **A normalize command** — prints canonical form to stdout

```bash
# Rust reference implementation
./run-conformance.sh "icl-cli validate" "icl-cli normalize"

# Python binding
./run-conformance.sh "python -m icl_runtime validate" "python -m icl_runtime normalize"

# JavaScript/WASM
./run-conformance.sh "npx icl-runtime validate" "npx icl-runtime normalize"

# Custom implementation
./run-conformance.sh "./my-impl validate" "./my-impl normalize"
```

#### Options

| Flag | Default | Description |
|------|---------|-------------|
| `--determinism-iters N` | 100 | Number of determinism iterations per contract |
| `--skip-determinism` | false | Skip determinism tests (faster for CI) |
| `--skip-normalization` | false | Skip normalization tests |
| `--verbose` | false | Print each test result |
| `--suite-dir DIR` | auto-detect | Path to `conformance/` directory |

### Manual Testing

```bash
# Validate a single contract
icl-cli validate conformance/valid/minimal-contract.icl

# Normalize a contract
icl-cli normalize conformance/normalization/sort-identity-fields.input.icl

# Compare normalization output
diff <(icl-cli normalize sort-state-fields.input.icl) sort-state-fields.expected.icl
```

### Determinism Verification

The test runner includes a determinism proof section that normalizes each contract 100+ times and verifies every iteration produces identical output (compared via SHA-256 hash).

To run determinism tests standalone:

```bash
# Quick check: normalize 100 times, hash each, verify unique count is 1
for i in $(seq 1 100); do
  icl-cli normalize contract.icl | sha256sum
done | sort -u | wc -l
# Output must be: 1
```

## Implementing Conformance

To make your ICL implementation conformant:

1. **Clone this repository:**
   ```bash
   git clone https://github.com/ICL-System/ICL-Spec.git
   ```

2. **Implement the two required commands:**
   - `validate <file>` — Parse and validate, exit 0 on success
   - `normalize <file>` — Print canonical form to stdout

3. **Run the test suite:**
   ```bash
   cd ICL-Spec/conformance
   ./run-conformance.sh "your-validate-cmd" "your-normalize-cmd"
   ```

4. **All tests must pass** — zero failures across all categories.

## Versioning

The conformance suite version (in `VERSION`) follows semver and matches the ICL specification version:

- **Patch** (0.1.x): New test fixtures added, no spec changes
- **Minor** (0.x.0): New normalization rules or validation requirements
- **Major** (x.0.0): Breaking spec changes

Implementations should declare which conformance suite version they target.

## Adding New Fixtures

### Valid Contract

```bash
# 1. Create the file with header comment
cat > valid/my-new-test.icl << 'EOF'
// Conformance: valid/my-new-test.icl
// Tests: <what feature this tests>
// Covers: <BNF rule or spec section>
Contract {
  ...
}
EOF

# 2. Verify it parses
icl-cli validate valid/my-new-test.icl
```

### Invalid Contract

```bash
# 1. Create with exactly ONE intentional error
cat > invalid/my-error-test.icl << 'EOF'
// Conformance: invalid/my-error-test.icl
// Tests: <specific error condition>
// Expected: MUST fail — <error type>
Contract {
  ...  // ONE thing wrong, everything else valid
}
EOF

# 2. Verify it fails
icl-cli validate invalid/my-error-test.icl && echo "BUG: should have failed"
```

### Normalization Pair

```bash
# 1. Create the non-canonical input
cat > normalization/my-test.input.icl << 'EOF'
// Conformance: normalization/my-test.input.icl
// Tests: <what normalization this tests>
// Normalize → normalization/my-test.expected.icl
Contract { ... }
EOF

# 2. Generate expected output using the reference implementation
icl-cli normalize normalization/my-test.input.icl > normalization/my-test.expected.icl

# 3. Verify idempotence
diff <(icl-cli normalize normalization/my-test.expected.icl) normalization/my-test.expected.icl
```
