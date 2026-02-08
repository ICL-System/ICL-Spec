Contract {
  Identity {
    created_timestamp: "2026-02-01T00:00:00Z",
    owner: "normalization-test",
    semantic_hash: "b0116570affc59dfdaecc5705723b08da3106a7443c414db35c38b318448f182",
    stable_id: "ic-norm-07-001",
    version: 1,
  }
  PurposeStatement {
    confidence_level: 1.0,
    intent_source: "conformance_test",
    narrative: "Test reverse field ordering in every section",
  }
  DataSemantics {
    invariants: ["m_count >= 0"],
    state: {
      a_flag: Boolean = true,
      m_count: Integer = 0,
      z_value: String,
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
    system_commitments: ["will respond within timeout"],
    system_refusals: ["will not delete data"],
    user_obligations: ["must authenticate"]
  }
}
