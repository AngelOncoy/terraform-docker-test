
resource "docker_container" "app1" {
  image = "nginx"
  name  = "nginx_stable-bookworm-perl"
  ports {
    external = var.web_server_ports_external_app1
    internal = 80
  }
  networks_advanced {
    name = docker_network.app_net.name
  }
}

resource "docker_container" "app2" {
  image = "nginx"
  name  = "nginx_perl"
  ports {
    external = var.web_server_ports_external_app2
    internal = 80
  }
  networks_advanced {
    name = docker_network.app_net.name
  }
}

resource "docker_container" "app3" {
  image = "nginx"
  name  = "nginx_mainline-perl"
  ports {
    external = var.web_server_ports_external_app3
    internal = 80
  }
  networks_advanced {
    name = docker_network.app_net.name
  }
}

