Contract {
  Identity {
    created_timestamp: "2026-02-01T00:00:00Z",
    owner: "normalization-test",
    semantic_hash: "e53afcdf3c100bf2ca637a3776d910ed29e54202dce5a218c97b677af128fcd4",
    stable_id: "ic-norm-16-001",
    version: 1,
  }
  PurposeStatement {
    confidence_level: 1.0,
    intent_source: "conformance_test",
    narrative: "Test sorting of operation parameter fields",
  }
  DataSemantics {
    invariants: [],
    state: {
      email: String,
      name: String,
    }
  }
  BehavioralSemantics {
    operations: [
      {
        idempotence: "idempotent",
        name: "update_user",
        parameters: {
          age: Integer,
          email: String,
          name: String,
          zip_code: String,
        },
        postcondition: "user fields updated",
        precondition: "true",
        side_effects: ["notify_update"]
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
