Contract {
  Identity {
    created_timestamp: "2026-02-01T12:00:00Z",
    owner: "normalization-test",
    semantic_hash: "4ca302f9e643e6f76fc4b6deac9b965e9a45c5740f8c1edd5a4aef4b25fcc9e3",
    stable_id: "ic-norm-23-001",
    version: 2,
  }
  PurposeStatement {
    confidence_level: 0.75,
    intent_source: "conformance_test",
    narrative: "Test full normalization with all issues",
  }
  DataSemantics {
    invariants: ["a_name is not empty", "z_count >= 0"],
    state: {
      a_name: String = "default",
      m_status: Enum["active", "draft", "pending"],
      z_count: Integer = 0,
    }
  }
  BehavioralSemantics {
    operations: [
      {
        idempotence: "idempotent",
        name: "a_fetch",
        parameters: {
        },
        postcondition: "data retrieved",
        precondition: "true",
        side_effects: []
      }
      {
        idempotence: "not_idempotent",
        name: "z_update",
        parameters: {
          value: Integer,
        },
        postcondition: "count updated",
        precondition: "count >= 0",
        side_effects: ["log_action"]
      }
    ]
  }
  ExecutionConstraints {
    external_permissions: ["db:access", "file:read", "network:write"],
    resource_limits: {
      computation_timeout_ms: 500,
      max_memory_bytes: 4194304,
      max_state_size_bytes: 2097152,
    },
    sandbox_mode: "process_isolation",
    trigger_types: ["cron", "manual", "webhook"]
  }
  HumanMachineContract {
    system_commitments: ["will log actions", "will validate inputs"],
    system_refusals: ["will not bypass auth", "will not share data"],
    user_obligations: ["must accept terms", "must authenticate"]
  }
}
