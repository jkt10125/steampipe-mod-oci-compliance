benchmark "nist_800_53_rev_5_ac" {
  title       = "Access Control (AC)"
  description = "The access control family consists of security requirements detailing system logging. This includes who has access to what assets and reporting capabilities like account management, system privileges, and remote access logging to determine when users have access to the system and their level of access."
  children = [
    benchmark.nist_800_53_rev_5_ac_2,
    benchmark.nist_800_53_rev_5_ac_3,
    benchmark.nist_800_53_rev_5_ac_4,
    benchmark.nist_800_53_rev_5_ac_6,
    benchmark.nist_800_53_rev_5_ac_7,
    benchmark.nist_800_53_rev_5_ac_24
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_2" {
  title       = "Account Management (AC-2)"
  description = "Manage system accounts, group memberships, privileges, workflow, notifications, deactivations, and authorizations."
  children = [
    benchmark.nist_800_53_rev_5_ac_2_1,
    benchmark.nist_800_53_rev_5_ac_2_6,
    benchmark.nist_800_53_rev_5_ac_2_i_2
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_2_1" {
  title       = "AC-2(1) Automated System Account Management"
  description = "Support the management of system accounts using [Assignment: organization-defined automated mechanisms]."
  children = [
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_2_6" {
  title       = "AC-2(6) Dynamic Privilege Management"
  description = "Implement [Assignment: organization-defined dynamic privilege management capabilities]."
  children = [
    control.iam_user_in_group
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_2_i_2" {
  title       = "AC-2(i)(2)"
  description = "i. Authorize access to the system based on: 2. Intended system usage."
  children = [
    control.iam_user_in_group
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ac_3" {
  title       = "Access Enforcement (AC-3)"
  description = "Enforce approved authorizations for logical access to information and system resources in accordance with applicable access control policies."
  children = [
    benchmark.nist_800_53_rev_5_ac_3_2,
    benchmark.nist_800_53_rev_5_ac_3_3,
    benchmark.nist_800_53_rev_5_ac_3_4,
    benchmark.nist_800_53_rev_5_ac_3_7,
    benchmark.nist_800_53_rev_5_ac_3_8,
    benchmark.nist_800_53_rev_5_ac_3_12,
    benchmark.nist_800_53_rev_5_ac_3_13,
    benchmark.nist_800_53_rev_5_ac_3_15,
    control.iam_user_in_group
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_2" {
  title       = "AC-3(2) Dual Authorization"
  description = "Enforce dual authorization for [Assignment: organization-defined privileged commands and/or other organization-defined actions]."
  children = [
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "OCI/IAM"
  })
}

benchmark "nist_800_53_rev_5_ac_3_3" {
  title       = "AC-3(3) Mandatory Access Control"
  description = "Enforce [Assignment: organization-defined mandatory access control policy] over the set of covered subjects and objects specified in the policy, and where the policy: (a) Is uniformly enforced across the covered subjects and objects within the system; (b) Specifies that a subject that has been granted access to information is constrained from doing any of the following; (1) Passing the information to unauthorized subjects or objects; (2) Granting its privileges to other subjects; (3) Changing one or more security attributes (specified by the policy) on subjects, objects, the system, or system components; (4) Choosing the security attributes and attribute values (specified by the policy) to be associated with newly created or modified objects; and (5) Changing the rules governing access control; and (c) Specifies that [Assignment: organization-defined subjects] may explicitly be granted [Assignment: organization-defined privileges] such that they are not limited by any defined subset (or all) of the above constraints."
  children = [
    benchmark.nist_800_53_rev_5_ac_3_3_a,
    benchmark.nist_800_53_rev_5_ac_3_3_b_1,
    benchmark.nist_800_53_rev_5_ac_3_3_b_2,
    benchmark.nist_800_53_rev_5_ac_3_3_b_3,
    benchmark.nist_800_53_rev_5_ac_3_3_b_4,
    benchmark.nist_800_53_rev_5_ac_3_3_b_5,
    benchmark.nist_800_53_rev_5_ac_3_3_c,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.iam_user_in_group
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_3_a" {
  title       = "AC-3(3)(a)"
  description = "Enforce [Assignment: organization-defined mandatory access policy] over the set of covered subjects and objects specified in the policy, and where the policy: (a) Is uniformly enforced across the covered subjects and objects within the system."
  children = [
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.iam_user_in_group
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_3_b_1" {
  title       = "AC-3(3)(b)(1)"
  description = "Enforce [Assignment: organization-defined mandatory access policy] over the set of covered subjects and objects specified in the policy, and where the policy: (b) Specifies that a subject that has been granted access to information is constrained from doing any of the following; (1) Passing the information to unauthorized subjects or objects."
  children = [
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.iam_user_in_group
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_3_b_2" {
  title       = "AC-3(3)(b)(2)"
  description = "Enforce [Assignment: organization-defined mandatory access policy] over the set of covered subjects and objects specified in the policy, and where the policy: (b) Specifies that a subject that has been granted access to information is constrained from doing any of the following; (2) Granting its privileges to other subjects."
  children = [
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.iam_user_in_group
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_3_b_3" {
  title       = "AC-3(3)(b)(3)"
  description = "Enforce [Assignment: organization-defined mandatory access policy] over the set of covered subjects and objects specified in the policy, and where the policy: (b) Specifies that a subject that has been granted access to information is constrained from doing any of the following; (3) Changing one or more security attributes (specified by the policy) on subjects, objects, the system, or system components."
  children = [
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.iam_user_in_group
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_3_b_4" {
  title       = "AC-3(3)(b)(4)"
  description = "Enforce [Assignment: organization-defined mandatory access policy] over the set of covered subjects and objects specified in the policy, and where the policy: (b) Specifies that a subject that has been granted access to information is constrained from doing any of the following; (4) Choosing the security attributes and attribute values (specified by the policy) to be associated with newly created or modified objects."
  children = [
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.iam_user_in_group
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_3_b_5" {
  title       = "AC-3(3)(b)(5)"
  description = "Enforce [Assignment: organization-defined mandatory access policy] over the set of covered subjects and objects specified in the policy, and where the policy: (b) Specifies that a subject that has been granted access to information is constrained from doing any of the following; (5) Changing the rules governing access."
  children = [
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.iam_user_in_group
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_3_c" {
  title       = "AC-3(3)(c)"
  description = "Enforce [Assignment: organization-defined mandatory access policy] over the set of covered subjects and objects specified in the policy, and where the policy: (c) Specifies that [Assignment: organization-defined subjects] may explicitly be granted [Assignment: organization-defined privileges] such that they are not limited by any defined subset (or all) of the above constraints."
  children = [
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.iam_user_in_group
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_4" {
  title       = "AC-3(4) Discretionary Access Control"
  description = "Enforce [Assignment: organization-defined discretionary access control policy] over the set of covered subjects and objects specified in the policy, and where the policy specifies that a subject that has been granted access to information can do one or more of the following: (a) Pass the information to any other subjects or objects; (b) Grant its privileges to other subjects; (c) Change security attributes on subjects, objects, the system, or the system’s components; (d) Choose the security attributes to be associated with newly created or revised objects; or (e) Change the rules governing access control."
  children = [
    benchmark.nist_800_53_rev_5_ac_3_4_a,
    benchmark.nist_800_53_rev_5_ac_3_4_b,
    benchmark.nist_800_53_rev_5_ac_3_4_c,
    benchmark.nist_800_53_rev_5_ac_3_4_d,
    benchmark.nist_800_53_rev_5_ac_3_4_e,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.iam_user_in_group
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_4_a" {
  title       = "AC-3(4)(a)"
  description = "Enforce [Assignment: organization-defined discretionary access policy] over the set of covered subjects and objects specified in the policy, and where the policy specifies that a subject that has been granted access to information can do one or more of the following: (a) Pass the information to any other subjects or objects."
  children = [
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.iam_user_in_group
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_4_b" {
  title       = "AC-3(4)(b)"
  description = "Enforce [Assignment: organization-defined discretionary access policy] over the set of covered subjects and objects specified in the policy, and where the policy specifies that a subject that has been granted access to information can do one or more of the following: (b) Grant its privileges to other subjects."
  children = [
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.iam_user_in_group
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_4_c" {
  title       = "AC-3(4)(c)"
  description = "Enforce [Assignment: organization-defined discretionary access policy] over the set of covered subjects and objects specified in the policy, and where the policy specifies that a subject that has been granted access to information can do one or more of the following: (c) Change security attributes on subjects, objects, the system, or the system’s components."
  children = [
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.iam_user_in_group
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_4_d" {
  title       = "AC-3(4)(d)"
  description = "Enforce [Assignment: organization-defined discretionary access policy] over the set of covered subjects and objects specified in the policy, and where the policy specifies that a subject that has been granted access to information can do one or more of the following: (d) Choose the security attributes to be associated with newly created or revised objects."
  children = [
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.iam_user_in_group
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_4_e" {
  title       = "AC-3(4)(e)"
  description = "Enforce [Assignment: organization-defined discretionary access policy] over the set of covered subjects and objects specified in the policy, and where the policy specifies that a subject that has been granted access to information can do one or more of the following: (e) Change the rules governing access."
  children = [
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.iam_user_in_group
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_7" {
  title       = "AC-3(7) Role-Based Access Control"
  description = "Enforce a role-based access control policy over defined subjects and objects and control access based upon [Assignment: organization-defined roles and users authorized to assume such roles]."
  children = [
    control.iam_user_in_group
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_8" {
  title       = "AC-3(8) Revocation Of Access Authorizations"
  description = "Enforce the revocation of access authorizations resulting from changes to the security attributes of subjects and objects based on [Assignment: organization-defined rules governing the timing of revocations of access authorizations]."
  children = [
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.iam_user_in_group
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_12" {
  title       = "AC-3(12)  Assert And Enforce Application Access"
  description = "a. Require applications to assert, as part of the installation process, the access needed to the following system applications and functions: [Assignment: organization-defined system applications and functions];b. Provide an enforcement mechanism to prevent unauthorized access; and c. Approve access changes after initial installation of the application."
  children = [
    benchmark.nist_800_53_rev_5_ac_3_12_a
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_12_a" {
  title       = "AC-3(12)(a)"
  description = "Require applications to assert, as part of the installation process, the access needed to the following system applications and functions: [Assignment: organization-defined system applications and functions]."
  children = [
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.iam_user_in_group
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_13" {
  title       = "AC-3(13) Attribute-Based Access Control"
  description = "Enforce attribute-based access control policy over defined subjects and objects and control access based upon [Assignment: organization-defined attributes to assume access permissions]."
  children = [
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.iam_user_in_group
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_15" {
  title       = "AC-3(15) Discretionary And Mandatory Access Control"
  description = "a. Enforce [Assignment: organization-defined mandatory access control policy] over the set of covered subjects and objects specified in the policy; and b. Enforce [Assignment: organization-defined discretionary access control policy] over the set of covered subjects and objects specified in the policy."
  children = [
    benchmark.nist_800_53_rev_5_ac_3_15_a,
    benchmark.nist_800_53_rev_5_ac_3_15_b
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_15_a" {
  title       = "AC-3(15)(a)"
  description = "Enforce [Assignment: organization-defined mandatory access control policy] over the set of covered subjects and objects specified in the policy."
  children = [
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.iam_user_in_group
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_15_b" {
  title       = "AC-3(15)(b)"
  description = "Enforce [Assignment: organization-defined discretionary access control policy] over the set of covered subjects and objects specified in the policy."
  children = [
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.iam_user_in_group
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_4" {
  title       = "Information Flow Enforcement (AC-4)"
  description = "Enforce approved authorizations for controlling the flow of information within the system and between connected systems based on [Assignment: organization-defined information flow control policies]."
  children = [
    benchmark.nist_800_53_rev_5_ac_4_28,
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_4_28" {
  title       = "AC-4(28) Linear Filter Pipelines"
  description = "When transferring information between different security domains, implement a linear content filter pipeline that is enforced with discretionary and mandatory access controls."
  children = [
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.iam_user_in_group
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_6" {
  title       = "Least Privilege (AC-6)"
  description = "Employ the principle of least privilege, allowing only authorized accesses for users (or processes acting on behalf of users) that are necessary to accomplish assigned organizational tasks."
  children = [
    benchmark.nist_800_53_rev_5_ac_6_3,
    control.iam_user_in_group
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_6_3" {
  title       = "AC-6(3)"
  description = "Authorize network access to [Assignment: organization-defined privileged commands] only for [Assignment: organization-defined compelling operational needs] and document the rationale for such access in the security plan for the system."
  children = [
    control.iam_user_in_group
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ac_7" {
  title       = "Unsuccessful Logon Attempts (AC-7)"
  description = "a. Enforce a limit of [Assignment: organization-defined number] consecutive invalid logon attempts by a user during a [Assignment:organization-defined time period]; and b. Automatically [Selection (one or more): lock the account or node for an [Assignment: organization-defined time period]; lock the account or node until released by an administrator; delay next logon prompt per [Assignment: organization-defined delay algorithm]; notify system administrator; take other[Assignment: organization-defined action]] when the maximum number of unsuccessful attempts is exceeded."
  children = [
    benchmark.nist_800_53_rev_5_ac_7_4
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "OCI/IAM"
  })
}

benchmark "nist_800_53_rev_5_ac_7_4" {
  title       = "AC-7(4) Use Of Alternate Authentication Factor"
  description = "a. Allow the use of [Assignment: organization-defined authentication factors] that are different from the primary authentication factors after the number of organization-defined consecutive invalid logon attempts have been exceeded; and b. Enforce a limit of [Assignment: organization-defined number] consecutive invalid logon attempts through use of the alternative factors by a user during a [Assignment: organization-defined time period]."
  children = [
    benchmark.nist_800_53_rev_5_ac_7_4_a,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "OCI/IAM"
  })
}

benchmark "nist_800_53_rev_5_ac_7_4_a" {
  title       = "AC-7(4)(a)"
  description = "Allow the use of [Assignment: organization-defined authentication factors] that are different from the primary authentication factors after the number of organization-defined consecutive invalid logon attempts have been exceeded."
  children = [
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "OCI/IAM"
  })
}

benchmark "nist_800_53_rev_5_ac_24" {
  title       = "Access Control Decisions (AC-24)"
  description = "[Selection: Establish procedures; Implement mechanisms] to ensure [Assignment: organization-defined access control decisions] are applied to each access request prior to access enforcement."
  children = [
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.iam_user_in_group
  ]

  tags = local.nist_800_53_rev_5_common_tags
}
