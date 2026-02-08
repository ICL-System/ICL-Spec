Contract {
  Identity {
    created_timestamp: "2026-02-01T00:00:00Z",
    owner: "normalization-test",
    semantic_hash: "712ed38e6077563a4f8d2a911e2dbc0c894e19e20ce50d5bbbc415f38e9d788a",
    stable_id: "ic-norm-13-001",
    version: 1,
  }
  PurposeStatement {
    confidence_level: 1.0,
    intent_source: "conformance_test",
    narrative: "Test sorting of HumanMachineContract string lists",
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
    system_commitments: ["will enforce rate limits", "will log actions", "will validate inputs"],
    system_refusals: ["will not bypass authentication", "will not execute without authorization", "will not share data externally"],
    user_obligations: ["must accept terms", "must authenticate first", "must provide valid input"]
  }
}
