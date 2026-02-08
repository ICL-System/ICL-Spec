// Conformance: normalization/idempotent-input.input.icl
// Tests: Already canonical contract should produce identical output (idempotence)
// Normalize → normalization/idempotent-input.expected.icl

Contract {
  Identity {
    created_timestamp: 2026-02-01T00:00:00Z,
    owner: "normalization-test",
    semantic_hash: "0000000000000000",
    stable_id: "ic-norm-24-001",
    version: 1,
  }

  PurposeStatement {
    confidence_level: 1.0,
    intent_source: "conformance_test",
    narrative: "Already in canonical form",
  }

  DataSemantics {
    invariants: ["count >= 0"],
    state: {
      count: Integer = 0,
      name: String = "default",
    },
  }

  BehavioralSemantics {
    operations: [
      {
        idempotence: "idempotent",
        name: "get_value",
        parameters: {},
        postcondition: "value returned",
        precondition: "true",
        side_effects: [],
      },
    ],
  }

  ExecutionConstraints {
    external_permissions: [],
    resource_limits: {
      computation_timeout_ms: 100,
      max_memory_bytes: 1048576,
      max_state_size_bytes: 1048576,
    },
    sandbox_mode: "full_isolation",
    trigger_types: ["manual"],
  }

  HumanMachineContract {
    system_commitments: [],
    system_refusals: [],
    user_obligations: [],
  }
}
