// Conformance: normalization/comment-removal.input.icl
// Tests: All comments should be stripped during normalization
// Normalize → normalization/comment-removal.expected.icl

// This is a top-level comment before the contract
// It should be removed during normalization
Contract {
  // Identity section comment
  Identity {
    // The stable identifier
    stable_id: "ic-norm-22-001",
    version: 1, // inline version comment
    created_timestamp: 2026-02-01T00:00:00Z,
    // The contract owner
    owner: "normalization-test",
    semantic_hash: "0000000000000000"
  }

  // Purpose section
  PurposeStatement {
    narrative: "Test comment removal during normalization", // narrative comment
    intent_source: "conformance_test",
    confidence_level: 1.0
  }

  // Data section
  DataSemantics {
    state: {
      // a simple value
      value: String,
      // a counter
      count: Integer = 0
    },
    // invariant list
    invariants: ["count >= 0"]
  }

  // Behavioral section
  BehavioralSemantics {
    // no operations needed for this test
    operations: []
  }

  // Constraints section
  ExecutionConstraints {
    trigger_types: ["manual"], // only manual trigger
    resource_limits: {
      max_memory_bytes: 1048576, // 1MB
      computation_timeout_ms: 100,
      max_state_size_bytes: 1048576 // 1MB
    },
    external_permissions: [],
    sandbox_mode: "full_isolation" // most restrictive
  }

  // HMC section
  HumanMachineContract {
    system_commitments: [], // none
    system_refusals: [], // none
    user_obligations: [] // none
  }
}
// trailing comment
