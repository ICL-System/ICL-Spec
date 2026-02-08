// Conformance: normalization/sort-constraints-fields.input.icl
// Tests: ExecutionConstraints fields should be sorted alphabetically
// Normalize → normalization/sort-constraints-fields.expected.icl

Contract {
  Identity {
    stable_id: "ic-norm-04-001",
    version: 1,
    created_timestamp: 2026-02-01T00:00:00Z,
    owner: "normalization-test",
    semantic_hash: "0000000000000000"
  }

  PurposeStatement {
    narrative: "Test sorting of ExecutionConstraints fields",
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
    sandbox_mode: "full_isolation",
    external_permissions: ["network:read"],
    resource_limits: {
      max_memory_bytes: 2097152,
      computation_timeout_ms: 500,
      max_state_size_bytes: 1048576
    },
    trigger_types: ["manual"]
  }

  HumanMachineContract {
    system_commitments: [],
    system_refusals: [],
    user_obligations: []
  }
}
