resource "docker_network" "monitor_net" {
  name = "${var.env_prefix}-monitor_net"
}
