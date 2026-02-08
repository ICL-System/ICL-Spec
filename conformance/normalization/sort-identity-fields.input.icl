// Conformance: normalization/sort-identity-fields.input.icl
// Tests: Identity fields should be sorted alphabetically
// Normalize → normalization/sort-identity-fields.expected.icl

Contract {
  Identity {
    semantic_hash: "0000000000000000",
    version: 1,
    stable_id: "ic-norm-01-001",
    owner: "normalization-test",
    created_timestamp: 2026-02-01T00:00:00Z
  }

  PurposeStatement {
    narrative: "Test sorting of Identity fields",
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
    system_commitments: [],
    system_refusals: [],
    user_obligations: []
  }
}
