benchmark "nist_800_53_rev_5_cm" {
  title       = "Configuration Management (CM)"
  description = "CM controls are specific to an organization’s configuration management policies. This includes a baseline configuration to operate as the basis for future builds or changes to information systems. Additionally, this includes information system component inventories and a security impact analysis --control."
  children = [
    benchmark.nist_800_53_rev_5_cm_5
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
    control.iam_user_mfa_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}
