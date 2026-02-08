Contract {
  Identity {
    created_timestamp: "2026-02-01T00:00:00Z",
    owner: "normalization-test",
    semantic_hash: "83bc6997adf05506eafb402824c81b0bd52345fdc4ace7fe38e1ef76f06dbb5d",
    stable_id: "ic-norm-12-001",
    version: 1,
  }
  PurposeStatement {
    confidence_level: 1.0,
    intent_source: "conformance_test",
    narrative: "Test sorting of external_permissions list",
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
    external_permissions: ["db:access", "file:read", "network:write"],
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
