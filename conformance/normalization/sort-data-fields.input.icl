// Conformance: normalization/sort-data-fields.input.icl
// Tests: DataSemantics fields should be sorted alphabetically (invariants before state)
// Normalize → normalization/sort-data-fields.expected.icl

Contract {
  Identity {
    stable_id: "ic-norm-03-001",
    version: 1,
    created_timestamp: 2026-02-01T00:00:00Z,
    owner: "normalization-test",
    semantic_hash: "0000000000000000"
  }

  PurposeStatement {
    narrative: "Test sorting of DataSemantics fields",
    intent_source: "conformance_test",
    confidence_level: 1.0
  }

  DataSemantics {
    invariants: ["count >= 0", "name is not empty"],
    state: {
      count: Integer = 0,
      name: String = "default"
    }
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
