// Conformance: normalization/extensions-sorting.input.icl
// Tests: Extensions block with 3 namespaces in reverse alphabetical order, each with unsorted fields
// Normalize → normalization/extensions-sorting.expected.icl

Contract {
  Identity {
    stable_id: "ic-norm-25-001",
    version: 1,
    created_timestamp: 2026-02-01T00:00:00Z,
    owner: "normalization-test",
    semantic_hash: "0000000000000000"
  }

  PurposeStatement {
    narrative: "Test Extensions namespace and field sorting",
    intent_source: "conformance_test",
    confidence_level: 1.0
  }

  DataSemantics {
    state: {
      value: String
    },
    invariants: []
  }

  BehavioralSemantics {
    operations: []
  }

  ExecutionConstraints {
    trigger_types: ["manual"],
    resource_limits: {
      max_memory_bytes: 1048576,
      computation_timeout_ms: 100,
      max_state_size_bytes: 1048576
    },
    external_permissions: [],
    sandbox_mode: "full_isolation"
  }

  HumanMachineContract {
    system_commitments: [],
    system_refusals: [],
    user_obligations: []
  }
}

Extensions {
  z_monitoring {
    verbose: "true",
    sampling_rate: "0.5",
    enabled: "true"
  }

  m_logging {
    retention_days: "30",
    level: "info",
    format: "json"
  }

  a_caching {
    ttl_seconds: "300",
    strategy: "lru",
    enabled: "true"
  }
}
