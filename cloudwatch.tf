resource "aws_cloudwatch_log_group" "this" {
  count             = 1
  name              = "/aws/eks/my-eks-cluster/cluster"
  retention_in_days = 30
}