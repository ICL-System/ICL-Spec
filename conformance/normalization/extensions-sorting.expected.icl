Contract {
  Identity {
    created_timestamp: "2026-02-01T00:00:00Z",
    owner: "normalization-test",
    semantic_hash: "675cd12968dfe42a8db8fba1c8d34fffedc42cff7f1007b7510e0b8f0aec1804",
    stable_id: "ic-norm-25-001",
    version: 1,
  }
  PurposeStatement {
    confidence_level: 1.0,
    intent_source: "conformance_test",
    narrative: "Test Extensions namespace and field sorting",
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

Extensions {
  a_caching {
    enabled: "true"
    strategy: "lru"
    ttl_seconds: "300"
  }
  m_logging {
    format: "json"
    level: "info"
    retention_days: "30"
  }
  z_monitoring {
    enabled: "true"
    sampling_rate: "0.5"
    verbose: "true"
  }
}
