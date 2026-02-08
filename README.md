# ICL Specification

The **formal, authoritative specification** for Intent Contract Language (ICL) — a universal, deterministic, language-agnostic specification language for intent contracts.

> Like OpenAPI for human intent and AI agent constraints.

---

## Status

| Component | Status |
|-----------|--------|
| Core Specification (BNF, types, semantics) | **Draft v1.0** |
| Example Contracts | 5 reference examples |
| Conformance Tests | In progress |
| Formal Grammar File | Available |

---

## What is ICL?

ICL is a formal specification language that allows you to:

- **Define intent contracts** in a machine-readable, deterministic format
- **Validate operations** against declared constraints
- **Prove determinism** (same input → same output)
- **Share contracts** across different AI systems and programming languages
- **Verify guarantees** through formal methods

ICL is:
- **Deterministic** — Same input produces same output (always)
- **Verifiable** — Properties can be proven machine-checkable
- **Canonical** — One true form for each contract (via normalizer)
- **Portable** — Works across any language, any platform
- **Not Turing-complete** — Intentionally bounded for safety

---

## Repository Structure

```
ICL-Spec/
├── spec/
│   └── CORE-SPECIFICATION.md    # The formal specification
├── grammar/
│   └── icl.bnf                  # Standalone BNF grammar
├── examples/
│   ├── db-write-validation.icl  # Database write validation contract
│   ├── api-rate-limiting.icl    # API rate limiting contract
│   ├── agent-action-verification.icl  # AI agent action verification
│   ├── hello-world.icl          # Minimal hello world contract
│   └── code-verification.icl    # Code review verification
├── conformance/
│   ├── valid/                   # Contracts that MUST parse successfully
│   ├── invalid/                 # Contracts that MUST fail with specific errors
│   └── normalization/           # Input→expected canonical output pairs
├── roadmap/
│   └── standardization-roadmap.md
├── LICENSE
└── README.md                    # This file
```

---

## Quick Links

- **[Core Specification](spec/CORE-SPECIFICATION.md)** — The full formal spec (BNF grammar, type system, semantics, guarantees)
- **[Formal Grammar](grammar/icl.bnf)** — Standalone BNF grammar file
- **[Example Contracts](examples/)** — Reference contracts that demonstrate Core ICL
- **[Conformance Tests](conformance/)** — Test fixtures for validating any ICL implementation
- **[Standardization Roadmap](roadmap/standardization-roadmap.md)** — Path to becoming a universal standard

---

## Related Repositories

| Repo | Purpose |
|------|---------|
| [ICL-Runtime](https://github.com/ICL-System/ICL-Runtime) | Canonical Rust implementation + CLI |
| [ICL-Docs](https://github.com/ICL-System/ICL-Docs) | Documentation website (mdBook) |

---

## For Implementers

If you're building an ICL implementation in any language:

1. Read `spec/CORE-SPECIFICATION.md` — this is the authoritative reference
2. Use `grammar/icl.bnf` as the input grammar for your parser
3. Test against `conformance/valid/` — your parser must accept all of these
4. Test against `conformance/invalid/` — your parser must reject all of these
5. Test against `conformance/normalization/` — your normalizer must produce identical output

---

## License

MIT OR Apache-2.0
