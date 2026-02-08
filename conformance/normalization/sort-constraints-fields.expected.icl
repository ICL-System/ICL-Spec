Contract {
  Identity {
    created_timestamp: "2026-02-01T00:00:00Z",
    owner: "normalization-test",
    semantic_hash: "c8722e5df69cb4688d518653f7b0a4442c82c8b5d4e49fe32e5b23bd1e0f061b",
    stable_id: "ic-norm-04-001",
    version: 1,
  }
  PurposeStatement {
    confidence_level: 1.0,
    intent_source: "conformance_test",
    narrative: "Test sorting of ExecutionConstraints fields",
  }
  DataSemantics {
    invariants: [],
    state: {
      value: String,
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
    sandbox_mode: "full_isolation",
    trigger_types: ["manual"]
  }
  HumanMachineContract {
    system_commitments: [],
    system_refusals: [],
    user_obligations: []
  }
}
