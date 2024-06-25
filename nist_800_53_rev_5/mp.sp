benchmark "nist_800_53_rev_5_mp" {
  title       = "Media Protection (MP)"
  description = "The Media Protection control family includes controls specific to access, marking, storage, transport policies, sanitization, and defined organizational media use."
  children = [
    benchmark.nist_800_53_rev_5_mp_2
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_mp_2" {
  title       = "Media Access (MP-2)"
  description = "Restrict access to [Assignment: organization-defined types of digital and/or non-digital media] to [Assignment: organization-defined personnel or roles]."
  children = [
    control.iam_user_in_group
  ]

  tags = local.nist_800_53_rev_5_common_tags
}