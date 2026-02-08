// Conformance: normalization/sort-operation-params.input.icl
// Tests: Operation parameter fields should be sorted alphabetically
// Normalize → normalization/sort-operation-params.expected.icl

Contract {
  Identity {
    stable_id: "ic-norm-16-001",
    version: 1,
    created_timestamp: 2026-02-01T00:00:00Z,
    owner: "normalization-test",
    semantic_hash: "0000000000000000"
  }

  PurposeStatement {
    narrative: "Test sorting of operation parameter fields",
    intent_source: "conformance_test",
    confidence_level: 1.0
  }

  DataSemantics {
    state: {
      name: String,
      email: String
    },
    invariants: []
  }

  BehavioralSemantics {
    operations: [
      {
        name: "update_user",
        precondition: "true",
        parameters: {
          zip_code: String,
          name: String,
          email: String,
          age: Integer
        },
        postcondition: "user fields updated",
        side_effects: ["notify_update"],
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
