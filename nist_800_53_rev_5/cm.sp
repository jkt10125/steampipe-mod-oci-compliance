benchmark "nist_800_53_rev_5_cm" {
  title       = "Configuration Management (CM)"
  description = "CM controls are specific to an organization’s configuration management policies. This includes a baseline configuration to operate as the basis for future builds or changes to information systems. Additionally, this includes information system component inventories and a security impact analysis --control."
  children = [
    benchmark.nist_800_53_rev_5_cm_5,
    benchmark.nist_800_53_rev_5_cm_6,
    benchmark.nist_800_53_rev_5_cm_9,
    benchmark.nist_800_53_rev_5_cm_12
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_5" {
  title       = "Access Restrictions For Change (CM-5)"
  description = "Define, document, approve, and enforce physical and logical access restrictions associated with changes to the system."
  children = [
    benchmark.nist_800_53_rev_5_cm_5_1
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_5_1" {
  title       = "CM-5(1) Automated Access Enforcement And Audit Records"
  description = "a. Enforce access restrictions using [Assignment: organization-defined automated mechanisms]; and b. Automatically generate audit records of the enforcement actions."
  children = [
    benchmark.nist_800_53_rev_5_cm_5_1_a
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_5_1_a" {
  title       = "CM-5(1)(a)"
  description = "Enforce access restrictions using [Assignment: organization-defined automated mechanisms]."
  children = [
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.iam_user_in_group,
    control.iam_account_password_policy_min_length_14
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_6" {
  title       = "Configuration Settings (CM-6)"
  description = "The organization: (i) establishes mandatory configuration settings for information technology products employed within the information system; (ii) configures the security settings of information technology products to the most restrictive mode consistent with operational requirements; (iii) documents the configuration settings; and (iv) enforces the configuration settings in all components of the information system."
  children = [
    benchmark.nist_800_53_rev_5_cm_6_a
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_6_a" {
  title       = "CM-6(a)"
  description = "Establish and document configuration settings for components employed within the system that reflect the most restrictive mode consistent with operational requirements using [Assignment: organization-defined common secure configurations]."
  children = [
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_account_password_policy_min_length_14
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_9" {
  title       = "Configuration Management Plan (CM-9)"
  description = "Develop, document, and implement a configuration management plan for the system that: a. Addresses roles, responsibilities, and configuration management processes and procedures; b. Establishes a process for identifying configuration items throughout the system development life cycle and for managing the configuration of the configuration items; c. Defines the configuration items for the system and places the configuration items under configuration management; d. Is reviewed and approved by [Assignment: organization-defined personnel or roles]; and e. Protects the configuration management plan from unauthorized disclosure and modification."
  children = [
    benchmark.nist_800_53_rev_5_cm_9_b
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_9_b" {
  title       = "CM-9(b)"
  description = "Develop, document, and implement a configuration management plan for the system that: b. Establishes a process for identifying configuration items throughout the system development life cycle and for managing the configuration of the configuration items."
  children = [
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_account_password_policy_min_length_14
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_12" {
  title       = "Information Location (CM-12)"
  description = "a. Identify and document the location of [Assignment: organization-defined information] and the specific system components on which the information is processed and stored; b. Identify and document the users who have access to the system and system components where the information is processed and stored; and c. Document changes to the location (i.e., system or system components) where the information is processed and stored."
  children = [
    benchmark.nist_800_53_rev_5_cm_12_b
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_12_b" {
  title       = "CM-12(b)"
  description = "Identify and document the users who have access to the system and system components where the information is processed and stored."
  children = [
    control.iam_account_password_policy_min_length_14
  ]

  tags = local.nist_800_53_rev_5_common_tags
}
