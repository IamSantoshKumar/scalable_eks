data "aws_kms_key" "cluster" {
  key_id = "alias/eks/my-eks-cluster"
}

resource "aws_kms_alias" "this" {
  name          = "alias/eks/my-eks-cluster"
  target_key_id = data.aws_kms_key.cluster.key_id
}
