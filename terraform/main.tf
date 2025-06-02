terraform {
  required_providers {
    harness = {
      source = "harness/harness"
      version = "0.33.0"
    }
  }
}



provider "harness" {
  endpoint         = "https://app.harness.io/gateway"
  account_id       = var.accountid
  platform_api_key = var.apikey
}


resource "harness_platform_service" "adservice" {
  identifier  = "adservice"
  name        = "adservice"
  org_id      = "${var.org}"
  project_id  = "${var.project}"
  description = "ad service for the boutique app"
  yaml = <<-EOT
                service:
                  name: adservice
                  identifier: adservice
                  orgIdentifier: "${var.org}"
                  projectIdentifier: "${var.project}"
                  serviceDefinition:
                    spec:
                      manifests:
                        - manifest:
                            identifier: manifest1
                            type: K8sManifest
                            spec:
                              store:
                                type: HarnessCode
                                spec:
                                  gitFetchType: Branch
                                  paths:
                                    - k8s-deploy/manifests
                                  repoName: harness_boutique
                                  branch: main
                              valuesPaths:
                                - k8s-deploy/values.yaml
                              skipResourceVersioning: false

                      artifacts:
                        primary:
                          primaryArtifactRef: adservice
                          sources:
                            - spec:
                                connectorRef: "${var.connectorRef}"
                                imagePath: nikpap/boutique
                                tag: adservice
                              identifier: adservice
                              type: DockerRegistry
                      variables:
                        - name: service_account
                          type: String
                          value: adservice
                        - name: service_type
                          type: String
                          value: ClusterIP
                        - name: service_port
                          type: String
                          value: 9555
                        - name: service_target_port
                          type: String
                          value: 9555
                        - name: service_port_name
                          type: String
                          value: grpc
                        - name: container_port
                          type: String
                          value: 9555
                        - name: container_requests_cpu
                          type: String
                          value: 200m
                        - name: container_requests_memory
                          type: String
                          value: 180Mi
                        - name: container_limits_cpu
                          type: String
                          value: 300m
                        - name: container_limits_memory
                          type: String
                          value: 300Mi
                  
                    type: Kubernetes
                  gitOpsEnabled: false
              EOT
}



resource "harness_platform_service" "checkoutservice" {
  identifier  = "checkoutservice"
  name        = "checkoutservice"
  org_id      = "${var.org}"
  project_id  = "${var.project}"
  description = "ad service for the boutique app"
  yaml = <<-EOT
                service:
                  name: checkoutservice
                  identifier: checkoutservice
                  orgIdentifier: "${var.org}"
                  projectIdentifier: "${var.project}"
                  serviceDefinition:
                    spec:
                      manifests:
                        - manifest:
                            identifier: manifest1
                            type: K8sManifest
                            spec:
                              store:
                                type: HarnessCode
                                spec:
                                  gitFetchType: Branch
                                  paths:
                                    - k8s-deploy/manifests
                                  repoName: harness_boutique
                                  branch: main
                              valuesPaths:
                                - k8s-deploy/values.yaml
                              skipResourceVersioning: false

                      artifacts:
                        primary:
                          primaryArtifactRef: checkoutservice
                          sources:
                            - spec:
                                connectorRef: "${var.connectorRef}"
                                imagePath: "nikpap/boutique"
                                tag: "checkoutservice"
                              identifier: checkoutservice
                              type: DockerRegistry
                      variables:
                        - name: service_account
                          type: String
                          value: checkoutservice
                        - name: service_type
                          type: String
                          value: ClusterIP
                        - name: service_port
                          type: String
                          value: 5050
                        - name: service_target_port
                          type: String
                          value: 5050
                        - name: service_port_name
                          type: String
                          value: grpc
                        - name: container_port
                          type: String
                          value: 5050
                        - name: container_requests_cpu
                          type: String
                          value: 100m
                        - name: container_requests_memory
                          type: String
                          value: 64Mi
                        - name: container_limits_cpu
                          type: String
                          value: 200m
                        - name: container_limits_memory
                          type: String
                          value: 128Mi
                    type: Kubernetes
                  gitOpsEnabled: false
              EOT
}



resource "harness_platform_service" "currencyservice" {
  identifier  = "currencyservice"
  name        = "currencyservice"
  org_id      = "${var.org}"
  project_id  = "${var.project}"
  description = "ad service for the boutique app"
  yaml = <<-EOT
                service:
                  name: currencyservice
                  identifier: currencyservice
                  orgIdentifier: "${var.org}"
                  projectIdentifier: "${var.project}"
                  serviceDefinition:
                    spec:
                      manifests:
                        - manifest:
                            identifier: manifest1
                            type: K8sManifest
                            spec:
                              store:
                                type: HarnessCode
                                spec:
                                  gitFetchType: Branch
                                  paths:
                                    - k8s-deploy/manifests
                                  repoName: harness_boutique
                                  branch: main
                              valuesPaths:
                                - k8s-deploy/values.yaml
                              skipResourceVersioning: false

                      artifacts:
                        primary:
                          primaryArtifactRef: currencyservice
                          sources:
                            - spec:
                                connectorRef: "${var.connectorRef}"
                                imagePath: "nikpap/boutique"
                                tag: "currencyservice"
                              identifier: currencyservice
                              type: DockerRegistry
                      variables:
                        - name: service_account
                          type: String
                          value: currencyservice
                        - name: service_type
                          type: String
                          value: ClusterIP
                        - name: service_port
                          type: String
                          value: 7000
                        - name: service_target_port
                          type: String
                          value: 7000
                        - name: service_port_name
                          type: String
                          value: grpc
                        - name: container_port
                          type: String
                          value: 7000
                        - name: container_requests_cpu
                          type: String
                          value: 100m
                        - name: container_requests_memory
                          type: String
                          value: 64Mi
                        - name: container_limits_cpu
                          type: String
                          value: 200m
                        - name: container_limits_memory
                          type: String
                          value: 128Mi
                    type: Kubernetes
                  gitOpsEnabled: false
              EOT
}





resource "harness_platform_service" "emailservice" {
  identifier  = "emailservice"
  name        = "emailservice"
  org_id      = "${var.org}"
  project_id  = "${var.project}"
  description = "ad service for the boutique app"
  yaml = <<-EOT
                service:
                  name: emailservice
                  identifier: emailservice
                  orgIdentifier: "${var.org}"
                  projectIdentifier: "${var.project}"
                  serviceDefinition:
                    spec:
                      manifests:
                        - manifest:
                            identifier: manifest1
                            type: K8sManifest
                            spec:
                              store:
                                type: HarnessCode
                                spec:
                                  gitFetchType: Branch
                                  paths:
                                    - k8s-deploy/manifests
                                  repoName: harness_boutique
                                  branch: main
                              valuesPaths:
                                - k8s-deploy/values.yaml
                              skipResourceVersioning: false

                      artifacts:
                        primary:
                          primaryArtifactRef: emailservice
                          sources:
                            - spec:
                                connectorRef: "${var.connectorRef}"
                                imagePath: "nikpap/boutique"
                                tag: "emailservice"
                              identifier: emailservice
                              type: DockerRegistry
                      variables:
                        - name: service_account
                          type: String
                          value: emailservice
                        - name: service_type
                          type: String
                          value: ClusterIP
                        - name: service_port
                          type: String
                          value: 5000
                        - name: service_target_port
                          type: String
                          value: 8080
                        - name: service_port_name
                          type: String
                          value: grpc
                        - name: container_port
                          type: String
                          value: 8080
                        - name: container_requests_cpu
                          type: String
                          value: 100m
                        - name: container_requests_memory
                          type: String
                          value: 64Mi
                        - name: container_limits_cpu
                          type: String
                          value: 200m
                        - name: container_limits_memory
                          type: String
                          value: 128Mi
                    type: Kubernetes
                  gitOpsEnabled: false
              EOT
}



resource "harness_platform_service" "paymentservice" {
  identifier  = "paymentservice"
  name        = "paymentservice"
  org_id      = "${var.org}"
  project_id  = "${var.project}"
  description = "paymentservice service for the boutique app"
  yaml = <<-EOT
                service:
                  name: paymentservice
                  identifier: paymentservice
                  orgIdentifier: "${var.org}"
                  projectIdentifier: "${var.project}"
                  serviceDefinition:
                    spec:
                      manifests:
                        - manifest:
                            identifier: manifest1
                            type: K8sManifest
                            spec:
                              store:
                                type: HarnessCode
                                spec:
                                  gitFetchType: Branch
                                  paths:
                                    - k8s-deploy/manifests
                                  repoName: harness_boutique
                                  branch: main
                              valuesPaths:
                                - k8s-deploy/values.yaml
                              skipResourceVersioning: false

                      artifacts:
                        primary:
                          primaryArtifactRef: paymentservice
                          sources:
                            - spec:
                                connectorRef: "${var.connectorRef}"
                                imagePath: "nikpap/boutique"
                                tag: "paymentservice"
                              identifier: paymentservice
                              type: DockerRegistry
                      variables:
                        - name: service_account
                          type: String
                          value: paymentservice
                        - name: service_type
                          type: String
                          value: ClusterIP
                        - name: service_port
                          type: String
                          value: 50051
                        - name: service_target_port
                          type: String
                          value: 50051
                        - name: service_port_name
                          type: String
                          value: grpc
                        - name: container_port
                          type: String
                          value: 50051
                        - name: container_requests_cpu
                          type: String
                          value: 100m
                        - name: container_requests_memory
                          type: String
                          value: 64Mi
                        - name: container_limits_cpu
                          type: String
                          value: 200m
                        - name: container_limits_memory
                          type: String
                          value: 128Mi
                    type: Kubernetes
                  gitOpsEnabled: false
              EOT
}



resource "harness_platform_service" "productcatalogservice" {
  identifier  = "productcatalogservice"
  name        = "productcatalogservice"
  org_id      = "${var.org}"
  project_id  = "${var.project}"
  description = "productcatalogservice service for the boutique app"
  yaml = <<-EOT
                service:
                  name: productcatalogservice
                  identifier: productcatalogservice
                  orgIdentifier: "${var.org}"
                  projectIdentifier: "${var.project}"
                  serviceDefinition:
                    spec:
                      manifests:
                        - manifest:
                            identifier: manifest1
                            type: K8sManifest
                            spec:
                              store:
                                type: HarnessCode
                                spec:
                                  gitFetchType: Branch
                                  paths:
                                    - k8s-deploy/manifests
                                  repoName: harness_boutique
                                  branch: main
                              valuesPaths:
                                - k8s-deploy/values.yaml
                              skipResourceVersioning: false

                      artifacts:
                        primary:
                          primaryArtifactRef: productcatalogservice
                          sources:
                            - spec:
                                connectorRef: "${var.connectorRef}"
                                imagePath: "nikpap/boutique"
                                tag: "productcatalogservice"
                              identifier: productcatalogservice
                              type: DockerRegistry
                      variables:
                        - name: service_account
                          type: String
                          value: productcatalogservice
                        - name: service_type
                          type: String
                          value: ClusterIP
                        - name: service_port
                          type: String
                          value: 3550
                        - name: service_target_port
                          type: String
                          value: 3550
                        - name: service_port_name
                          type: String
                          value: grpc
                        - name: container_port
                          type: String
                          value: 3550
                        - name: container_requests_cpu
                          type: String
                          value: 100m
                        - name: container_requests_memory
                          type: String
                          value: 64Mi
                        - name: container_limits_cpu
                          type: String
                          value: 200m
                        - name: container_limits_memory
                          type: String
                          value: 128Mi
                    type: Kubernetes
                  gitOpsEnabled: false
              EOT
}





resource "harness_platform_service" "shippingservice" {
  identifier  = "shippingservice"
  name        = "shippingservice"
  org_id      = "${var.org}"
  project_id  = "${var.project}"
  description = "shippingservice service for the boutique app"
  yaml = <<-EOT
                service:
                  name: shippingservice
                  identifier: shippingservice
                  orgIdentifier: "${var.org}"
                  projectIdentifier: "${var.project}"
                  serviceDefinition:
                    spec:
                      manifests:
                        - manifest:
                            identifier: manifest1
                            type: K8sManifest
                            spec:
                              store:
                                type: HarnessCode
                                spec:
                                  gitFetchType: Branch
                                  paths:
                                    - k8s-deploy/manifests
                                  repoName: harness_boutique
                                  branch: main
                              valuesPaths:
                                - k8s-deploy/values.yaml
                              skipResourceVersioning: false

                      artifacts:
                        primary:
                          primaryArtifactRef: shippingservice
                          sources:
                            - spec:
                                connectorRef: "${var.connectorRef}"
                                imagePath: "nikpap/boutique"
                                tag: "shippingservice"
                              identifier: shippingservice
                              type: DockerRegistry
                      variables:
                        - name: service_account
                          type: String
                          value: shippingservice
                        - name: service_type
                          type: String
                          value: ClusterIP
                        - name: service_port
                          type: String
                          value: 50051
                        - name: service_target_port
                          type: String
                          value: 50051
                        - name: service_port_name
                          type: String
                          value: grpc
                        - name: container_port
                          type: String
                          value: 50051
                        - name: container_requests_cpu
                          type: String
                          value: 100m
                        - name: container_requests_memory
                          type: String
                          value: 64Mi
                        - name: container_limits_cpu
                          type: String
                          value: 200m
                        - name: container_limits_memory
                          type: String
                          value: 128Mi
                    type: Kubernetes
                  gitOpsEnabled: false
              EOT
}





resource "harness_platform_service" "recommendationservice" {
  identifier  = "recommendationservice"
  name        = "recommendationservice"
  org_id      = "${var.org}"
  project_id  = "${var.project}"
  description = "recommendationservice service for the boutique app"
  yaml = <<-EOT
                service:
                  name: recommendationservice
                  identifier: recommendationservice
                  orgIdentifier: "${var.org}"
                  projectIdentifier: "${var.project}"
                  serviceDefinition:
                    spec:
                      manifests:
                        - manifest:
                            identifier: manifest1
                            type: K8sManifest
                            spec:
                              store:
                                type: HarnessCode
                                spec:
                                  gitFetchType: Branch
                                  paths:
                                    - k8s-deploy/manifests
                                  repoName: harness_boutique
                                  branch: main
                              valuesPaths:
                                - k8s-deploy/values.yaml
                              skipResourceVersioning: false

                      artifacts:
                        primary:
                          primaryArtifactRef: recommendationservice
                          sources:
                            - spec:
                                connectorRef: "${var.connectorRef}"
                                imagePath: "nikpap/boutique"
                                tag: "recommendationservice"
                              identifier: recommendationservice
                              type: DockerRegistry
                      variables:
                        - name: service_account
                          type: String
                          value: recommendationservice
                        - name: service_type
                          type: String
                          value: ClusterIP
                        - name: service_port
                          type: String
                          value: 8080
                        - name: service_target_port
                          type: String
                          value: 8080
                        - name: service_port_name
                          type: String
                          value: grpc
                        - name: container_port
                          type: String
                          value: 8080
                        - name: container_requests_cpu
                          type: String
                          value: 100m
                        - name: container_requests_memory
                          type: String
                          value: 64Mi
                        - name: container_limits_cpu
                          type: String
                          value: 200m
                        - name: container_limits_memory
                          type: String
                          value: 128Mi
                    type: Kubernetes
                  gitOpsEnabled: false
              EOT
}





resource "harness_platform_service" "cartservice" {
  identifier  = "cartservice"
  name        = "cartservice"
  org_id      = "${var.org}"
  project_id  = "${var.project}"
  description = "cartservice service for the boutique app"
  yaml = <<-EOT
                service:
                  name: cartservice
                  identifier: cartservice
                  orgIdentifier: "${var.org}"
                  projectIdentifier: "${var.project}"
                  serviceDefinition:
                    spec:
                      manifests:
                        - manifest:
                            identifier: manifest1
                            type: K8sManifest
                            spec:
                              store:
                                type: HarnessCode
                                spec:
                                  gitFetchType: Branch
                                  paths:
                                    - k8s-deploy/manifests
                                  repoName: harness_boutique
                                  branch: main
                              valuesPaths:
                                - k8s-deploy/values.yaml
                              skipResourceVersioning: false

                      artifacts:
                        primary:
                          primaryArtifactRef: cartservice
                          sources:
                            - spec:
                                connectorRef: "${var.connectorRef}"
                                imagePath: "nikpap/boutique"
                                tag: "cartservice"
                              identifier: cartservice
                              type: DockerRegistry
                      variables:
                        - name: service_account
                          type: String
                          value: cartservice
                        - name: service_type
                          type: String
                          value: ClusterIP
                        - name: service_port
                          type: String
                          value: 7070
                        - name: service_target_port
                          type: String
                          value: 7070
                        - name: service_port_name
                          type: String
                          value: grpc
                        - name: container_port
                          type: String
                          value: 7070
                        - name: container_requests_cpu
                          type: String
                          value: 100m
                        - name: container_requests_memory
                          type: String
                          value: 64Mi
                        - name: container_limits_cpu
                          type: String
                          value: 200m
                        - name: container_limits_memory
                          type: String
                          value: 128Mi
                    type: Kubernetes
                  gitOpsEnabled: false
              EOT
}



resource "harness_platform_service" "rediscart" {
  identifier  = "rediscart"
  name        = "rediscart"
  org_id      = "${var.org}"
  project_id  = "${var.project}"
  description = "rediscart service for the boutique app"
  yaml = <<-EOT
                service:
                  name: rediscart
                  identifier: rediscart
                  orgIdentifier: "${var.org}"
                  projectIdentifier: "${var.project}"
                  serviceDefinition:
                    spec:
                      manifests:
                        - manifest:
                            identifier: manifest1
                            type: K8sManifest
                            spec:
                              store:
                                type: HarnessCode
                                spec:
                                  gitFetchType: Branch
                                  paths:
                                    - k8s-deploy/redis/manifests
                                  repoName: harness_boutique
                                  branch: main
                              skipResourceVersioning: false
                    type: Kubernetes
                  gitOpsEnabled: false
              EOT
}



resource "harness_platform_service" "frontend" {
  identifier  = "frontend"
  name        = "frontend"
  org_id      = "${var.org}"
  project_id  = "${var.project}"
  description = "frontend service for the boutique app"
  yaml = <<-EOT
                service:
                  name: frontend
                  identifier: frontend
                  orgIdentifier: "${var.org}"
                  projectIdentifier: "${var.project}"
                  serviceDefinition:
                    spec:
                      manifests:
                        - manifest:
                            identifier: manifest1
                            type: K8sManifest
                            spec:
                              store:
                                type: HarnessCode
                                spec:
                                  gitFetchType: Branch
                                  paths:
                                    - k8s-deploy/frontend/manifests
                                  repoName: harness_boutique
                                  branch: main
                              valuesPaths:
                                - k8s-deploy/frontend/values.yaml
                              skipResourceVersioning: false

                      artifacts:
                        primary:
                          primaryArtifactRef: frontend
                          sources:
                            - spec:
                                connectorRef: "${var.connectorRef}"
                                imagePath: "nikpap/boutique"
                                tag: "frontend"
                              identifier: frontend
                              type: DockerRegistry
                      variables:
                        - name: service_account
                          type: String
                          value: frontend
                        - name: service_type
                          type: String
                          value: ClusterIP
                        - name: service_port
                          type: String
                          value: 80
                        - name: service_target_port
                          type: String
                          value: 8080
                        - name: service_port_name
                          type: String
                          value: grpc
                        - name: container_port
                          type: String
                          value: 8080
                        - name: container_requests_cpu
                          type: String
                          value: 100m
                        - name: container_requests_memory
                          type: String
                          value: 64Mi
                        - name: container_limits_cpu
                          type: String
                          value: 200m
                        - name: container_limits_memory
                          type: String
                          value: 128Mi
                    type: Kubernetes
                  gitOpsEnabled: false
              EOT
}
