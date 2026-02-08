// Conformance: normalization/sort-nested-object-fields.input.icl
// Tests: Nested object fields should be sorted alphabetically recursively
// Normalize → normalization/sort-nested-object-fields.expected.icl

Contract {
  Identity {
    stable_id: "ic-norm-10-001",
    version: 1,
    created_timestamp: 2026-02-01T00:00:00Z,
    owner: "normalization-test",
    semantic_hash: "0000000000000000"
  }

  PurposeStatement {
    narrative: "Test sorting of nested object fields",
    intent_source: "conformance_test",
    confidence_level: 1.0
  }

  DataSemantics {
    state: {
      profile: Object {
        zip_code: String,
        email: String,
        address: Object {
          street: String,
          country: String,
          city: String
        },
        age: Integer
      }
    },
    invariants: ["profile.age >= 0"]
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
