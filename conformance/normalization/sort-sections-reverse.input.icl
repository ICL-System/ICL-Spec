// Conformance: normalization/sort-sections-reverse.input.icl
// Tests: Every section has ALL its fields in reverse alphabetical order
// Normalize → normalization/sort-sections-reverse.expected.icl

Contract {
  Identity {
    version: 1,
    stable_id: "ic-norm-07-001",
    semantic_hash: "0000000000000000",
    owner: "normalization-test",
    created_timestamp: 2026-02-01T00:00:00Z
  }

  PurposeStatement {
    narrative: "Test reverse field ordering in every section",
    intent_source: "conformance_test",
    confidence_level: 1.0
  }

  DataSemantics {
    state: {
      z_value: String,
      m_count: Integer = 0,
      a_flag: Boolean = true
    },
    invariants: ["m_count >= 0"]
  }

  BehavioralSemantics {
    operations: []
  }

  ExecutionConstraints {
    trigger_types: ["manual"],
    sandbox_mode: "full_isolation",
    resource_limits: {
      max_state_size_bytes: 1048576,
      max_memory_bytes: 1048576,
      computation_timeout_ms: 100
    },
    external_permissions: []
  }

  HumanMachineContract {
    user_obligations: ["must authenticate"],
    system_refusals: ["will not delete data"],
    system_commitments: ["will respond within timeout"]
  }
}
