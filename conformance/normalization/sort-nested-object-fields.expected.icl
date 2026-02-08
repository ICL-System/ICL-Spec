Contract {
  Identity {
    created_timestamp: "2026-02-01T00:00:00Z",
    owner: "normalization-test",
    semantic_hash: "8bce5c8552c95ef8e9fdd2d002158e97d8da93a3e526e69ce52014847f70de19",
    stable_id: "ic-norm-10-001",
    version: 1,
  }
  PurposeStatement {
    confidence_level: 1.0,
    intent_source: "conformance_test",
    narrative: "Test sorting of nested object fields",
  }
  DataSemantics {
    invariants: ["profile.age >= 0"],
    state: {
      profile: Object {
        address: Object {
        city: String,
        country: String,
        street: String,
      },
        age: Integer,
        email: String,
        zip_code: String,
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
