// ICL Example: Agent Action Verification
// Tests: AI agent safety constraints, policy-based verification
// Source: ICL-Spec reference examples

Contract {
  Identity {
    stable_id: "ic-agent-verify-001",
    version: 1,
    created_timestamp: 2026-01-31T10:30:00Z,
    owner: "agent-framework-team",
    semantic_hash: "c3d4e5f6a7b8"
  }

  PurposeStatement {
    narrative: "Verify AI agent actions against policy before execution",
    intent_source: "safety_specification",
    confidence_level: 1.0
  }

  DataSemantics {
    state: {
      action_type: Enum["read", "write", "delete", "external_call"],
      resource_type: String,
      resource_id: String,
      agent_id: UUID,
      policy: Object {
        allowed_actions: Array<String>,
        forbidden_resources: Array<String>,
        max_batch_size: Integer,
        requires_confirmation: Boolean
      }
    },
    invariants: [
      "action_type is valid",
      "resource_type is not empty",
      "agent_id is uuid",
      "max_batch_size > 0",
      "no_resource_both_allowed_and_forbidden"
    ]
  }

  BehavioralSemantics {
    operations: [
      {
        name: "verify_action",
        precondition: "agent_action_proposed",
        parameters: {
          action: String,
          resource_type: String,
          resource_id: String,
          agent_id: UUID
        },
        postcondition: "verification_result_returned AND decision_logged",
        side_effects: ["log_verification_decision", "trigger_alert_if_denied"],
        idempotence: "idempotent"
      }
    ]
  }

  ExecutionConstraints {
    trigger_types: ["event_based"],
    resource_limits: {
      max_memory_bytes: 10485760,
      computation_timeout_ms: 100,
      max_state_size_bytes: 1048576
    },
    external_permissions: ["policy_lookup", "audit_logging"],
    sandbox_mode: "restricted"
  }

  HumanMachineContract {
    system_commitments: [
      "All agent actions verified against policy",
      "Dangerous actions blocked deterministically",
      "All decisions logged immutably",
      "Policy violations trigger alerts immediately"
    ],
    system_refusals: [
      "Will not allow policy violations",
      "Will not silently execute forbidden actions",
      "Will not lose audit trail"
    ],
    user_obligations: [
      "May update policies",
      "Must review denied action alerts",
      "May add agents to whitelist"
    ]
  }
}
