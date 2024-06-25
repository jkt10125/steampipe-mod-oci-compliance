locals {
  nist_800_53_rev_5_common_tags = merge(local.oci_compliance_common_tags, {
    nist_800_53_rev_5 = "true"
    type              = "Benchmark"
  })
}

benchmark "nist_800_53_rev_5" {
  title       = "NIST 800-53 Revision 5"
  description = "NIST 800-53 is a regulatory standard that defines the minimum baseline of security controls for all U.S. federal information systems except those related to national security."
  documentation = file("./nist_800_53_rev_5/docs/nist_800_53_rev_5_overview.md")

  children = [
    benchmark.nist_800_53_rev_5_ac,
    benchmark.nist_800_53_rev_5_cm,
    benchmark.nist_800_53_rev_5_ia,
    benchmark.nist_800_53_rev_5_sc,
    benchmark.nist_800_53_rev_5_mp
  ]

  tags = local.nist_800_53_rev_5_common_tags
}
