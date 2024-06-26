locals {
  conformance_pack_iam_common_tags = merge(local.oci_compliance_common_tags, {
    service = "OCI/Identity"
  })
}

<<<<<<< HEAD
control "iam_account_password_policy_min_length_14" {
  title       = "Ensure IAM password policy requires a minimum length of 14 or greater"
  description = "Password policies, in part, enforce password complexity requirements. Use IAM password policies to ensure that passwords are at least a given length. Security Hub recommends that the password policy require a minimum password length of 14 characters."
  query       = query.iam_account_password_policy_min_length_14

  tags = merge(local.conformance_pack_iam_common_tags, {
    nist_800_53_rev_5      = "true"
  })
}

control "iam_user_in_group" {
  title       = "IAM users should be in at least one group"
  description = "AWS Identity and Access Management (IAM) can help you restrict access permissions and authorizations, by ensuring IAM users are members of at least one group."
  query       = query.iam_user_in_group

  tags = merge(local.conformance_pack_iam_common_tags, {
    nist_800_53_rev_5                      = "true"
  })
}

=======
>>>>>>> 9b9e2bc87cf8ffb62e6b4a91c156496409a0bd59
control "iam_user_console_access_mfa_enabled" {
  title       = "IAM users with console access should have MFA enabled"
  description = "Manage access to resources in the AWS Cloud by ensuring that MFA is enabled for all AWS Identity and Access Management (IAM) users that have a console password."
  query       = query.iam_user_console_access_mfa_enabled

  tags = merge(local.conformance_pack_iam_common_tags, {
    nist_800_53_rev_5                      = "true"
  })
}

control "iam_user_mfa_enabled" {
  title       = "IAM user MFA should be enabled"
  description = "Enable this rule to restrict access to resources in the AWS Cloud."
  query       = query.iam_user_mfa_enabled

  tags = merge(local.conformance_pack_iam_common_tags, {
    nist_800_53_rev_5                      = "true"
  })
}

query "iam_user_mfa_enabled" {
  sql = <<-EOQ
    SELECT
      id AS resource,
      CASE
        WHEN is_mfa_activated THEN 'ok'
        ELSE 'alarm'
      END AS status,
      CASE
        WHEN is_mfa_activated THEN name || ' MFA device configured.'
        ELSE name || ' MFA device not configured.'
      END AS reason
    ${local.common_dimensions_global_sql}
    FROM
      oci_identity_user;
  EOQ
}

query "iam_user_console_access_mfa_enabled" {
  sql = <<-EOQ
    select
      id as resource,
      case
        when can_use_console_password and is_mfa_activated then 'ok'
        else 'alarm'
      end as status,
      case
        when not can_use_console_password then name || ' password login disabled.'
        when is_mfa_activated then name || ' password login enabled and MFA device configured.'
        else name || ' password login enabled but no MFA device configured.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_global_sql}
    from
      oci_identity_user;
  EOQ
<<<<<<< HEAD
}

query "iam_user_in_group" {
  sql = <<-EOQ
    select
      id as resource,
      case
        when jsonb_array_length(user_groups) = 0 then 'alarm'
        else 'ok'
      end as status,
      case
        when jsonb_array_length(user_groups) = 0 then name || ' not associated with any IAM group.'
        else name || ' associated with IAM group.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_global_sql}
    from
      oci_identity_user;
  EOQ
}

query "iam_account_password_policy_min_length_14" {
  sql = <<-EOQ
    select
      tenant_id as resource,
      case
        when minimum_password_length >= 14 then 'ok'
        else 'alarm'
      end as status,
      case
        when minimum_password_length is null then 'No password policy set.'
        else 'Minimum password length set to ' || minimum_password_length || '.'
      end as reason
      ${local.common_dimensions_global_sql}
    from
      oci_identity_authentication_policy;
  EOQ
}
=======
}
>>>>>>> 9b9e2bc87cf8ffb62e6b4a91c156496409a0bd59
