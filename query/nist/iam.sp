locals {
  conformance_pack_iam_common_tags = merge(local.oci_compliance_common_tags, {
    service = "OCI/Identity"
  })
}

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
}