provider "kubernetes" {
  config_context_cluster   = "kind-my-cluster"
}

resource "kubernetes_namespace" "ekems" {
  metadata {
    name = "ekems-namespace"
  }
}

resource "kubernetes_deployment" "ekems" {
  metadata {
    name      = "ekems-deployment"
    namespace = kubernetes_namespace.example.metadata[0].name
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "example"
      }
    }

    template {
      metadata {
        labels = {
          app = "example"
        }
      }

      spec {
        container {
          image = "nginx:latest"
          name  = "nginx"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "ekems" {
  metadata {
    name      = "ekems-service"
    namespace = kubernetes_namespace.ekems.metadata[0].name
  }

  spec {
    selector = {
      app = kubernetes_deployment.ekems.spec[0].template[0].metadata[0].labels["app"]
    }

    port {
      port        = 80
      target_port = 80
    }
  }
}
