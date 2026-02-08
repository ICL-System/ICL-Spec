// ICL Example: Code Verification
// Tests: CI/CD integration, code quality gates
// Source: ICL-Spec reference examples

Contract {
  Identity {
    stable_id: "ic-code-verify-001",
    version: 1,
    created_timestamp: 2026-01-31T10:45:00Z,
    owner: "devops-team",
    semantic_hash: "d4e5f6a7b8c9"
  }

  PurposeStatement {
    narrative: "Verify code changes meet quality and security standards",
    intent_source: "ci_cd_specification",
    confidence_level: 1.0
  }

  DataSemantics {
    state: {
      pull_request: Object {
        id: String,
        from_branch: String,
        to_branch: String,
        files_changed: Array<String>
      },
      checks: Object {
        syntax_valid: Boolean,
        tests_passing: Boolean,
        coverage_above_threshold: Boolean,
        no_security_warnings: Boolean,
        style_compliant: Boolean
      }
    },
    invariants: [
      "all_checks_are_boolean",
      "pr_id_is_not_empty",
      "file_list_is_not_empty"
    ]
  }

  BehavioralSemantics {
    operations: [
      {
        name: "verify_pr",
        precondition: "pull_request_opened",
        parameters: {
          pr_id: String,
          files: Array<String>
        },
        postcondition: "verification_complete AND result_posted_to_pr",
        side_effects: ["run_linter", "run_tests", "check_coverage", "scan_security"],
        idempotence: "idempotent"
      },
      {
        name: "merge_if_passed",
        precondition: "all_checks_passed",
        parameters: {
          pr_id: String
        },
        postcondition: "pr_merged OR blocked_if_failed",
        side_effects: ["update_repository"],
        idempotence: "idempotent"
      }
    ]
  }

  ExecutionConstraints {
    trigger_types: ["event_based"],
    resource_limits: {
      max_memory_bytes: 2147483648,
      computation_timeout_ms: 600000,
      max_state_size_bytes: 104857600
    },
    external_permissions: ["git_access", "ci_cd_runner"],
    sandbox_mode: "restricted"
  }

  HumanMachineContract {
    system_commitments: [
      "All changes verified before merge",
      "Verification is deterministic",
      "Failed checks prevent merge",
      "All results are logged"
    ],
    system_refusals: [
      "Will not merge failing code",
      "Will not skip security checks",
      "Will not lose verification results"
    ],
    user_obligations: [
      "May update standards",
      "Must fix failing checks",
      "May request waiver (recorded in provenance)"
    ]
  }
}
