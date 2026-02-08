// Conformance: normalization/sort-hmc-lists.input.icl
// Tests: system_commitments, system_refusals, user_obligations lists should be sorted alphabetically
// Normalize → normalization/sort-hmc-lists.expected.icl

Contract {
  Identity {
    stable_id: "ic-norm-13-001",
    version: 1,
    created_timestamp: 2026-02-01T00:00:00Z,
    owner: "normalization-test",
    semantic_hash: "0000000000000000"
  }

  PurposeStatement {
    narrative: "Test sorting of HumanMachineContract string lists",
    intent_source: "conformance_test",
    confidence_level: 1.0
  }

  DataSemantics {
    state: {
      value: String
    },
    invariants: []
  }

  BehavioralSemantics {
    operations: []
  }

  ExecutionConstraints {
    trigger_types: ["manual"],
    resource_limits: {
      max_memory_bytes: 1048576,
      computation_timeout_ms: 100,
      max_state_size_bytes: 1048576
    },
    external_permissions: [],
    sandbox_mode: "full_isolation"
  }

  HumanMachineContract {
    system_commitments: ["will validate inputs", "will log actions", "will enforce rate limits"],
    system_refusals: ["will not share data externally", "will not bypass authentication", "will not execute without authorization"],
    user_obligations: ["must provide valid input", "must authenticate first", "must accept terms"]
  }
}
