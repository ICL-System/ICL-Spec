// Conformance: normalization/full-normalization.input.icl
// Tests: Everything wrong — shuffled fields, unsorted lists, comments, bad whitespace
// Normalize → normalization/full-normalization.expected.icl

// This comment should be removed
Contract {

    // Identity with reversed fields and bad indent
      Identity {
            semantic_hash: "0000000000000000",
        version: 2,
            stable_id: "ic-norm-23-001",
        owner: "normalization-test",
            created_timestamp: 2026-02-01T12:00:00Z
      }

    PurposeStatement {
            narrative: "Test full normalization with all issues",
        confidence_level: 0.75,
            intent_source: "conformance_test"
    }


      DataSemantics {
        // Fields in wrong order
        invariants: ["z_count >= 0", "a_name is not empty"],
            state: {
            z_count: Integer = 0,
                m_status: Enum["pending", "active", "draft"],
            a_name: String = "default"
            }
      }

    // Behavioral section
    BehavioralSemantics {
        operations: [
            {
                // Operation fields in wrong order
                side_effects: ["log_action"],
                postcondition: "count updated",
                name: "z_update",
                idempotence: "not_idempotent",
                    precondition: "count >= 0",
                parameters: {
                    value: Integer
                }
            },
            {
                side_effects: [],
                postcondition: "data retrieved",
                    name: "a_fetch",
                idempotence: "idempotent",
                precondition: "true",
                parameters: {}
            }
        ]
    }


      ExecutionConstraints {
          sandbox_mode: "process_isolation",
        external_permissions: ["network:write", "file:read", "db:access"],
              resource_limits: {
            max_state_size_bytes: 2097152,
                max_memory_bytes: 4194304,
            computation_timeout_ms: 500
              },
          trigger_types: ["webhook", "manual", "cron"]
      }

    HumanMachineContract {
        // Lists unsorted
        user_obligations: ["must authenticate", "must accept terms"],
            system_refusals: ["will not share data", "will not bypass auth"],
        system_commitments: ["will validate inputs", "will log actions"]
    }
}
// trailing comment to remove
