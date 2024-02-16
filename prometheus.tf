

provider "helm" {
  kubernetes {
    config_context_cluster = "kind-my-cluster"
  }
}

resource "helm_release" "kube_prometheus_stack" {
  name       = "kube-prometheus-stack"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  namespace  = "prometheus"
  version    = "18.0.1"
  timeout    = 600

  set {
    name  = "prometheusOperator.createCustomResource"
    value = "false"
  }
}
