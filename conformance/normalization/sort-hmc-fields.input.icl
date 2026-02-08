// Conformance: normalization/sort-hmc-fields.input.icl
// Tests: HumanMachineContract fields should be sorted alphabetically
// Normalize → normalization/sort-hmc-fields.expected.icl

Contract {
  Identity {
    stable_id: "ic-norm-05-001",
    version: 1,
    created_timestamp: 2026-02-01T00:00:00Z,
    owner: "normalization-test",
    semantic_hash: "0000000000000000"
  }

  PurposeStatement {
    narrative: "Test sorting of HumanMachineContract fields",
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
    user_obligations: ["must authenticate"],
    system_refusals: ["will not delete without confirmation"],
    system_commitments: ["will log all actions"]
  }
}
