resource "aws_kms_alias" "this" {
  name          = "alias/eks/my-eks-cluster"
  target_key_id = aws_kms_key.cluster.id
}