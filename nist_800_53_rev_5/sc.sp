benchmark "nist_800_53_rev_5_sc" {
  title       = "System and Communications Protection (SC)"
  description = "The SC --control family is responsible for systems and communications protection procedures. This includes boundary protection, protection of information at rest, collaborative computing devices, cryptographic protection, denial of service protection, and many others."
  children = [
    benchmark.nist_800_53_rev_5_sc_23
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_23" {
  title       = "Session Authenticity (SC-23)"
  description = "Protect the authenticity of communications sessions."
  children = [
    benchmark.nist_800_53_rev_5_sc_23_3
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_23_3" {
  title       = "SC-23(3) Unique System-Generated Session Identifiers"
  description = "Generate a unique session identifier for each session with [Assignment: organization-defined randomness requirements] and recognize only session identifiers that are system-generated."
  children = [
    control.iam_user_console_access_mfa_enabled,
<<<<<<< HEAD
    control.iam_user_mfa_enabled,
    control.iam_user_in_group,
    control.iam_account_password_policy_min_length_14
=======
    control.iam_user_mfa_enabled
>>>>>>> 9b9e2bc87cf8ffb62e6b4a91c156496409a0bd59
  ]

  tags = local.nist_800_53_rev_5_common_tags
}
