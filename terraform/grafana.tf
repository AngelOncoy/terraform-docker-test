resource "docker_image" "grafana" {
  name = "grafana/grafana:11.1.0"
}

resource "docker_container" "grafana" {
  name    = "${var.env_prefix}-grafana"
  image   = docker_image.grafana.image_id
  restart = "unless-stopped"

  env = [
    "GF_SECURITY_ADMIN_USER=${var.grafana_admin_user}",
    "GF_SECURITY_ADMIN_PASSWORD=${var.grafana_admin_password}"
  ]

  # Persistencia
  mounts {
    target = "/var/lib/grafana"
    source = docker_volume.grafana_data.name
    type   = "volume"
  }

  # Publicar puerto al host
  ports {
    internal = 3000
    external = var.grafana_port
  }

  # Conectar a monitor_net (si luego agregas Prometheus aquí, ya están juntos)
  networks_advanced {
    name    = docker_network.monitor_net.name
    aliases = ["grafana"]
  }

  # (Opcional) Conectar también a app_net si quieres alcanzar servicios internos de apps
  # networks_advanced {
  #   name = docker_network.app_net.name
  # }
}

output "grafana_url" {
  value = "http://localhost:${var.grafana_port}"
}
