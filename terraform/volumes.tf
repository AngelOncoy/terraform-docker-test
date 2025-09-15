# Persistencia de datos de Grafana (dashboards, datasources, etc.)
resource "docker_volume" "grafana_data" {
  name = "${var.env_prefix}-grafana-data"
}
