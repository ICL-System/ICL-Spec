Contract {
  Identity {
    created_timestamp: "2026-02-01T00:00:00Z",
    owner: "normalization-test",
    semantic_hash: "46bdebb9ae2e91c2878a9f64e734ce6dacbf967ff60923c345e1ae1861a5352c",
    stable_id: "ic-norm-02-001",
    version: 1,
  }
  PurposeStatement {
    confidence_level: 0.9,
    intent_source: "conformance_test",
    narrative: "Test sorting of PurposeStatement fields",
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
