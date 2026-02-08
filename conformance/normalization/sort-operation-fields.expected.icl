Contract {
  Identity {
    created_timestamp: "2026-02-01T00:00:00Z",
    owner: "normalization-test",
    semantic_hash: "72e694d2c1a47c36eef7e7902dcb303ec15c1f3b9ccf4b3f3911e93a47f55768",
    stable_id: "ic-norm-15-001",
    version: 1,
  }
  PurposeStatement {
    confidence_level: 1.0,
    intent_source: "conformance_test",
    narrative: "Test sorting of fields within an operation",
  }
  DataSemantics {
    invariants: ["counter >= 0"],
    state: {
      counter: Integer = 0,
    }
  }
  BehavioralSemantics {
    operations: [
      {
        idempotence: "not_idempotent",
        name: "increment",
        parameters: {
          amount: Integer,
        },
        postcondition: "counter incremented by amount",
        precondition: "counter >= 0",
        side_effects: ["audit_log"]
      }
    ]
  }
  ExecutionConstraints {
    external_permissions: [],
    resource_limits: {
      computation_timeout_ms: 100,
      max_memory_bytes: 1048576,
      max_state_size_bytes: 1048576,
    },
    sandbox_mode: "full_isolation",
    trigger_types: ["manual"]
  }
  HumanMachineContract {
    system_commitments: [],
    system_refusals: [],
    user_obligations: []
  }
}
