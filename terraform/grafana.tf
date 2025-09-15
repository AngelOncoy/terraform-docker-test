resource "docker_container" "grafana" {
  image = "grafana/grafana"
  name  = "grafana"
  ports {
    external = var.web_server_port_external_grafana
    internal = 3000
  }
  networks_advanced {
    name = docker_network.monitor_net.name
  }
}