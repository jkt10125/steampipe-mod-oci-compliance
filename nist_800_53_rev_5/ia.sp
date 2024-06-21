benchmark "nist_800_53_rev_5_ia" {
  title       = "Identification and Authentication (IA)"
  description = "IA controls are specific to the identification and authentication policies in an organization. This includes the identification and authentication of organizational and non-organizational users and how the management of those systems."
  children = [
    benchmark.nist_800_53_rev_5_ia_2
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ia_2" {
  title       = "Identification and Authentication (Organizational users) (IA-2)"
  description = "The information system uniquely identifies and authenticates organizational users (or processes acting on behalf of organizational users)."
  children = [
    benchmark.nist_800_53_rev_5_ia_2_1,
    benchmark.nist_800_53_rev_5_ia_2_2,
    benchmark.nist_800_53_rev_5_ia_2_6,
    benchmark.nist_800_53_rev_5_ia_2_8
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ia_2_1" {
  title       = "IA-2(1) Multi-Factor Authentication To Privileged Accounts"
  description = "Implement multi-factor authentication for access to privileged accounts."
  children = [
    control.iam_user_mfa_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ia_2_2" {
  title       = "IA-2(2) Multi-Factor Authentication To Non-Privileged Accounts"
  description = "Implement multi-factor authentication for access to non-privileged accounts."
  children = [
    control.iam_user_mfa_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ia_2_6" {
  title       = "IA-2(6) Acces To Accounts — Separate Device"
  description = "Implement multi-factor authentication for [Selection (one or more): local; network; remote] access to [Selection (one or more): privileged accounts; non-privileged accounts] such that: (a) One of the factors is provided by a device separate from the system gaining access; and (b) The device meets [Assignment: organization-defined strength of mechanism requirements]."
  children = [
    benchmark.nist_800_53_rev_5_ia_2_6_a,
    control.iam_user_mfa_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ia_2_6_a" {
  title       = "IA-2(6)(a)"
  description = "Implement multi-factor authentication for [Selection (one or more): local; network; remote] access to [Selection (one or more): privileged accounts; non-privileged accounts] such that: (a) One of the factors is provided by a device separate from the system gaining access."
  children = [
    control.iam_user_mfa_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ia_2_8" {
  title       = "IA-2(8) Access To Accounts — Replay Resistant"
  description = "Implement replay-resistant authentication mechanisms for access to [Selection (one or more): privileged accounts; non-privileged accounts]."
  children = [
    control.iam_user_mfa_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}
