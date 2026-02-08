Contract {
  Identity {
    created_timestamp: "2026-02-01T00:00:00Z",
    owner: "normalization-test",
    semantic_hash: "cfd269849384b41930f77a9d7cf3a2a5600cb6ceb68cf65f56df6c2aa9a0ad1a",
    stable_id: "ic-norm-17-001",
    version: 1,
  }
  PurposeStatement {
    confidence_level: 1.0,
    intent_source: "conformance_test",
    narrative: "Test sorting of Enum variant strings",
  }
  DataSemantics {
    invariants: [],
    state: {
      fruit: Enum["apple", "banana", "cherry"],
      priority: Enum["critical", "high", "low", "medium"],
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
