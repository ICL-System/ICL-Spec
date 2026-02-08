// Conformance: normalization/sort-map-key-type.input.icl
// Tests: Map type with canonical key/value types (no-op normalization)
// Normalize → normalization/sort-map-key-type.expected.icl

Contract {
  Identity {
    stable_id: "ic-norm-19-001",
    version: 1,
    created_timestamp: 2026-02-01T00:00:00Z,
    owner: "normalization-test",
    semantic_hash: "0000000000000000"
  }

  PurposeStatement {
    narrative: "Test Map types are preserved correctly during normalization",
    intent_source: "conformance_test",
    confidence_level: 1.0
  }

  DataSemantics {
    state: {
      counters: Map<String, Integer>,
      labels: Map<String, String>,
      scores: Map<String, Float>
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
