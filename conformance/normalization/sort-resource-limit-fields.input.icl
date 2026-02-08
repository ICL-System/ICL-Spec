// Conformance: normalization/sort-resource-limit-fields.input.icl
// Tests: resource_limits fields should be sorted alphabetically
// Normalize → normalization/sort-resource-limit-fields.expected.icl

Contract {
  Identity {
    stable_id: "ic-norm-06-001",
    version: 1,
    created_timestamp: 2026-02-01T00:00:00Z,
    owner: "normalization-test",
    semantic_hash: "0000000000000000"
  }

  PurposeStatement {
    narrative: "Test sorting of resource_limits fields",
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
      max_state_size_bytes: 2097152,
      max_memory_bytes: 4194304,
      computation_timeout_ms: 1000
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
