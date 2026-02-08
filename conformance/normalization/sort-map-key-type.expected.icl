Contract {
  Identity {
    created_timestamp: "2026-02-01T00:00:00Z",
    owner: "normalization-test",
    semantic_hash: "93951a0a342912db9e900ef3d7b7433e487d99ceee00d3bb94cf42c45825e241",
    stable_id: "ic-norm-19-001",
    version: 1,
  }
  PurposeStatement {
    confidence_level: 1.0,
    intent_source: "conformance_test",
    narrative: "Test Map types are preserved correctly during normalization",
  }
  DataSemantics {
    invariants: [],
    state: {
      counters: Map<String, Integer>,
      labels: Map<String, String>,
      scores: Map<String, Float>,
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
