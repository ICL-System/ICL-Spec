Contract {
  Identity {
    created_timestamp: "2026-02-01T00:00:00Z",
    owner: "normalization-test",
    semantic_hash: "3789de3e596202f67f3e028320d59ae45071d26e6f0f1219989f584133ed93ad",
    stable_id: "ic-norm-18-001",
    version: 1,
  }
  PurposeStatement {
    confidence_level: 1.0,
    intent_source: "conformance_test",
    narrative: "Test sorting of Object type definition fields",
  }
  DataSemantics {
    invariants: [],
    state: {
      record: Object {
        active: Boolean,
        label: String,
        metadata: Object {
        author: String,
        created_at: ISO8601,
        updated_by: String,
      },
        zone: String,
      },
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
