// Conformance: normalization/sort-enum-variants.input.icl
// Tests: Enum variant strings should be sorted alphabetically
// Normalize → normalization/sort-enum-variants.expected.icl

Contract {
  Identity {
    stable_id: "ic-norm-17-001",
    version: 1,
    created_timestamp: 2026-02-01T00:00:00Z,
    owner: "normalization-test",
    semantic_hash: "0000000000000000"
  }

  PurposeStatement {
    narrative: "Test sorting of Enum variant strings",
    intent_source: "conformance_test",
    confidence_level: 1.0
  }

  DataSemantics {
    state: {
      fruit: Enum["cherry", "apple", "banana"],
      priority: Enum["medium", "high", "low", "critical"]
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
