// Conformance: normalization/sort-operations.input.icl
// Tests: Operations should be sorted by name alphabetically
// Normalize → normalization/sort-operations.expected.icl

Contract {
  Identity {
    stable_id: "ic-norm-14-001",
    version: 1,
    created_timestamp: 2026-02-01T00:00:00Z,
    owner: "normalization-test",
    semantic_hash: "0000000000000000"
  }

  PurposeStatement {
    narrative: "Test sorting of operations by name",
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
    operations: [
      {
        name: "z_op",
        precondition: "true",
        parameters: {},
        postcondition: "value unchanged",
        side_effects: [],
        idempotence: "idempotent"
      },
      {
        name: "m_op",
        precondition: "true",
        parameters: {},
        postcondition: "value updated",
        side_effects: ["log_action"],
        idempotence: "not_idempotent"
      },
      {
        name: "a_op",
        precondition: "value is not empty",
        parameters: {},
        postcondition: "value processed",
        side_effects: [],
        idempotence: "idempotent"
      }
    ]
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
