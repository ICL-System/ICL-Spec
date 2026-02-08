Contract {
  Identity {
    created_timestamp: "2026-02-01T00:00:00Z",
    owner: "normalization-test",
    semantic_hash: "25250878c59f449c255f9fe62a2b09c83d416923228f3c96ebdce76a22bfb09c",
    stable_id: "ic-norm-14-001",
    version: 1,
  }
  PurposeStatement {
    confidence_level: 1.0,
    intent_source: "conformance_test",
    narrative: "Test sorting of operations by name",
  }
  DataSemantics {
    invariants: [],
    state: {
      value: String,
    }
  }
  BehavioralSemantics {
    operations: [
      {
        idempotence: "idempotent",
        name: "a_op",
        parameters: {
        },
        postcondition: "value processed",
        precondition: "value is not empty",
        side_effects: []
      }
      {
        idempotence: "not_idempotent",
        name: "m_op",
        parameters: {
        },
        postcondition: "value updated",
        precondition: "true",
        side_effects: ["log_action"]
      }
      {
        idempotence: "idempotent",
        name: "z_op",
        parameters: {
        },
        postcondition: "value unchanged",
        precondition: "true",
        side_effects: []
      }
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
