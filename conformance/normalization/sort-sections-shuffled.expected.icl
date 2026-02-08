Contract {
  Identity {
    created_timestamp: "2026-02-01T12:00:00Z",
    owner: "normalization-test",
    semantic_hash: "32c028ec3ef6755e222bb7c4b8496b70474402bf7561cbc9b38582b354a8173c",
    stable_id: "ic-norm-08-001",
    version: 3,
  }
  PurposeStatement {
    confidence_level: 0.85,
    intent_source: "conformance_test",
    narrative: "Test shuffled field ordering across all sections",
  }
  DataSemantics {
    invariants: ["counter >= 0"],
    state: {
      counter: Integer = 0,
    }
  }
  BehavioralSemantics {
    operations: [
    ]
  }
  ExecutionConstraints {
    external_permissions: ["network:read"],
    resource_limits: {
      computation_timeout_ms: 500,
      max_memory_bytes: 2097152,
      max_state_size_bytes: 1048576,
    },
    sandbox_mode: "process_isolation",
    trigger_types: ["cron"]
  }
  HumanMachineContract {
    system_commitments: ["will validate all inputs"],
    system_refusals: ["will not bypass auth"],
    user_obligations: ["must provide valid credentials"]
  }
}
