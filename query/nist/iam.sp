locals {
  conformance_pack_iam_common_tags = merge(local.oci_compliance_common_tags, {
    service = "OCI/Identity"
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

