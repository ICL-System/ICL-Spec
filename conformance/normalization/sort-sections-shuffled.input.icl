// Conformance: normalization/sort-sections-shuffled.input.icl
// Tests: Every section has fields in a different shuffled (non-alphabetical) order
// Normalize → normalization/sort-sections-shuffled.expected.icl

Contract {
  Identity {
    owner: "normalization-test",
    stable_id: "ic-norm-08-001",
    created_timestamp: 2026-02-01T12:00:00Z,
    version: 3,
    semantic_hash: "0000000000000000"
  }

  PurposeStatement {
    intent_source: "conformance_test",
    confidence_level: 0.85,
    narrative: "Test shuffled field ordering across all sections"
  }

  DataSemantics {
    invariants: ["counter >= 0"],
    state: {
      counter: Integer = 0
    }
  }

  BehavioralSemantics {
    operations: []
  }

  ExecutionConstraints {
    resource_limits: {
      computation_timeout_ms: 500,
      max_state_size_bytes: 1048576,
      max_memory_bytes: 2097152
    },
    sandbox_mode: "process_isolation",
    trigger_types: ["cron"],
    external_permissions: ["network:read"]
  }

  HumanMachineContract {
    system_refusals: ["will not bypass auth"],
    user_obligations: ["must provide valid credentials"],
    system_commitments: ["will validate all inputs"]
  }
}
